%% Antenna Dipole Code
clear all
close all
addpath(genpath('D:\SpectralBook\bookfuncs\matlab')) %%CST 

%% Parameters
jay=sqrt(-1);        %Unidade imaginaria 
cc=2.997925e8;        %Velocidade da luz
e0=8.854223e-12;  %Permissividade absoluta do meio
u0=1.256640e-6;       %Permeabilidade absoluta do meio
eta=sqrt(u0/e0);       %Impedancia do meio
f0=3e9 ;                  % Observation frequency
Lamb0=cc/f0 ;              % Observation wavelength
Nq=96;           %Numero de pontos na frequencia
Z0ref=50;  %Reference Impedance Generator
Fs=80e9;  %% FFT sampling frequency
Nfft=1025; %% NFFT sampling frequency
DeltaFs=Fs/(Nfft-1)/1e6; % Delta Fs
f=Fs/2*linspace(-1,1,Nfft);
f_inicial=0.1e9;      %Frequencia inicial de analise do dipolo
[~,id0]=min(abs(f-0));
% [~,idf]=min(abs(f-f_final));
freq=f(id0+1:end);
Lambda=cc./freq; 
k=2.*pi.*freq.*sqrt(e0.*u0);
%% RLC Series 
type='Series'
R1=50;
R2=50;
Lind=1e-9;
Lind2=0.4e-9;
Cap=[1e-12];
Cap2=[0.1e-12];
[LIND,CAP,FREQ]=meshgrid(Lind,Cap,freq);

[LIND2,CAP2,FREQ]=meshgrid(Lind2,Cap2,freq);

Z1=createRLC(FREQ,type,R1,LIND,CAP);
Z2=createRLC(FREQ,type,R2,LIND2,CAP2);

FRES=1./sqrt(CAP.*LIND)/   (2*pi)/1e9
FRES2=1./sqrt(CAP2.*LIND2)/(2*pi)/1e9
Zcirc=addElecComponent('Shunt',Z1,Z2);
% Zcirc=Z2;


%% RLC Series - Parametric 
Captarget=1e-12
[~,idcap]=min(abs(Cap-Captarget));
Zeq=squeeze(Zcirc(idcap,:,:));
Gamma1=gammaFromZ(Z0ref,Zeq);
% S11Circ=Zeq;


%%%Impedance 
figure,
plotZfreq(freq/1e9,Zeq.',[-100 200],string(Lind))
figure,
plotFDdBParametric(freq,Gamma1,Lind)

%% RC Series -Parametric Capacitance - RC Load (High Pass filter)
Restarget=5;
[~,idl]=min(abs(R1-Restarget));
Zeq=squeeze(Zcirc(:,idl,:));
S11Circ=(Zeq-Z0ref)./(Zeq+Z0ref);

figure,
plotZfreq(freq/1e9,Zeq.',[-100 200],string(Lind))
figure,
plotFDdBParametric(freq,S11Circ,Lind)

%% Single RC values
Captarget=1e-12
[~,idcap]=min(abs(Cap-Captarget));
Ltarget=0
[~,idl]=min(abs(Lind-Ltarget));
Zirc=Z1;
Zeq=squeeze(Z1(idcap,idl,:)).';
Gamma=gammaFromZ(Z0ref,Zeq);


figure,
plot(freq/1e9,20*log10(abs(Gamma))),hold on
% plot(freq/1e9,20*log10(abs(squeeze(SS1eq)))),hold on

% figure,
% plot(freq/1e9,180/pi*(angle(squeeze(SS1eq)))),hold on

s11_fit_data = rationalfit(freq,Gamma)
fresp = freqresp(s11_fit_data,freq);

figure,
plot(freq/1e9,20*log10(abs(squeeze(Gamma))),freq/1e9,20*log10(abs(squeeze(fresp))))

[z,p,k,dcgain] = zpk(s11_fit_data)
% -omegazero(1)/(2*pi)/1e9
% -z/(2*pi)/1e9
% omegapole(1)
% -p/(2*pi)/1e9

%% Time Doamin
S11Nfreq=[fliplr(conj(Gamma)),Gamma(1),Gamma];

deltat=1/Fs;

Nt=1025;
BW=30e9;
tau=1/BW;
td=-26*tau;
t0=-1e-9;
tf=Nt*deltat;
t=linspace(t0,tf,Nt);
Vinc=gaussinaSignal(t,tau,td);
VSinc=fftshift(fft(Vinc,Nfft));

VSreflected=S11Nfreq.*VSinc;
VS=(Vinc+VSreflected);
IS=(Vinc-VSreflected)./Z0ref;
Vreflected=ifft(ifftshift(VSreflected));
Vtd=ifft(ifftshift(VS));
Itd=ifft(ifftshift(IS));


figure,
subplot 221

plot(t/1e-9,Vinc,t/1e-9,Vreflected)
title('Vinc/Vreflected Signal')
xlabel('Time (ns)','fontsize',10,'fontweight','b');
ylabel('Amplitude (V)','fontsize',10,'fontweight','b');
xlim([-1 0])
legend('Vinc','Vreflected')

subplot 222
title('Voltage/Current ')
yyaxis left
plot(t/1e-9,real(Vtd))
ylabel('Amplitude (V)','fontsize',10,'fontweight','b');
yyaxis right
plot(t/1e-9,real(Itd))
xlabel('Time (ns)','fontsize',10,'fontweight','b');
ylabel('Current (A)','fontsize',10,'fontweight','b');
xlim([-1 0])
legend('Voltage','Current')

subplot 223
plot(f/1e9,20*log10(abs((VSinc)))), hold on
plot(f/1e9,20*log10(abs((VSreflected)))), hold on
plot(f/1e9,20*log10(abs((VS)))), hold on
title('Mag VSinc')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (V)','fontsize',10,'fontweight','b');
legend('Vinc','Vreflected','VS')

subplot 224
title('Phase VSinc')
plot(f/1e9,180/pi*angle(fftshift(VSinc))),hold on
plot(f/1e9,180/pi*angle(fftshift(VSreflected))),hold on
plot(f/1e9,180/pi*angle(fftshift(VS))),hold on

xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');
legend('Vinc','Vreflected','VS')

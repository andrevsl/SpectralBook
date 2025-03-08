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
%% RC Series 
type='Series'
Res=[0,10,40,70,100];
Cap=[0.001*1e-12,0.01*1e-12,0.1*1e-12,1*1e-12];
[RES,CAP,FREQ]=meshgrid(Res,Cap,freq);
% fres=1/sqrt(Lind*Cap);
Zin=1./(1j*2*pi*FREQ.*CAP);
Zcirc=addElecComponent(type,Zin,RES);

%% RC Series -Parametric Resistance - RC Load (High Pass filter)
Captarget=1e-12
[~,idcap]=min(abs(Cap-Captarget));
Zeq=squeeze(Zcirc(idcap,:,:));
S11Circ=(Zeq-Z0ref)./(Zeq+Z0ref);

%%%Impedance 
figure,
plotZfreq(freq/1e9,Zeq.',[-100 200],string(Res))
figure,
plotFDdBParametric(freq,S11Circ,Res)

%% RC Series -Parametric Capacitance - RC Load (High Pass filter)
Restarget=0;
[~,idr]=min(abs(Res-Restarget));
Zeq=squeeze(Zcirc(:,idr,:));
S11Circ=(Zeq-Z0ref)./(Zeq+Z0ref);
VGain=1+S11Circ;

figure,
plotZfreq(freq/1e9,Zeq.',[-100 200],string(Cap))

figure,
plotFDdBParametric(freq,S11Circ,Cap)
% sgtitle(['Parametric Res Cap=',string(Captarget)])


%% Single RC values
Captarget=1e-12
[~,idcap]=min(abs(Cap-Captarget));
Restarget=0
[~,idr]=min(abs(Res-Restarget));
Zeq=squeeze(Zcirc(idcap,idr,:)).';

R=0
 1/(Captarget*(R-Z0ref))/1e9/(2*pi)
 1/(Captarget*(R+Z0ref))/1e9/(2*pi)

omegapole=-1./(CAP(idcap,idr,:).*(RES(idcap,idr,:)+Z0ref));
omegazero=-1./(CAP(idcap,idr,:).*(RES(idcap,idr,:)-Z0ref));

S11Circ=(Zeq-Z0ref)./(Zeq+Z0ref);
SS1eq=(1+j*2*pi*FREQ(idcap,idr,:).*CAP(idcap,idr,:).*(RES(idcap,idr,:)-Z0ref))./(1+j*2*pi*FREQ(idcap,idr,:).*CAP(idcap,idr,:).*(RES(idcap,idr,:)+Z0ref))
% SS1eq=(1)./(1+j*2*pi*FREQ(idcap,idr,:).*CAP(idcap,idr,:).*(RES(idcap,idr,:)+Z0ref))
% SS1eq=(1+j*2*pi*FREQ(idcap,idr,:).*CAP(idcap,idr,:).*(RES(idcap,idr,:)-Z0ref))


figure,
plot(freq/1e9,20*log10(abs(S11Circ))),hold on
plot(freq/1e9,20*log10(abs(squeeze(SS1eq)))),hold on

figure,
plot(freq/1e9,180/pi*(angle(squeeze(SS1eq)))),hold on

s11_fit_data = rational(freq,S11Circ)
fresp = freqresp(s11_fit_data,freq);

figure,
plot(freq/1e9,20*log10(abs(squeeze(S11Circ))),freq/1e9,20*log10(abs(squeeze(fresp))))

[z,p,k,dcgain] = zpk(s11_fit_data)
-omegazero(1)/(2*pi)/1e9
-z/(2*pi)/1e9
omegapole(1)
-p/(2*pi)/1e9
%% Time Doamin
S11Nfreq=[fliplr(conj(S11Circ)),S11Circ(1),S11Circ];
S11Nfreq=[fliplr(conj(squeeze(SS1eq).')),S11Circ(1),squeeze(SS1eq).'];

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

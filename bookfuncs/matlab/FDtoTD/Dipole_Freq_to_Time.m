%% Antenna Dipole Code
clear all
addpath(genpath('H:\Meu Drive\SocieForParaOPlay\SpectralBook\bookfuncs\matlab')) %%CST API
Path='H:\Meu Drive\SocieForParaOPlay\SpectralBook\bookfuncs\matlab\MatlabSimuOutputs\'
%% Parameters
jay=sqrt(-1);        %Unidade imaginaria 
cc=2.997925e8;        %Velocidade da luz
e0=8.854223e-12;  %Permissividade absoluta do meio
u0=1.256640e-6;       %Permeabilidade absoluta do meio
eta=sqrt(u0/e0);       %Impedancia do meio
f0=3e9 ;                  % Observation frequency
Lamb0=cc/f0 ;              % Observation wavelength
Ld=Lamb0/10;                 % Dipole Length
Wd=Lamb0/1000 ;              % Dipole Width
Nq=96;           %Numero de pontos na frequencia
RefZ0=50;  %Reference Impedance Generator
Fs=50e9;  %% FFT sampling frequency
Nfft=1025; %% NFFT sampling frequency
DeltaFs=Fs/(Nfft-1)/1e6; % Delta Fs
f=Fs/2*linspace(-1,1,Nfft);
f_inicial=0.1e9;      %Frequencia inicial de analise do dipolo
[~,id0]=min(abs(f-0));
% [~,idf]=min(abs(f-f_final));
freq=f(id0+1:end);
Lambda=cc./f; 
k=2.*pi.*f.*sqrt(e0.*u0);
d = dipole(Length=Ld,Width=Wd);
f(id0)

%% S-Parameters
spar=sparameters(d,freq,RefZ0)
% rfwrite(spar,[Path,'dipole.s2p'])
s11=squeeze(spar.Parameters).'

figure
rfplot(spar)
%%
s11nfreq=[fliplr(conj(s11)),s11(1),s11];
figure
plot(f/1e9,20*log10(abs(fftshift(s11nfreq))))
title('Voltage Time Signal')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (V)','fontsize',10,'fontweight','b');
%% Time Reversal Setting
deltat=1/Fs;
Nt=1025;
BW=20e9;
tau=1/BW;
td=-2*tau;
t0=-1e-9;
tf=Nt*deltat;
t=linspace(t0,tf,Nt);
Vinc=gaussinaSignal(t,tau,td);
VSinc=fftshift(fft(Vinc,Nfft));
VSreflected=s11nfreq.*VSinc
Vreflected=ifft(ifftshift(VSreflected))

figure,
subplot 221
plot(t/1e-9,Vinc,t/1e-9,Vreflected)
title('Voltage Time Signal')
xlabel('Time (ns)','fontsize',10,'fontweight','b');
ylabel('Amplitude (V)','fontsize',10,'fontweight','b');
xlim([-1 4])

subplot 222
plot(t/1e-9,real(Vreflected),t/1e-9,imag(Vreflected))
title('Phase Vreclected')
xlabel('Time (ns)','fontsize',10,'fontweight','b');
ylabel('Amplitude (V)','fontsize',10,'fontweight','b');

subplot 223
plot(f/1e9,20*log10(abs((VSinc))))
title('Mag VSinc')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (V)','fontsize',10,'fontweight','b');

subplot 224
title('Phase VSinc')
plot(f/1e9,180/pi*angle(fftshift(VSinc)))
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');
%% Plot Dipole Impedance
z11=squeeze(s2z(s11));
zlim=[-2000,2000]
plotZfreq(freq,z11,zlim)

%% Smith chart
clear h
addMatching
figure
h=smithplot(spar), hold on
% t=text(radius-0.5,-0.7,'CW Toward Generator')
% t(1).Color = 'black';
% t(1).FontSize = 16;
% set(t,'Rotation',90);
% t2=text(-radius+0.5,-0.5,'CCW Toward Load')
% t2(1).Color = 'black';
% t2(1).FontSize = 16;
% set(t2,'Rotation',90);


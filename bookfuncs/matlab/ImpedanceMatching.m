%% Antenna Dipole Code
clear all
addpath(genpath('D:\SpectralBook\bookfuncs\matlab')) %%CST API
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
spardipole=sparameters(d,freq,RefZ0)
rfplot(spardipole)
% rfwrite(spar,[Path,'dipole.s2p'])
s11Dipole=squeeze(spardipole.Parameters).';
zinDipole=squeeze(s2z(s11Dipole));

% s_rat = rational(spardipole);
% z_rat = rational(freq,z11);
% [z,p,k,dcgain] = zpk(z_rat)



%% Matlab Circuit
ant=nport(spardipole)
ckt_lumped = circuit;
Inductance=1e-10
hC1= add(ckt_lumped,[1 0],inductor(Inductance));
add(ckt_lumped,[1 0],ant)
setports(ckt_lumped,[1 0])

lumped_s = sparameters(ckt_lumped,freq);
zinNW=squeeze(s2z(squeeze(lumped_s.Parameters)));

rtarget=30;
[~,idr]=min(abs(rtarget-real(zinDipole)))
ftarget=freq

% rfplot(spardipole), hold on
% rfplot(lumped_s)
zlim=[-2000,2000]
figure,
plotZfreq(freq,zinDipole,zlim)
plotZfreq(freq,zinNW,zlim)
subplot 311
text(freq(idr),real(zinDipole(idr)),['\leftarrow ',string(rtarget)])

%% SmithPlot
type='Series'
Lind=1e-9;
Z=j*2*pi*freq*Lind;
ZinNew=addElecComponent(type,zinDipole.',Z);
smatchingData=squeeze(z2s(squeeze(ZinNew)));
smatchingNW = sparameters(smatchingData,freq);
s11matchingNW=squeeze(smatchingNW.Parameters(1,1,:));

%% Single Frenquency
rtarget=30;
[~,idr]=min(abs(rtarget-real(zinDipole)));
ftarget=freq(idr);
type='Shunt'
% Nspoints=length(Zmatching);
Nspoints=1000;
Nspointsvec=[1:Nspoints+1];
Lind=linspace(1e-9,0.9e-9,Nspoints);
Zmatching=j*2*pi*ftarget*Lind;

ZinNew=addElecComponent(type,zinDipole(idr),Zmatching);
smatchingData=squeeze(z2s(squeeze(ZinNew)));
smatchingData=reshape([s11Dipole(idr),smatchingData.'],[1 1 Nspoints+1]);
smatchingTargetF = sparameters(smatchingData,Nspointsvec);
s11DipoleTargetF=sparameters(s11Dipole(idr),ftarget);

figure
h=smithplot(s11DipoleTargetF,'Color','B','LineWidth',2), hold on
h=smithplot(smatchingTargetF,'Color','g','LineWidth',2)
h.Marker = {'+','s'};
% legend('Dipole','DipoleMatched')

%% All Frequencies Points
figure
h=plotSpar(freq/1e9,s11Dipole,[0 25])
h=plotSpar(freq/1e9,s11matchingNW,[0 25])

figure
h=smithplot(s11Dipole), hold on
h=smithplot(smatchingNW)
leg=['Dipole','DipoleMatched']
set(leg,'Visible','on');
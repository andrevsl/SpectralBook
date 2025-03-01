clear all
% close all
%% Posições user
PtdBm= 10*log10(100e-3)+30% Potência de Transmissão de 100 mW
Gap=18   %%% Gain AP (dB)
Guser=0   %%% Gain user (dB)
f=4e9;  %% frequency
Lambda=3e8/f; %%frequency
L=(Lambda)*[1:100];          %Comprimento em x(m) da RIS
W=L;          %Largura em y(m) RIS

ph=-45;  % Azimuth do usuario em relação a RIS
R=70;  % Raio posição usuario em relação a RIS
RCSris=10*log10(4*pi.*(L.*W./Lambda).^2) %%Maximo RCS RCS RIS Passive (dB)
RCSrisAct=RCSris+30   %%% RCS RIS Active (dB)
KnifeLoss=32 %% Knife Loss

BW=20e6;%% Bandwidth
K=1.380649e-23  %% Boltzman constant
T=290; %% Temperature
nf_dB=9; % Noise Figure
Noise=BW*K*10^(nf_dB/10); %% Noise
NdB=10*log10(Noise)+30 %% Noise dBm'
% Altura do usuário 1.5m
% altura da AP 15 m
% Altura da RIS 10 m

posap=[100,200,0] %% Posição AP
posris=[0,0,0] %% Posição RIS
posuser=[R*sin(ph*pi/180),R*cos(ph*pi/180),0];  %% Posição usuário 1 

d1=posuser-posap; %%% vetor distancia entre User e AP
R1=sqrt(sum(d1.^2)); %%% Distancia entre User e AP
d2=posris-posap;
R2=sqrt(sum(d2.^2)); %%% Distancia entre RIS e AP
d3=posuser-posris;
R3=sqrt(sum(d3.^2)); %%% Distancia entre User e AP

% userthph=[atan(R3(1)/R3(2))*180/pi,acos(R3(3)/R3abs)*180/pi-90] ;
%% LOS
Prx_LOSdBm=PtdBm+Gap+Guser+20*log10(Lambda./(4*pi*R1))+zeros(size(RCSris));
Prx_LOS=10.^((Prx_LOSdBm-30)/10)

%% LOS Knife Edge
Prx_LOSKnifedBm=PtdBm+Gap+Guser+20*log10(Lambda./(4*pi*R1))+zeros(size(RCSris))-KnifeLoss;
Prx_LOSKnife=10.^((Prx_LOSKnifedBm-30)/10)
%% Passive RIS
Prx_NLOSdBm=PtdBm+Gap+Guser+RCSris+20*log10(cos(ph))+20*log10(Lambda./(4*pi*R2*R3))
Prx_NLOS=10.^((Prx_NLOSdBm-30)/10)
%% Active RIS
Prx_NLOSactdBm=PtdBm+Gap+Guser+RCSrisAct+20*log10(cos(ph))+20*log10(Lambda./(4*pi*R2*R3))
Prx_NLOSact=10.^((Prx_NLOSactdBm-30)/10)
%% Combined LOS NOS
Prx_rispass=Prx_LOS+Prx_NLOS;
Prx_risact=Prx_LOS+Prx_NLOSact;
SNRLOS=Prx_LOS/Noise;
SNRNLOS=Prx_rispass/Noise;
SNRNAct=Prx_risact/Noise;
%% Spectral Efficiency
spectraleff_LOS=log2(1+SNRLOS)
spectraleff_NLOS=log2(1+SNRNLOS)
spectraleff_NLOSact=log2(1+SNRNAct)


figure,
plot(L/Lambda,spectraleff_LOS), hold on
plot(L/Lambda,spectraleff_NLOS),
plot(L/Lambda,spectraleff_NLOSact)

xlabel('RIS Side A^{1/2} \lambda ','FontSize',14,'FontWeight','bold')
ylabel('Spectral Efficiency (Bits/s/Hz)','FontSize',14,'FontWeight','bold')
legend({'LOS','LOS+NLOS RIS PASSIVE','LOS+NLOS RIS ACTIVE 10 dB'})
title(['Frequency ',num2str(f/1e9),' GHz'])
grid
%% Power Received
Prx_LOSdB=10*log10(Prx_LOS)+30;
Prx_NLOSdB=10*log10(Prx_rispass)+30;
Prx_NLOSactdB=10*log10(Prx_risact)+30;

figure,
plot(L/Lambda,Prx_LOSdB), hold on
plot(L/Lambda,Prx_NLOSdB),
plot(L/Lambda,Prx_NLOSactdB)

xlabel('RIS Side A^{1/2} \lambda ','FontSize',14,'FontWeight','bold')
ylabel('Power (dBm)','FontSize',14,'FontWeight','bold')
legend({'LOS','LOS+NLOS RIS PASSIVE','LOS+NLOS RIS ACTIVE 10 dB'})
title(['Frequency ',num2str(f/1e9),' GHz'])
%% Knife Loss
Prx_rispassKnife=Prx_LOSKnife+Prx_NLOS;
Prx_risactKnife=Prx_LOSKnife+Prx_NLOSact;
SNRLOSKnife=Prx_LOSKnife/Noise
SNRNLOSKnife=Prx_rispassKnife/Noise;
SNRNActKnife=Prx_risactKnife/Noise;
%% Spectral Efficiency
spectraleff_LOSKnife=log2(1+SNRLOSKnife)
spectraleff_NLOS=log2(1+SNRNLOSKnife)
spectraleff_NLOSact=log2(1+SNRNActKnife)
figure,
plot(L/Lambda,spectraleff_LOSKnife), hold on
plot(L/Lambda,spectraleff_NLOS),
plot(L/Lambda,spectraleff_NLOSact)

xlabel('RIS Side A^{1/2} \lambda ','FontSize',14,'FontWeight','bold')
ylabel('Spectral Efficiency (Bits/s/Hz)','FontSize',14,'FontWeight','bold')
legend({'LOS','LOS+NLOS RIS PASSIVE','LOS+NLOS RIS ACTIVE 10 dB'})
title(['Frequency ',num2str(f/1e9),' GHz Knife Edge Loss=',num2str(KnifeLoss),'dB'])

grid


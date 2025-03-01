clear all
% close all
%% Posições user
PtdBm= 10*log10(100e-3)+30% Potência de Transmissão de 100 mW
Gap=18   %%% Gain AP (dB)
Guser=0;   %%% Gain user (dB)
f=30e9;  %% frequency
Lambda=3e8/f; %%frequency
L=(Lambda)*[10];          %Comprimento em x(m) da RIS
W=L;          %Largura em y(m) RIS

ph1=0:75;  % Azimuth do usuario em relação a RIS
Ra1=10:500;  % Raio posição usuario em relação a RIS
[RA1,PH1]=meshgrid(Ra1,ph1);
RA1=reshape(RA1,[],1);
PH1=reshape(PH1,[],1);

RCSris=10*log10(4*pi.*(L.*W./Lambda).^2); %%Maximo RCS RCS RIS Passive (dB)
RCSrisAct=RCSris+10;   %%% RCS RIS Active (dB)
KnifeLoss=32 %% Knife Loss

BW=200e6;%% Bandwidth
K=1.380649e-23;  %% Boltzman constant
T=273+27;  %% Temperature
Noise=BW*K*T; %% Noise
NdB=10*log10(Noise)+30; %% Noise dBm'
% Altura do usuário 1.5m
% altura da AP 15 m
% Altura da RIS 10 m

posap=[100,200,0]; %% Posição AP
posris=[0,0,0]; %% Posição RIS
posuser=[RA1.*sin(PH1*pi/180),RA1.*cos(PH1*pi/180),zeros(size(RA1))];  %% Posição usuário 1 11

d1=posuser-posap; %%% vetor distancia entre User e AP
R1=sqrt(sum(d1.^2,2)); %%% Distancia entre User e AP
d2=posris-posap;
R2=sqrt(sum(d2.^2,2)); %%% Distancia entre RIS e AP
d3=posuser-posris;
R3=sqrt(sum(d3.^2,2)); %%% Distancia entre User e AP

% userthph=[atan(R3(1)/R3(2))*180/pi,acos(R3(3)/R3abs)*180/pi-90] ;
%% LOS
Prx_LOSdBm=PtdBm+Gap+Guser+20*log10(Lambda./(4*pi*R1))+zeros(size(RCSris));
Prx_LOS=10.^((Prx_LOSdBm-30)/10);

%% LOS Knife Edge
Prx_LOSKnifedBm=PtdBm+Gap+Guser+20*log10(Lambda./(4*pi*R1))+zeros(size(RCSris))-KnifeLoss;
Prx_LOSKnife=10.^((Prx_LOSKnifedBm-30)/10);
%% Passive RIS
Prx_NLOSdBm=PtdBm+Gap+Guser+RCSris+20*log10(cos(PH1))+20*log10(Lambda./(4*pi*R2*R3))
Prx_NLOS=10.^((Prx_NLOSdBm-30)/10);
%% Active RIS
Prx_NLOSactdBm=PtdBm+Gap+Guser+RCSrisAct+20*log10(cos(PH1))+20*log10(Lambda./(4*pi*R2*R3))
Prx_NLOSact=10.^((Prx_NLOSactdBm-30)/10);
%% Combined LOS NOS
Prx_rispass=Prx_LOS+Prx_NLOS;
Prx_risact=Prx_LOS+Prx_NLOSact;
SNRLOS=Prx_LOS/Noise;
SNRNLOS=Prx_rispass/Noise;
SNRNAct=Prx_risact/Noise;
%% Spectral Efficiency
spectraleff_LOS=log2(1+SNRLOS);
spectraleff_NLOS=log2(1+SNRNLOS);
spectraleff_NLOSact=log2(1+SNRNAct);
% minspectraleff_LOS=floor(min(spectraleff_LOS))
% maxspectraleff_LOS=round(max(spectraleff_LOS))
spectralthreshould=1:0.001:30;
for ii=1:length(spectralthreshould)
CDFspectraleff_LOS(ii)=sum(spectraleff_LOS<spectralthreshould(ii))/length(spectraleff_LOS);
CDFspectraleff_NLOS(ii)=sum(spectraleff_NLOS<spectralthreshould(ii))/length(spectraleff_LOS);
CDFspectraleff_NLOSact(ii)=sum(spectraleff_NLOSact<spectralthreshould(ii))/length(spectraleff_LOS);

end
figure,
plot(spectralthreshould,CDFspectraleff_LOS), hold on
plot(spectralthreshould,CDFspectraleff_NLOS), hold on
plot(spectralthreshould,CDFspectraleff_NLOSact), hold on


xlabel('Spectral Efficiency (Bits/s/Hz)','FontSize',14,'FontWeight','bold')
ylabel('CDF Pr(Spectral Eff.<threshould)','FontSize',14,'FontWeight','bold')
legend({'LOS','LOS+NLOS RIS PASSIVE','LOS+NLOS RIS ACTIVE 10 dB'})
title(['Frequency ',num2str(f/1e9),' GHz'])
grid
%%
t = ph1*pi/180;
x1 =max(Ra1)* sin(t);
y1 = max(Ra1)*cos(t);
pgon = polyshape({[x1,0]},{[y1,0]});
t = [-75:0]*pi/180;
x1 =max(Ra1)* sin(t);
y1 = max(Ra1)*cos(t);
pgon2 = polyshape({[x1,0]},{[y1,0]});

figure
plot(pgon), hold on
plot(pgon2)

scatter(posap(1),posap(2),50,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5), hold on
scatter(posris(1),posris(2),50,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
          
%% EM Parameters
clear all
close all
cc=2.997925e8;        %Velocidade da luz
jay=sqrt(-1);        %Unidade imaginaria 
e0=8.854223e-12;  %Permissividade absoluta do meio
u0=1.256640e-6;       %Permeabilidade absoluta do meio
eta0=sqrt(u0/e0);       %Impedancia do meio
Nq=29
f_inicial=1e9;      %Frequencia inicial de analise
f_final=14e9;        %Frequencia final de analis
f=linspace(f_inicial,f_final,Nq);
theta=0 ; %5Incidente Angle


%% Patch Parameters
Cp=[0.66:0.01:1]*1e-12;
Rp=1;
Lp=0.7e-9;  
[Freq,RP,CP]=meshgrid(f,Rp,Cp);
%% Substrate Parameters
erd=4.4-j*0.088;d=2.3e-3;
omega=2*pi*Freq;
k0=omega*sqrt(e0*u0);
kt=k0*sin(theta); %transverse component
kz0=sqrt(k0.^2-kt.^2); %normal component in vacuum
kzd=sqrt(erd*k0.^2-kt.^2); %normal component in the subs
eta0TE=omega.*u0./kz0; %vacuum - TE
eta0TM=kz0./(omega*e0); %vacuum - TM 
etadTE=omega.*u0./kzd; %substrate - TE - relation (4)
etadTM=kzd./(omega*e0*erd); %substrate - TM - relation (4)
% d=1.2e-3;
Zd_TM = 1i*etadTM.*tan(kzd*d) ; %relation (3)
%% Ground Short circuit Inductance
Lg=imag(Zd_TM./omega/1e-9)

figure,
plot(f/1e9,squeeze(Lg(1,:,1)))
%%

Zp=RP+1./(j*2*pi*Freq.*CP)+j*2*pi*Freq.*Lp;
imag(Zp)
%%
Zin=Zp.*Zd_TM./(Zp+Zd_TM);

Gamma=(Zin-eta0TM)./(Zin+eta0TM);
Ltest=0.5e-6
Ctest=0.1e-12
1/sqrt(Ltest*Ctest)/1e9
%%
flim=5;
fob=3.3e9;
[~,idf]=min(abs(f-fob));
idc=1
%%
% figure(11)
% subplot 121
% plot(Cp/1e-12,real(Zsp)), hold on
% title('Impedância Zpatch','FontSize',14,'FontWeight','bold')
% xlabel('Capacitância pF ','FontSize',14,'FontWeight','bold')
% ylabel('Re\{Z_{surf}\}Ground','FontSize',14,'FontWeight','bold')
% ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
% set(gcf,'color','w');sizef = [2700 1900];res = 300;
% set(gcf,'Units','inches','Position',[2 2 sizef/res]);

% subplot 122
% plot(Cp/1e-12,imag(Zpatch)), hold on
% title('Impedância Zs','FontSize',14,'FontWeight','bold')
% xlabel('Capacitância pF ','FontSize',14,'FontWeight','bold')
% ylabel('Im\{Z_{surf} Ground\}(Deg)','FontSize',14,'FontWeight','bold')
% ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
% set(gcf,'color','w');sizef = [2700 1900];res = 300;
% set(gcf,'Units','inches','Position',[2 2 sizef/res]);
% % legend(Leg)
% 
% %%
% figure(1)
% subplot 121
% plot(Cp/1e-12,real(Zurf)), hold on
% title('Impedância Zs','FontSize',14,'FontWeight','bold')
% xlabel('Capacitância pF ','FontSize',14,'FontWeight','bold')
% ylabel('Re\{Z_{surf}\}Ground','FontSize',14,'FontWeight','bold')
% ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
% set(gcf,'color','w');sizef = [2700 1900];res = 300;
% set(gcf,'Units','inches','Position',[2 2 sizef/res]);
% % legend(Leg)
% 
% subplot 122
% plot(Cp/1e-12,imag(Zurf)), hold on
% title('Impedância Zs','FontSize',14,'FontWeight','bold')
% xlabel('Capacitância pF ','FontSize',14,'FontWeight','bold')
% ylabel('Im\{Z_{surf} Ground\}(Deg)','FontSize',14,'FontWeight','bold')
% ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
% set(gcf,'color','w');sizef = [2700 1900];res = 300;
% set(gcf,'Units','inches','Position',[2 2 sizef/res]);
% % legend(Leg)
% 
% figure(2)
% subplot 121
% plot(Cp/1e-12,real(Zin)), hold on
% title('Impedância de Entrada Z_s//\eta^{TM}_{1}','FontSize',14,'FontWeight','bold')
% xlabel('Capacitância pF ','FontSize',14,'FontWeight','bold')
% ylabel('Re\{Z_{in}\}(\Omega )','FontSize',14,'FontWeight','bold')
% % legend(Leg)
% ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
% set(gcf,'color','w');sizef = [4000 1900];res = 300;
% set(gcf,'Units','inches','Position',[2 2 sizef/res]);
% % legend(Leg)
% grid
% subplot 122
% plot(Cp/1e-12,angle(Zin)*180/pi), hold on
% title('Impedância de Entrada Zs//\eta^{TM}_{1}','FontSize',14,'FontWeight','bold')
% xlabel('Capacitância pF ','FontSize',14,'FontWeight','bold')
% ylabel('Angle\{Z_{in}\}(Deg)','FontSize',14,'FontWeight','bold')
% % legend(Leg)
% ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
% set(gcf,'color','w');sizef = [4000 1900];res = 300;
% set(gcf,'Units','inches','Position',[2 2 sizef/res]);
% grid
%% Reflection Coeff vs Capacitance
figure(3)
subplot 121
plot(Cp/1e-12,20*log10(abs(squeeze(Gamma(1,idf,:))))), hold on
title('Coeficiente \Gamma','FontSize',14,'FontWeight','bold')
xlabel('Capacitância pF ','FontSize',14,'FontWeight','bold')
ylabel('|\Gamma|','FontSize',14,'FontWeight','bold')
% legend(Leg)
ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
set(gcf,'color','w');sizef = [4000 1900];res = 300;
set(gcf,'Units','inches','Position',[2 2 sizef/res]);
grid 
xlim([0 flim])
subplot 122
plot(Cp/1e-12,angle(squeeze(Gamma(1,idf,:)))*180/pi), hold on
title('Coeficiente \Gamma','FontSize',14,'FontWeight','bold')
xlabel('Capacitância pF ','FontSize',14,'FontWeight','bold')
ylabel('Angle\{\Gamma\}(Deg)','FontSize',14,'FontWeight','bold')
% legend(Leg)
ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
set(gcf,'color','w');sizef = [4000 1900];res = 300;
set(gcf,'Units','inches','Position',[2 2 sizef/res]);
grid
xlim([0 flim])
%%
figure(4)
subplot 121
plot(f/1e9,20*log10(abs(squeeze(Gamma(1,:,:))))), hold on
title('Coeficiente \Gamma','FontSize',14,'FontWeight','bold')
xlabel('Frequency GHz','FontSize',14,'FontWeight','bold')
ylabel('|\Gamma|','FontSize',14,'FontWeight','bold')
% legend(Leg)
ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
set(gcf,'color','w');sizef = [4000 1900];res = 300;
set(gcf,'Units','inches','Position',[2 2 sizef/res]);
grid 
xlim([0 flim])
subplot 122
plot(f/1e9,angle(squeeze(Gamma(1,:,:)))*180/pi), hold on
title('Coeficiente \Gamma','FontSize',14,'FontWeight','bold')
xlabel('Frequency GHz','FontSize',14,'FontWeight','bold')
ylabel('Angle\{\Gamma\}(Deg)','FontSize',14,'FontWeight','bold')
% legend(Leg)
ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
set(gcf,'color','w');sizef = [4000 1900];res = 300;
set(gcf,'Units','inches','Position',[2 2 sizef/res]);
grid
xlim([0 flim])
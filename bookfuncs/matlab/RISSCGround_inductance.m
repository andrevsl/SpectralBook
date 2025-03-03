%% EM Parameters
cc=2.997925e8;        %Velocidade da luz
jay=sqrt(-1);        %Unidade imaginaria 
e0=8.854223e-12;  %Permissividade absoluta do meio
u0=1.256640e-6;       %Permeabilidade absoluta do meio
eta0=sqrt(u0/e0);       %Impedancia do meio
Nq=121;
f_inicial=1e9;      %Frequencia inicial de analise
f_final=30e9;        %Frequencia final de analis
f=linspace(f_inicial,f_final,Nq);
theta=0 %5Incidente Angle

%% Substrate Parameters
er=[2.2 4.4]
d=[0.5 0.8 1 1.2 1.5]*1e-3;
[Freq,ER,D]=meshgrid(f,er,d);
erd=ER-j*0.088;
omega=2*pi*Freq;
k0=omega*sqrt(e0*u0);
kt=k0*sin(theta); %transverse component
kz0=sqrt(k0.^2-kt.^2); %normal component in vacuum
kzd=sqrt(ER.*k0.^2-kt.^2); %normal component in the subs
eta0TE=omega.*u0./kz0; %vacuum - TE
eta0TM=kz0./(omega*e0); %vacuum - TM 
etadTE=omega.*u0./kzd; %substrate - TE - relation (4)
etadTM=kzd./(omega.*e0.*ER); %substrate - TM - relation (4)
Zd_TM = 1i*etadTM.*tan(kzd.*D) ; %relation (3)
Lg=imag(Zd_TM./omega/1e-9)
%% Ground Short-circuit Inductance vs Permittivity

figure,
plot(f/1e9,squeeze(Lg(1,:,:)))
xlabel('Frequency GHz','FontSize',14,'FontWeight','bold')
ylabel('Inductance','FontSize',14,'FontWeight','bold')
% legend(Leg)
ax = gca;ax.XAxis.FontSize = 18;ax.YAxis.FontSize = 18;
set(gcf,'color','w');sizef = [4000 1900];res = 300;
set(gcf,'Units','inches','Position',[2 2 sizef/res]);
grid

%% CH2 Microwave Circuits
%%% Physical parameteres
cc=2.997925e8;        %Velocidade da luz
e0=8.854223e-12;  %Permissividade absoluta do meio
u0=1.256640e-6;       %Permeabilidade absoluta do meio
eta=sqrt(u0/e0);       %Impedancia do meio
er1=2
sig1=0
eta=sqrt(u0/e0);       %Impedancia do meio

pathMS='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\';
% fileMSL25=[pathMS,'MSLinePar_L25.s2p'];
% fileMSL50=[pathMS,'MSLinePar_L50.s2p'];
fileMSL100=[pathMS,'MSLineZp_1.s2p'];

% sparMS25=sparameters (fileMSL25)
% sparMS50=sparameters (fileMSL50)
sparL100=sparameters (fileMSL100)
S11=squeeze(sparL100.Parameters(1,1,:))
S21=squeeze(sparL100.Parameters(2,1,:))
S12=squeeze(sparL100.Parameters(1,2,:))
S22=squeeze(sparL100.Parameters(2,2,:))


f=sparL100.Frequencies % Frequencies
ereff1=er1*(1-i*sig1./(2*pi*f*e0*er1));       %Impedancia do meio
w=2.62e-3;L=100e-3;
h=0.8e-3

% tx1=rfckt.microstrip('Width',w,'EpsilonR',er1,'LineLength',L,'Height',h)
% tx1
% analyze(tx1,f)
% z0 = getz0(tx1)
figure

subplot 221
plot(f/1e9,20*10*log10(abs(S11)),'-b','LineWidth',2),hold on;
% legend(Leg,'FontSize',12,'FontWeight','bold')
xlabel('\theta(º)','FontSize',14,'FontWeight','bold')
ylabel('Mag (dB)','FontSize',14,'FontWeight','bold')
ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;
grid on

subplot 222
plot(f/1e9,180/pi*(angle(S11)),'-b','LineWidth',2),hold on;
% legend(Leg,'FontSize',12,'FontWeight','bold')
xlabel('\theta(º)','FontSize',14,'FontWeight','bold')
ylabel('Mag (dB)','FontSize',14,'FontWeight','bold')
ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;
grid on
%%

f=3.3e9:0.1e9:30e9;
Lambda=(3e8./f);   %% Lambda (m)
Leg={['Classical Radiating NF'],['Bjornson Distance RNF']}
for ii=[20 40]
D=Lambda*sqrt(2);
RadiatingNF=0.62*sqrt((ii*D).^3./Lambda);
Fraunhofer=2.*(ii*D).^2./Lambda;
dF=2.*(D).^2./Lambda;

dB=2*ii*D
EmilDFraunhofer=ii^2*dF;
figure(1)
plot(f/1e9,RadiatingNF), hold on
plot(f/1e9,dB), hold on

xlabel('Frequency (GHz)','FontSize',14,'FontWeight','bold')
ylabel('Distance (m)','FontSize',14,'FontWeight','bold')
title({'Radiating NF'})
legend(Leg)
figure(2)
plot(f/1e9,Fraunhofer), hold on
plot(f/1e9,EmilDFraunhofer)
title({'Far Field'})
legend(Leg)
end
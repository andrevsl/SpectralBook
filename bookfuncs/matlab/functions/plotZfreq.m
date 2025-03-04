function h=plotZfreq(freq,z11,zlim,leg)

subplot 221
plot(freq,real(z11)), hold on
title('Real Part Z')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Real (\Omega)','fontsize',10,'fontweight','b');
legend(leg)
ylim(zlim)

subplot 223
plot(freq,imag(z11)), hold on
title('Imag Part Z')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Imag (\Omega)','fontsize',10,'fontweight','b');
legend(leg)
ylim(zlim)

subplot 222
plot(freq,20*log(abs(z11))), hold on
title('Mag')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (dB)','fontsize',10,'fontweight','b');
legend(leg)

subplot 224
plot(freq,180/pi*angle(z11)), hold on
title('Phase')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');
legend(leg)
h=1;

end
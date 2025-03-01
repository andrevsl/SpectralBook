function h=plotZfreq(freq,z11,zlim)

subplot 311
plot(freq,real(z11),'-b'), hold on
plot(freq,imag(z11),'-r')
title('Mag/Phase')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (\Omega)','fontsize',10,'fontweight','b');
legend('Real','Imag')
ylim(zlim)

subplot 312
plot(freq,20*log(abs(z11))), hold on
title('Mag')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');

subplot 313
plot(freq,180/pi*angle(z11)), hold on
title('Phase')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');
h=1;

end
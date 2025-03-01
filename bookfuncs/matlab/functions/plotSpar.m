function h=plotSpar(freq,spar,flim)

subplot 211
plot(freq,20*log(abs(spar))), hold on
title('Mag')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (dB)','fontsize',10,'fontweight','b');
xlim(flim)
subplot 212
plot(freq,180/pi*angle(spar)), hold on
title('Phase')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');
xlim(flim)
h=1;

end
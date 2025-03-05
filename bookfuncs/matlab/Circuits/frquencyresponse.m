
s11_fit_data = rational(freq,S11Circ)
fresp = freqresp(s11_fit_data,freq);


figure
subplot 211
plot(f/1e9,20*log10(abs((VSinc)))), hold on
plot(f/1e9,20*log10(abs((VSreflected)))), hold on
plot(f/1e9,20*log10(abs((VS)))), hold on
title('Mag VSinc')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (V)','fontsize',10,'fontweight','b');
legend('Vinc','Vreflected','VS')

subplot 212
title('Phase VSinc')
plot(f/1e9,180/pi*angle(fftshift(VSinc))),hold on
plot(f/1e9,180/pi*angle(fftshift(VSreflected))),hold on
plot(f/1e9,180/pi*angle(fftshift(VS))),hold on

xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');
legend('Vinc','Vreflected','VS')
function h=plotFDdBParametric(freq,VS1,leg,VS2)

% sgtitle(['Parametric Res Cap=',string(Captarget)])
if nargin<=3 
subplot 211
plot(freq/1e9,20*log10(abs(VS1)))
title('Mag S11')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (dB)','fontsize',10,'fontweight','b');
legend(string(leg))

subplot 212
plot(freq/1e9,180/pi*angle((VS1)))
title('Phase S11 ')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');
legend(string(leg))
end
if nargin>3 
 subplot 221
plot(freq/1e9,20*log10(abs(VS1)))
title('Mag S11')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (dB)','fontsize',10,'fontweight','b');
legend(string(leg))

subplot 223
plot(freq/1e9,180/pi*angle((VS1)))
title('Phase S11 ')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');
legend(string(leg))

subplot 222
plot(freq/1e9,20*log10(abs(VS2)))
title('Mag Voltage Gain')
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Mag (dB)','fontsize',10,'fontweight','b');
legend(string(leg))

subplot 224
plot(freq/1e9,180/pi*angle((VS2)))
xlabel('Frequency (GHz)','fontsize',10,'fontweight','b');
ylabel('Phase (Deg)','fontsize',10,'fontweight','b');
title('Phase Voltage Gain')
legend(string(leg))
end
h=1
end
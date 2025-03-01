%% Antenna Dipole Code
clear all
addpath(genpath('H:\Meu Drive\SocieForParaOPlay\SpectralBook\bookfuncs\matlab')) %%CST API
Path='H:\Meu Drive\SocieForParaOPlay\SpectralBook\bookfuncs\matlab\MatlabSimuOutputs\'
circuit=circuitNW()
circuit.Add(circuit)
figure
terminalsLength=2
LineLength=2
x1t = [-LineLength+circuit.newOrigin(1),circuit.newOrigin(1), circuit.newOrigin(1)];
y1t = [circuit.newOrigin(2),circuit.newOrigin(2), terminalsLength];
line(gca,x1t,y1t,'Color','k','LineStyle','-','LineWidth',5)
line(gca,x,y,'Color','k','LineStyle','-','LineWidth',5)
rectangle()
% text(pos(1)+pos(3)/2,pos(2)+pos(4)/2,'Title','HorizontalAlignment','center')
line(gca,x,y,'Color','k','LineStyle','-','LineWidth',5)

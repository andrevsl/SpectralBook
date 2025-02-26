%% SmithC
addpath(genpath('H:\Meu Drive\SocieForParaOPlay\SpectralBook\bookfuncs\matlab')) %%CST API
Path='H:\Meu Drive\SocieForParaOPlay\SpectralBook\bookfuncs\matlab\'
%% Parameters
jay=sqrt(-1);        %Unidade imaginaria 
cc=2.997925e8;        %Velocidade da luz
e0=8.854223e-12;  %Permissividade absoluta do meio
u0=1.256640e-6;       %Permeabilidade absoluta do meio
eta=sqrt(u0/e0);       %Impedancia do meio
f0=3e9 ;                  % Observation frequency
Lamb0=cc/f0 ;              % Observation wavelength
Ld=Lamb0/10;                 % Dipole Length
Wd=Lamb0/1000 ;              % Dipole Length
Nq=96;           %Numero de pontos na frequencia
RefZ0=50;
Fs=50e9;
Nfft=1025;
DeltaFs=Fs/(Nfft-1)/1e6;
f=Fs/2*linspace(-1,1,Nfft);
f_inicial=0.1e9;      %Frequencia inicial de analise do dipolo
f_final=10e9;        %Frequencia final de analise
[~,id0]=min(abs(f-0));
% [~,idf]=min(abs(f-f_final));
freq=f(id0+1:end);
Lambda=cc./f; 
k=2.*pi.*f.*sqrt(e0.*u0);
d = dipole(Length=Ld,Width=Wd);
spar=sparameters(d,freq,RefZ0)



%% Set values desired for first arrow
radius = 0.8; % Height from top to bottom
radius2 = -0.8; % Height from top to bottom
centre = [0 0];
arrow_angle = 0; % Desired orientation angle in degrees
angle =160; % Anglebetween start and end of arrow
direction = 1; % for CW enter 1, for CCW enter 0
direction2 =0 ; % for CW enter 1, for CCW enter 0

colour = 'k'; % Colour of arrow
colour2 = 'r'; % Colour of arrow
head_size = 20; % Arrow head size
clear h
figure
h=smithplot(spar), hold on
t=text(radius-0.5,-0.7,'CW Toward Generator')
t(1).Color = 'black';
t(1).FontSize = 16;
set(t,'Rotation',90);
t2=text(-radius+0.5,-0.5,'CCW Toward Load')
t2(1).Color = 'black';
t2(1).FontSize = 16;
set(t2,'Rotation',90);
circular_arrow(h, radius, centre, arrow_angle, angle, direction, colour, head_size);
circular_arrow(h, radius2, centre, arrow_angle, angle, direction2, colour2, head_size);
lgd = findobj('type', 'legend')
set(lgd(1), 'visible', 'off')
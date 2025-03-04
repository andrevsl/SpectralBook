%% Antenna Dipole Code
clear all
addpath(genpath('D:\SpectralBook\bookfuncs\matlab')) %%CST API
Path='H:\Meu Drive\SocieForParaOPlay\SpectralBook\bookfuncs\matlab\MatlabSimuOutputs\'
%% Parameters
jay=sqrt(-1);        %Unidade imaginaria 
cc=2.997925e8;        %Velocidade da luz
e0=8.854223e-12;  %Permissividade absoluta do meio
u0=1.256640e-6;       %Permeabilidade absoluta do meio
eta=sqrt(u0/e0);       %Impedancia do meio
f0=3e9 ;                  % Observation frequency
Lamb0=cc/f0 ;              % Observation wavelength
Nq=96;           %Numero de pontos na frequencia
RefZ0=50;  %Reference Impedance Generator
Fs=50e9;  %% FFT sampling frequency
Nfft=1025; %% NFFT sampling frequency
DeltaFs=Fs/(Nfft-1)/1e6; % Delta Fs
f=Fs/2*linspace(-1,1,Nfft);
f_inicial=0.1e9;      %Frequencia inicial de analise do dipolo
[~,id0]=min(abs(f-0));
% [~,idf]=min(abs(f-f_final));
freq=f(id0+1:end);
Lambda=cc./freq; 
k=2.*pi.*freq.*sqrt(e0.*u0);
%% LC 
type='Series'
Lind=1.5e-9;
Cap=[100e-12
fres=1/sqrt(Lind*Cap);
Zadd=j*2*pi*freq*Lind;
Zin=
ZLC=addMatching(type,zinDipole.',Zadd);

S11LC=()
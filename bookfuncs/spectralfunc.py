## Fourier
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle
import matplotlib.pyplot as plt

# Nfft=1025
def S1d(y,Nfft,Fs):
    yf={'S':[],'f':[]}
    yf['S']=np.fft.fftshift(np.fft.fft(y,Nfft))
    yf['f']=Fs/2*np.linspace(-1,1,Nfft)
    return yf

#yf=S1d(y,Nfft,Fs)
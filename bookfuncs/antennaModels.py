## Fourier
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle,log,sqrt
import matplotlib.pyplot as plt



def mslineBalanis(emconst,w,h,freq):
    # Balanis/Pozar Equations a checar se começou com o Gupta?(As do gupta sao diferentes, procurar melhor depois ou agora de quem é) 
    # ele ta nas ref do Balanis/Pozar, o balanis diz que ta resumindo a informação (Advanced electromagnetism)
    # o pessoal skrf ajudou colocou umas referencias hammerstad_er, mas ta diferente a equacao com um 10 no lugar do 12 (mas tao bem diferentes, sei nao)

    if w/h <=1:

        eff=(emconst['er'][0]+1)/2+(emconst['er'][0]-1)/2*( 1/sqrt(1+12*h/w) +0.04*np.power((1-w/h),2))
        Z0=60/sqrt(eff)*log(8*h/w+w/(4*h))
       

    if w/h >1:
      
        eff=(emconst['er'][0]+1)/2+(emconst['er'][0]-1)/2*1/sqrt(1+12*h/w)
        Z0=(120*pi/sqrt(eff))/(w/h+1.393+0.667*log(w/h+1.444))
        
    omega=2*pi*freq
    Gamma=sqrt(1j*omega*emconst['u0']*(emconst['sig'][0]+1j*omega*emconst['e0']))
    return omega,Gamma,Z0,eff


def twoWireTL(emconst,d,a,freq):
    # Orfanidis
    Z0=emconst['eta0']/pi*np.arccosh(d/(2*a))
    omega=2*pi*freq
    Gamma=sqrt(1j*omega*emconst['u0']*(emconst['sig'][0]+1j*omega*emconst['e0']))
    return omega,Gamma,Z0

def parrallelPlate(emconst,d,W,freq):
    # Orfanidis
    Z0=emconst['eta0']*d/W/sqrt(emconst['er'][0])
    omega=2*pi*freq
    Gamma=sqrt(1j*omega*emconst['u0']*(emconst['sig'][0]+1j*omega*emconst['e0']))
    return omega,Gamma,Z0
---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.9'
    jupytext_version: 1.5.0
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Spectral Analysis

## Introduction 

In this chapter we will analyze the spetral behavior of the signals in space, frequency and time, in order to acquire physical and mathematical insights for applied electromagnetics.
The signal's time variation is intrinsically linked to  time-frequency as well known. Usually, the Fourier analysis is the widely used spectral transformation to evaluate the signal's characteristics. Discrete-Time Fourier Series (DFS) are intended for periodic signals and the Discrete-Time Fourier Transform for non-periodic signals, commonly implemented by fast fourier transform (FFT) algorithms. We will analyze canonical periodic and non-periodic time signals using FFT to extract useful information for electromagnetic signal processing.

**However for the electronmagnetism, the time transformation are not enough, as the signal propagates throughout the space. Spectral transformation are useful tools to solve microwave and optical problems, besides to gather informations about the physics. For example the physical optics employed in 3D games, propagation models of telecomunications signals,...

## Definition

The time signals, or even from mathematics, a time series, describes the variation in time of a given property. For electromagnetism, we focus in the variation of voltages, currents, electromagnetic field's intensities in space-time, for example. We can apply spectral transformation of a space over all dimensions of the space-time.

The space-time signal will be defined by lower case letter, we will consider as current signal propagating only in z-dimension, at first, for example,

$$x_{t}(t,z)=\sin{(\omega t-kz)}$$

where $\omega=2\pi f$, being $f$ the angular frequency.

The space-frequency or time-frequency domain signals will be represented by upper case Letter, for example, we will have,

$$x_{t}(t,z)=\sin{(\omega_0 t-kz)}$$

Applying frequency spectral transformation

$$x_{t}(t,z) \xrightarrow{\mathscr{F_t}} X(f,z)$$ 

Applying space spectral transformation


$$x_{t}(t,x) \xrightarrow{\mathscr{F_k}} X(t,k)$$ 

if applied simultaneously

$$x_{t}(t,x) \xrightarrow{\mathscr{F_{t,k}}} X(f,k)$$ 


## Space-Time Convention 2D

[Ref] Iizuka K. "Elements of Photonics, Volume I: In Free Space and Special Media," John Wiley & Sons, Inc.,June 2022.
[Ref] Iizuka K. "Elements of Photonics, Volume II: For Fiber and Integrated Optics.," John Wiley & Sons, Inc.,June 2022.
 (Cap. 1 e o de Polarização gostei mais da explicação)
 [REF] 

https://www.ele.uva.es/~ivasan/DO/%5BBook%20-%20Opto%5D%20Elements%20of%20photonics%20(Vol%20I%20-%20Free%20space%20and%20special%20media)%20-%20Iizuka%20(Willey,%202002).pdf

A signal propagating direction  convetion will depend on the sign of the time and space counterpart

- Propagation Foward, toward the positve x-direction will be represented by ( the rate of frequency variation must have the opposite sign of the rate of space-frequency variation

$$x_{t}(t,x)=\sin{(\omega_0 t-kz)}$$


$$x_{t}(t,x)=\sin{(-\omega_0 t+kz)}$$

- Propagation Backward, Toward the negative x-direction will be represented by ( the rate of frequency variation must have the same sign of the rate of space-frequency variation) 

$$x_{t}(t,x)=\sin{(-\omega_0 t-kz)}$$

$$x_{t}(t,x)=\sin{(\omega_0 t+kz)}$$


## Space-Time Convention 3D


```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]
#  Convention
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle,sqrt,log
import pandas as pd
import matplotlib.pyplot as plt

from bookfuncs.plotfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot2DTparametric
from bookfuncs.simuParams import *
from bookfuncs.simuParams import  SimuParam

import time
import warnings
warnings.filterwarnings(action='ignore')

par=SimuParam()
par.par
t=np.arange(par.par.loc['HSinP','t0'],par.par.loc['HSinP','tf'],par.par.loc['HSinP','dt'])
x=np.arange(par.par.loc['HSinP','x0'],par.par.loc['HSinP','xf'],par.par.loc['HSinP','dx'])
[X,T]=np.meshgrid(x,t) # meshgrid 2D cria uma matrix 2D com todas as possibilidade de tempo e spaço (depois criarei uma matrix 2D para o espectro frequencial)
# as linhas das matrizes representam a variaçao no tempo e as colunas variação no espaço, a referencia do tempo espaço é t0=0, x0=-5 lambda (comprimento de onda)
print("x0: {}".format(x[0]))
print("x0: {}".format(X[5,0]))
print("xf: {}".format(x[-1]))
print("t0: {}".format(t[0]))
print("t0: {}".format(T[0,5])) #
print("tf: {}".format(t[-1])) 

xt_pm=sin(2*pi*par.par.loc['HSinP','f']*T-par.par.loc['HSinP','kx']*X)

xt_mp=-sin(-2*pi*par.par.loc['HSinP','f']*T+par.par.loc['HSinP','kx']*X)

xt_mm=-sin(-2*pi*par.par.loc['HSinP','f']*T-par.par.loc['HSinP','kx']*X)

xt_pp=-sin(2*pi*par.par.loc['HSinP','f']*T+par.par.loc['HSinP','kx']*X)


#Plot Half cycle Sin Signal
fig1,axt=plt.subplots(2,2)
fig1.set_size_inches((12,10))
fig1.suptitle(' Wave Propagation Convention ', fontsize=30)   
# Estou incrementando a posição espacial, se amplitude do sinal for maior que a da posição anterior quando o sinal está crescendo e o tempo aumentando ou
# amplitunde menor que a da posição anterior quando o sinal está descrecendo  e o tempo aumentando (Foward propagation direção positiva) e vice versa
# fazer animação no futuro (escrevi merda hahahahahah é isso mesmo eu achom da um no na cabeça hahahaa)
plot2DTparametric(axt,t,(0,0,[0,t[-1]/1e-9],[-1,1],xt_pm[:,0],'Convention positive negative','b','-'),
                        (0,0,[0,t[-1]/1e-9],[-1,1],xt_pm[:,3],"Convention positive negative",'r','--'),
                        (0,0,[0,t[-1]/1e-9],[-1,1],xt_pm[:,6],"Convention positive negative",'m',':'),
                        (0,1,[0,t[-1]/1e-9],[-1,1],xt_mp[:,0],"Convention negative positive",'b','-'),
                        (0,1,[0,t[-1]/1e-9],[-1,1],xt_mp[:,3],"Convention negative positive",'r','--'),
                        (0,1,[0,t[-1]/1e-9],[-1,1],xt_mp[:,6],"Convention negative positive",'m',':'),
                        (1,0,[0,t[-1]/1e-9],[-1,1],xt_mm[:,0],"Convention negative negative",'b','-'),
                        (1,0,[0,t[-1]/1e-9],[-1,1],xt_mm[:,3],"Convention negative negative",'r','--'),
                        (1,0,[0,t[-1]/1e-9],[-1,1],xt_mm[:,6],"Convention negative negative",'m',':'),
                        (1,1,[0,t[-1]/1e-9],[-1,1],xt_pp[:,0],"Convention positive positive",'b','-'),
                        (1,1,[0,t[-1]/1e-9],[-1,1],xt_pp[:,3],"Convention positive positive",'r','--'),
                        (1,1,[0,t[-1]/1e-9],[-1,1],xt_pp[:,6],"Convention positive positive",'m',':'),
                        )
axt[0,0].annotate(" Foward", xy=(t[60]/1e-9,(x[int(par.par.loc['HSinP','Nx']/2)+5])),
                 xytext=(t[5]/1e-9, x[int(par.par.loc['HSinP','Nx']/2)] ),
                #  xycoords=(t[10], x[int(par.par.loc['HSinP','Nx']/2)] ),
                 arrowprops=dict(arrowstyle='->', color='black'))     
axt[0,1].annotate(" Foward", xy=(t[60]/1e-9,(x[int(par.par.loc['HSinP','Nx']/2)+5])),
                 xytext=(t[5]/1e-9, x[int(par.par.loc['HSinP','Nx']/2)] ),
                #  xycoords=(t[10], x[int(par.par.loc['HSinP','Nx']/2)] ),
                 arrowprops=dict(arrowstyle='->', color='black'))       
plt.show()

x.shape

```

```{python echo=TRUE}
print("Hallo I'm an RMarkdown block!")
```


```{exercise}
:label: memoryless-ex-1

Due to its memoryless property, we can "stop" and "restart" an exponential
draw without changing its distribution.

To illustrate this, we can think of fixing $\lambda > 0$, drawing from
$\Exp(\lambda)$, and stopping and restarting whenever a threshold $s$ is crossed.

In particular, consider the random variable $X$ defined as follows:

* Draw $Y$ from $\Exp(\lambda)$.
* If $Y \leq s$, set $X = Y$.
* If not, draw $Z$ independently from $\Exp(\lambda)$ and set $X = s + Z$.

Show that $X \sim \Exp(\lambda)$.
```

```{exercise}
:label: memoryless-ex-2
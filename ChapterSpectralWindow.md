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



# Windows Signals 

Before go deep into the standard signals used for microwave applications. After passing throughout the spectral transformation theory, we've seen that the fourier transfom truncate the periodic signals, as well as the finite time signals, we've already been introduced to the first one, the rectangular pulse or rectangular window. The windows are very important due to the gold characteristics of the spetrum, the bandwidth, power profile, and time resolution, the complexity for the adc/dac to dectect or generate the signals.

```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]
:tags: [hide-output]
#  Convention

import numpy as np
from numpy import sin, exp, cos, log10, pi,angle, cos
import pandas as pd
import matplotlib.pyplot as plt
from bookfuncs.py.simuParams import  SimuParam
from bookfuncs.py.PlotData.plotfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot1DSparametricUwrap
from scipy import signal
from bookfuncs.py.signalFunc import  gaussinaSignal

from bookfuncs.py.simuParams import *
from bookfuncs.py.simuParams import  SimuParam

import time
import warnings
warnings.filterwarnings(action='ignore')

```
## Definitions


- Bandwidth

It is the most desired characteristic nowdays, being all of us hungry for data throughput and capacity. It is the size of a frequency interval in a continous range of frequencies, i.e. the difference between the upper and lower frequency of the interval where the signal comply with some defined charcateristics.

- roll-off

It is the steppeness of the signal amplitude against frequency, it is used to tune bandwidth and powe distribution of signals against frequency. It's very importang because the experienced researchers and engineers can infer the spectrum from the time dynamics, or vice versa. Hence from fourier transformation properties, fast time variation infers a wider bandwidth, because only the high frequency components could well construct the signals characteristics. While slow variations, a narrow bandwdith, high frequency components wil introduce noise for the signal characteristics. The spectral transformation use orthogonal basis, in the case of fourier, complex exponetials, which are narrowband, but different orthogonal basis could be used for the intended application.


## Rectangular Windows

Rectangular windows are very important, because any finite signal fater being parsed by the fourier transformation is equivalent to be multiplied by the rectangular windows. For example, sinusoidal signals are usially analysed with fourier transformas, not fourier series, because in the real world, the signal are not infinite. So, we have a truncated version of the signusoidal signal.

$$ x(t) \xrightarrow{} x(t) \times rect(t) \xrightarrow{\mathscr{F}} X(f) \circledast sinc(f)$$

$$ x(t-t_0) \xrightarrow{\mathscr{F}} X(f) e^{-j\pi f t_0} $$

for a Guassian Signal 
$$g_{t}(t) \xrightarrow{\mathscr{F}}  G(f)=-K\frac{1}{2} \tau \sqrt{\pi } e^{-\pi^2 \tau^2 f^2}[erf(\frac{t_0}{\tau}+i \pi \tau f)-erf(\frac{t_f}{\tau}+i \pi \tau f)]$$


$$ g(t-t_0) \xrightarrow{\mathscr{F}} -K\frac{1}{2} \tau \sqrt{\pi } e^{-\pi^2 \tau^2 f^2}[erf(\frac{t_0}{\tau}+i \pi \tau f)-erf(\frac{t_f}{\tau}+i \pi \tau f)] e^{-j\pi f t_0} $$


# Windowing 
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle, cos
import pandas as pd
import matplotlib.pyplot as plt
from bookfuncs.py.simuParams import  SimuParam
from bookfuncs.py.PlotData.plotfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot1DSparametricUwrap
from scipy import signal
from bookfuncs.py.signalFunc import  gaussinaSignal





```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]
par=SimuParam()
par.par
# Time sinals
# print(t.shape)

t0=-4e-9 #ar.par.loc['Gau','t0']
tf=5e-9
t02=-10e-9 #ar.par.loc['Gau','t0']
tf2=10e-9
tau=1e-9

td=-2e-9
td=-2e-9
td3=1e-9
td4=2e-9

t=np.arange(t0,tf,par.par.loc['Gau','dt'])
t2=np.arange(t02,tf2,par.par.loc['Gau','dt'])

gt=gaussinaSignal(t,tau,td)
gt2=gaussinaSignal(t2,tau,td)
gt3=gaussinaSignal(t2,tau,td3)
gt4=gaussinaSignal(t2,tau,td4)


fig1,axt=plt.subplots(1,2)
fig1.set_size_inches((10,4))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-0.5,1],gt,"Gaussian",'b','-'))
axt[0].legend(['Window=6ns, td=0'])

plot1DTparametric(axt,t2,(1,[t2.min()/1e-9,t2.max()/1e-9],[-0.5,1],gt2,"Gaussian",'m','-'))
plot1DTparametric(axt,t2,(1,[t2.min()/1e-9,t2.max()/1e-9],[-0.5,1],gt3,"Gaussian",'r','-'))
plot1DTparametric(axt,t2,(1,[t2.min()/1e-9,t2.max()/1e-9],[-0.5,1],gt4,"Gaussian",'g','-'))
axt[1].legend(['Window=8ns, td=0','Window=8ns, td=1ns','Window=8ns, td=2ns'])

Nfft=1025 # FFT points
Fs=1/(t[1]-t[0])
Fs2=1/(t2[1]-t2[0])

Gs=S1d(gt,Nfft,Fs) # Frequency Domain Signal
Gs2=S1d(gt2,Nfft,Fs2) # Frequency Domain Signal
Gs3=S1d(gt3,Nfft,Fs2) # Frequency Domain Signal
Gs4=S1d(gt4,Nfft,Fs2) # Frequency Domain Signal

fig2,axf=plt.subplots(1,2)
fig2.set_size_inches((10,4))
plot1DSparametric(axf,Gs['f'],0.8,(0,Gs['S'],'b','-'),(0,Gs2['S'],'m','-'),(0,Gs3['S'],'r','-'),(0,Gs4['S'],'g','-'))
axf[0].legend(['Window=6ns, td=0', 'Window=8ns, td=0','Window=8ns, td=1ns','Window=8ns, td=2ns'])
axf[1].legend(['Window=6ns, td=0', 'Window=8ns, td=0','Window=8ns, td=1ns','Window=8ns, td=2ns'])
```




```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]

from bookfuncs.py.signalFunc import  gaussinaSignal
import warnings
warnings.filterwarnings('ignore')

par=SimuParam()
par.par
# Time sinals
# print(t.shape)

t0=-4e-9 #ar.par.loc['Gau','t0']
tf=0e-9
tf2=2e-9 #ar.par.loc['Gau','t0']
tf1=4e-9
tf3=6e-9
td=-2e-9

t=np.arange(t0,tf,par.par.loc['Gau','dt'])
t2=np.arange(t0,tf2,par.par.loc['Gau','dt'])
t3=np.arange(t0,tf2,par.par.loc['Gau','dt'])
t4=np.arange(t0,tf2,par.par.loc['Gau','dt'])

gt=gaussinaSignal(t,tau,td)
gt2=gaussinaSignal(t2,tau,td)
gt3=gaussinaSignal(t3,tau,td)
gt4=gaussinaSignal(t4,tau,td)


fig1,axt=plt.subplots(1,2)
fig1.set_size_inches((10,4))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-0.5,1],gt,"Gaussian",'b','-'))
axt[0].legend(['Window=6ns, td=0'])

plot1DTparametric(axt,t2,(1,[t2.min()/1e-9,t2.max()/1e-9],[-0.5,1],gt2,"Gaussian",'m','-'))
plot1DTparametric(axt,t2,(1,[t2.min()/1e-9,t2.max()/1e-9],[-0.5,1],gt3,"Gaussian",'r','-'))
plot1DTparametric(axt,t2,(1,[t2.min()/1e-9,t2.max()/1e-9],[-0.5,1],gt4,"Gaussian",'g','-'))
axt[1].legend(['Window=8ns, td=0','Window=8ns, td=1ns','Window=8ns, td=2ns'])

Nfft=1025 # FFT points
Fs=1/(t[1]-t[0])
Fs2=1/(t2[1]-t2[0])

Gs=S1d(gt,Nfft,Fs) # Frequency Domain Signal
Gs2=S1d(gt2,Nfft,Fs2) # Frequency Domain Signal
Gs3=S1d(gt3,Nfft,Fs2) # Frequency Domain Signal
Gs4=S1d(gt4,Nfft,Fs2) # Frequency Domain Signal

fig2,axf=plt.subplots(1,2)
fig2.set_size_inches((10,4))
plot1DSparametric(axf,Gs['f'],0.8,(0,Gs['S'],'b','-'),
                                  (0,Gs2['S'],'m','-'),
                                  (0,Gs3['S'],'r','-'),
                                  (0,Gs4['S'],'g','-'))
axf[0].legend(['Window=6ns, td=0', 'Window=8ns, td=0','Window=8ns, td=1ns','Window=8ns, td=2ns'])
axf[1].legend(['Window=6ns, td=0', 'Window=8ns, td=0','Window=8ns, td=1ns','Window=8ns, td=2ns'])
```
## Triangular  Windows

```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]

# Windowing 
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle, cos
import pandas as pd
import matplotlib.pyplot as plt
from bookfuncs.py.simuParams import  SimuParam
from bookfuncs.py.spectralfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot1DSparametricUwrap
from scipy import signal

par=SimuParam()
par.par
# Time sinals
print(t.shape)
t=np.arange(par.par.loc['HSinP','t0'],1/(2*par.par.loc['HSinP','f']),par.par.loc['HSinP','dt'])
xt_rect=np.ones(t.shape)
xt_tri=signal.windows.triang(len(t))
xt_sin=sin(2*pi*1e9*t) #np.diff(xt_0Deg)
# xt_gau=exp(-np.power((t-td)/tau,2))#np.diff(xt_0Deg)


# Fourier
Nfft=1025 # FFT points
YsRect=S1d(xt_rect,Nfft,par.par.loc['HSinP','Fs']) # Frequency Domain Signal
YsTri=S1d(xt_tri,Nfft,par.par.loc['HSinN','Fs']) # Frequency Domain Signal
YsSin=S1d(xt_sin,Nfft,par.par.loc['HSinN','Fs']) # Frequency Domain Signal

# Plot Half cycle Sin Signal
fig1,axt=plt.subplots(1,2)
fig1.set_size_inches((10,5))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-1,1],xt_rect,"Half Sin - Positive cycle",'b','-'),
                       (0,[t.min()/1e-9,t.max()/1e-9],[-1,1],xt_tri,"Half Sin - Negative cycle",'r','-'))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-1,1.2],xt_sin,"Half Sin - Positive cycle",'g','-'))


# Frequency Domain of 
fig2,axf=plt.subplots(1,2)
fig2.set_size_inches((10,5))
plot1DSparametric(axf,YsRect['f'],3,(0,YsRect['S'],'b','-'),(0,YsTri['S'],'r','-'),(0,YsSin['S'],'g','-'))
axf[0].legend(['Rect', 'Tri','Sin'])
# angleDiff=180/pi*(np.angle(YsDiff['S'])-np.angle(YsRect['S']))
# axf[1].plot(YsRect['f']/1e9,angleDiff)
ix=np.argmin(abs(YsRect['f']-0))
# print(ix)
axf[1].annotate("  Freq:"+str(int(YsRect['f'][ix]))+" Ph:"+str(int(180/pi*np.angle(YsRect['S'][ix]))), xy=(YsRect['f'][ix], 180/pi*np.angle(YsRect['S'][ix])),
                 xytext=(YsRect['f'][ix], 180/pi*np.angle(YsRect['S'][ix])+30),arrowprops=dict(arrowstyle='->', color='red'))

axf[1].annotate("  Freq:"+str(int(YsTri['f'][ix]))+" Ph:"+str(int(180/pi*np.angle(YsTri['S'][ix]))), xy=(YsTri['f'][ix], 180/pi*np.angle(YsTri['S'][ix])),
                 xytext=(YsTri['f'][ix], 180/pi*np.angle(YsTri['S'][ix])+30),arrowprops=dict(arrowstyle='->', color='red'))

```







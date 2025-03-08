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


# Wideband Signals
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
## Gaussian Signals
The Gaussian Signals are usually used in microwave engineering due to its well defined spectrum and wide bandwidth, providing thus a better time-frequency resolution to resolve electromagnetic problems.**

$$g_{t}(t)=K e^{-(t/\tau)^2}$$

Applying Fourier Transform

$$g_{t}(t) \xrightarrow{\mathscr{F}} G(f)$$

$$ G(f)=\int_{t_0}^{t_f} K e^{-((t-t_d)/\tau)^2} e^{-i 2 \pi f t}dt$$

To correct
$$ G(f)=\int_{t_0}^{t_f} K e^{-(t/\tau)^2} (\cos{ (i 2 \pi f t)}+i\sin{ (i2 \pi f t)})dt$$

$$ G(f)=K\int_{t_0}^{t_f}  e^{-(t/\tau)^2} \cos{ (i 2 \pi f t)}+iK\int_{t_0}^{t_f}  e^{-(t/\tau)^2} \sin{ (i2 \pi f t)}dt$$

The second integrand is odd, so integration over a symmetrical range gives 0. The first is solved by integral table.


$$ G(f)=-K\frac{1}{2} \tau \sqrt{\pi } e^{-\pi^2 \tau^2 f^2}[erf(\frac{t_0}{\tau}+i \pi \tau f)-erf(\frac{t_f}{\tau}+i \pi \tau f)]$$


#### - First Order Derivative 
$$\frac{dg_{t}(t)}{dt}= K(\frac{-2t}{\tau^2}) e^{-(t/\tau)^2} \xrightarrow{\mathscr{F}} i\omega G(f)$$

Thus, we add a zero at the origin, thus zero frequency signal will be null, hence by nature a zero act as high-pass filter, typically of self-inductors. For the second order derivative we add two zeros at the origin. But differentiation does not increase null/peaks, only at 0 frequency as depicted in Fig A2.

#### - Second Order Derivative
$$\frac{dg_{t}(t)}{dt} =K(\frac{-2}{\tau^2}) (1-\frac{2t^2}{\tau^2}) e^{-(t/\tau)^2} \xrightarrow{\mathscr{F}} (i\omega)^2 G(f)$$


```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]

# HALF SIN CODE
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle
import pandas as pd
import matplotlib.pyplot as plt
from bookfuncs.py.simuParams import  SimuParam
from bookfuncs.py.spectralfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot2DTparametric,plot1DSparametricUwrap

par=SimuParam()
par.par
# Time sinals
tf=3e-9
t0=-3e-9 #ar.par.loc['Gau','t0']
t=np.arange(t0,tf,par.par.loc['Gau','dt'])
tau=1e-9
td=0#3e-9

gt=exp(-np.power((t-td)/tau,2))
gt_1Diff=  -2*t/np.power(tau,2)*exp(-np.power((t-td)/tau,2)) #np.diff(gt) 
gt_1Diff= gt_1Diff/np.max(gt_1Diff) 
gt_2Diff=  -2/np.power(tau,2)*(1-2*np.power(t,2)/np.power(tau,2))*exp(-np.power((t-td)/tau,2))     
gt_2Diff= gt_2Diff/np.max(gt_2Diff)  


fig1,axt=plt.subplots(1,2)
fig1.set_size_inches((10,8))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-2,1],gt,"Gaussian",'b','-'))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-2,1],gt_1Diff,"First Order Gaussian",'r','-'))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-3,1],gt_2Diff,"2nd Order Gaussian",'g','-'))

Nfft=1025 # FFT points
Gs=S1d(gt,Nfft,par.par.loc['HSinP','Fs']) # Frequency Domain Signal
GsDiff=S1d(gt_1Diff,Nfft,par.par.loc['HSinP','Fs']) # Frequency Domain Signal
Gs2Diff=S1d(gt_2Diff,Nfft,par.par.loc['HSinP','Fs']) # Frequency Domain Signal

fig2,axf=plt.subplots(1,2)
fig2.set_size_inches((10,5))
plot1DSparametric(axf,Gs['f'],0.5,(0,Gs['S'],'b','-'),(0,GsDiff['S'],'r','-'),(0,Gs2Diff['S'],'g','-'))
angleDiff=180/pi*(np.angle(GsDiff['S'])-np.angle(Gs['S']))
axf[1].plot(GsDiff['f']/1e9,angleDiff)
axf[0].legend(['Gaussian', 'Gaussian1st','Gaussina2nd'])
axf[1].legend(['Gaussian', 'Gaussian1st','Gaussina2nd','Gaussian-Gaussian1st'])

ix=np.argmin(abs(Gs['f']-0))
print(ix)
axf[1].annotate("  Freq:"+str(int(Gs['f'][ix]))+" Ph:"+str(int(180/pi*np.angle(Gs['S'][ix]))), xy=(Gs['f'][ix], 180/pi*np.angle(Gs['S'][ix])),
                 xytext=(Gs['f'][ix], 180/pi*np.angle(Gs['S'][ix])+30),arrowprops=dict(arrowstyle='->', color='red'))

axf[1].annotate("  Freq:"+str(int(GsDiff['f'][ix]))+" Ph:"+str(int(180/pi*np.angle(GsDiff['S'][ix]))), xy=(GsDiff['f'][ix], 180/pi*np.angle(GsDiff['S'][ix])),
                 xytext=(GsDiff['f'][ix], 180/pi*np.angle(GsDiff['S'][ix])+30),arrowprops=dict(arrowstyle='->', color='red'))


str(int(180/pi*np.angle(GsDiff['S'][ix])))
```
## Gaussian Modulated Signal
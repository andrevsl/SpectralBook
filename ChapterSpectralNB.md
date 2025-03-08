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

# Narrow Band Signals
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
## Sinusoidal Signals

### Half Cycle Sin

The Half Cycle sinosoidal will be the base signal to analyse the Time/Freq spectrum, as the sinusoidal are commonly employed to analyse the frequency response of the microwave circuits, due to the narrow bandwidth, it easier to assess the characteristics for a single frequency.

If we have two half cycle sinusoidal signals with opposite phase as found below,

$$x_{t}^{+}(t,x)=\sin{(\omega_0 t-k_0x)}$$

$$x_{t}^{-}(t,x)=-\sin{(\omega_0 t-k_0x)}$$

**Applying fourier Transform**

$$x_{t}^{+}(t) \xrightarrow{\mathscr{F}}  X_{s}^{+}(f)=X_{s}(f)$$ 

$$x_{t}^{-}(t) \xrightarrow{\mathscr{F}}  X_{s}^{-}(f)=X_{s}(f)e^{i\pi}$$ 



$$x_{t}^{+}(t) \xrightarrow{\mathscr{F}}  X_{s}^{+}(f)= \int_{0}^{t_0/2}\sin{(2\pi f_0 t)} e^{-i 2\pi f t} dt$$ 

$$X_{s}^{+}(f)=\int_{0}^{t_0/2} \frac{e^{i 2\pi f_0 t}+e^{-i 2\pi f_0 t}}{2i} e^{-i 2\pi f t} dt$$ 

$$X_{s}^{+}(f)= \int_{0}^{t_0/2} \frac{e^{i 2\pi t(f_0-f)}}{2i}  dt+
                \int_{0}^{t_0/2} \frac{e^{-i 2\pi t(f_0+f)}}{2i}dt$$ 


$$X_{s}^{+}(f)= \frac{e^{i 2\pi t (f_0-f)}}{(i 2\pi (f_0-f))2i}  \biggl|_{0}^{t_0/2}
                + \frac{e^{-i 2\pi t(f_0+f)}}{(-i 2\pi (f_0+f))2i} \biggl|_{0}^{t_0/2}$$ 


being $t_0=1/f_0$


$$X_{s}^{+}(f)= \frac{e^{i 2\pi \frac{1}{2f_0} (f_0-f)}}{(i 2\pi (f_0-f))2i}  -\frac{1}{(i 2\pi (f_0-f))2i}
                + \frac{e^{-i 2\pi t(f_0+f)}}{(-i 2\pi (f_0+f))2i} \biggl|_{0}^{t_0/2}$$ 


The shape of the half cycle signals resemble a gaussian pulse (?) in frequency domain, we se that the amplitude is centered in zero frequency, even if the carrier frequency is 1 GHz. Insofar as two identical signals with opposite signals are summed, it nulls each other. In frequency domain, it is explained by the phase inversion (phase difference of 180 Degrees) for all frequency components as shown by the deduction above and the phase plots below.

```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]

# HALF SIN CODE
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle, cos
import pandas as pd
import matplotlib.pyplot as plt
from bookfuncs.py.simuParams import  SimuParam
from bookfuncs.py.PlotData.plotfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot1DSparametricUwrap

par=SimuParam()
par.par
# Time sinals
t=np.arange(par.par.loc['HSinP','t0'],1/(2*par.par.loc['HSinP','f']),par.par.loc['HSinP','dt'])
xt_0Deg=sin(2*pi*1e9*t)
xt_180Deg=-sin(2*pi*1e9*t)
xt_Diff=cos(2*pi*1e9*t) #np.diff(xt_0Deg)


# Fourier
Nfft=1025 # FFT points
Ys0Deg=S1d(xt_0Deg,Nfft,par.par.loc['HSinP','Fs']) # Frequency Domain Signal
Ys180Deg=S1d(xt_180Deg,Nfft,par.par.loc['HSinN','Fs']) # Frequency Domain Signal
YsDiff=S1d(xt_Diff,Nfft,par.par.loc['HSinN','Fs']) # Frequency Domain Signal

# Plot Half cycle Sin Signal
fig1,axt=plt.subplots(1,2)
fig1.set_size_inches((10,5))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-1,1],xt_0Deg,"Half Sin - Positive cycle",'b','-'),
                       (1,[t.min()/1e-9,t.max()/1e-9],[-1,1],xt_180Deg,"Half Sin - Negative cycle",'r','-'))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-1,1],xt_Diff,"Half Sin - Positive cycle",'g','-'))


# Frequency Domain of 
fig2,axf=plt.subplots(1,2)
fig2.set_size_inches((10,5))
plot1DSparametric(axf,Ys0Deg['f'],3,(0,Ys0Deg['S'],'b','-'),(0,Ys180Deg['S'],'r','-'),(0,YsDiff['S'],'g','-'))
angleDiff=180/pi*(np.angle(YsDiff['S'])-np.angle(Ys0Deg['S']))
axf[1].plot(Ys0Deg['f']/1e9,angleDiff)
axf[0].legend(['HalfSinP', 'HalfSinN','DiffHalfSinP'])
axf[1].legend(['HalfSinP', 'HalfSinN','DiffHalfSinP','HalfSinP-DiffHalfSinP'])

ix=np.argmin(abs(Ys0Deg['f']-0))
# print(ix)
axf[1].annotate("  Freq:"+str(int(Ys0Deg['f'][ix]))+" Ph:"+str(int(180/pi*np.angle(Ys0Deg['S'][ix]))), xy=(Ys0Deg['f'][ix], 180/pi*np.angle(Ys0Deg['S'][ix])),
                 xytext=(Ys0Deg['f'][ix], 180/pi*np.angle(Ys0Deg['S'][ix])+30),arrowprops=dict(arrowstyle='->', color='red'))

axf[1].annotate("  Freq:"+str(int(Ys180Deg['f'][ix]))+" Ph:"+str(int(180/pi*np.angle(Ys180Deg['S'][ix]))), xy=(Ys180Deg['f'][ix], 180/pi*np.angle(Ys180Deg['S'][ix])),
                 xytext=(Ys180Deg['f'][ix], 180/pi*np.angle(Ys180Deg['S'][ix])+30),arrowprops=dict(arrowstyle='->', color='red'))


```
### One Cycle Sin

Now we want to create the one cycle sin using the half signals. In order to achieve it, we gonna translate (delay) the negative half cycle by half period $t_0/2$,

$$x_{t}^{+}(t)=\sin{(2\pi f_0  t)}$$

$$x_{t}^{-}(t-t_0/2)=-\sin{(2\pi f_0 (t-t_0/2))}$$

**Adding both**

$$y_{t}=x_{t}^{+}(t)+x_{t}^{-}(t-t_0/2)=\sin{(2\pi f_0  t)}-\sin{(\omega_0 (t-t_0/2))}$$


Applying fourier Transform and fourier transform properties of time shifting

$$y_{t}(t) \xrightarrow{\mathscr{F}}  Y_{s}(f)=X_{s}(f)+X_{s}(f)e^{i\pi}e^{i\pi f t_0/2}$$ 

$$y_{t}(t) \xrightarrow{\mathscr{F}}  Y_{s}(f)=X_{s}(f)(1+e^{i\pi (1+f t_0/2)})$$ 


So we can note now, that independently of the signal shape, in this case a half sin, but for any arbitrary signal, if we add the arbitrary signal with its version out of phase and  time shifted one period, for the half sin, half period of one cycle, we add a null to the amplitude at the zero frequency. It's the fundamentals of the generation of the alternating current/voltages signals. A direct current signal usually has no alternation of positive and negative amplitude.

```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]

# One Cycle
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle
import pandas as pd
import matplotlib.pyplot as plt
from bookfuncs.py.simuParams import  SimuParam
from bookfuncs.py.PlotData.plotfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot2DTparametric,plot1DSparametricUwrap

par=SimuParam()
par.par
# Time sinals
tf=1/(par.par.loc['HSinP','f'])
tf2=2/(par.par.loc['HSinP','f']) # 2 ou N Periodos

t=np.arange(par.par.loc['HSinP','t0'],tf,par.par.loc['HSinP','dt'])
t2=np.arange(par.par.loc['HSinP','t0'],tf2,par.par.loc['HSinP','dt'])

xt_1P=sin(2*pi*1e9*t)
xt_NP=sin(2*pi*1e9*t2)

# Fourier
Nfft=1025 # FFT points
Ys1P=S1d(xt_1P,Nfft,par.par.loc['HSinP','Fs']) # Frequency Domain Signal
YsNP=S1d(xt_NP,Nfft,par.par.loc['HSinN','Fs']) # Frequency Domain Signal

# Plot Half cycle Sin Signal
fig1,axt=plt.subplots(1,2)
fig1.set_size_inches((10,8))
plot1DTparametric(axt,t,(0,[t.min()/1e-9,t.max()/1e-9],[-1,1],xt_1P,"One Sin cycle",'b','-'))
plot1DTparametric(axt,t2,(1,[t2.min()/1e-9,t2.max()/1e-9],[-1,1],xt_NP,"Two Sin cycle",'r','-'))

# Frequency Domain of 
fig2,axf=plt.subplots(1,2)
fig2.set_size_inches((10,5))
plot1DSparametric(axf,Ys1P['f'],3,(0,Ys1P['S'],'b','-'),(0,YsNP['S'],'r','-'))
ix=np.argmin(abs(Ys1P['f']-0))
print(ix)
# axf[1].annotate("  Freq:"+str(int(Ys1P['f'][ix]))+" Ph:"+str(int(180/pi*np.angle(Ys1P['S'][ix]))), xy=(Ys1P['f'][ix], 180/pi*np.angle(Ys1P['S'][ix])),
#                  xytext=(Ys1P['f'][ix], 180/pi*np.angle(Ys1P['S'][ix])+30),arrowprops=dict(arrowstyle='->', color='red'))

# axf[1].annotate("  Freq:"+str(int(YsNP['f'][ix]))+" Ph:"+str(int(180/pi*np.angle(YsNP['S'][ix]))), xy=(YsNP['f'][ix], 180/pi*np.angle(YsNP['S'][ix])),
#                  xytext=(YsNP['f'][ix], 180/pi*np.angle(YsNP['S'][ix])+30),arrowprops=dict(arrowstyle='->', color='red'))



# fig2,axf=plt.subplots(1,3)
# fig2.set_size_inches((10,5))


plt.show()
```
### Infinite Cycle Sin

Now we want to create the infinite cycle of a sin using the positive half signal$
$$x_{t}^{+}(t)=\sin{(2\pi f_0  t)}$$


In order to create the infinite sinusoidal function, infinite copies of $x_t$  are added at the left/right side lagged  $\frac{nt_0}{2}$  for $n=±1,2,3…$, presenting alternating phase inversion, as in the following,

<!-- $$ (-1)^n x_{t}^{+}(t \pm nt_0/2)= (-1)^n\sin{(2\pi f_0 (t\pm nt_0/2))}$$ -->

$$y_{t}=\sum_{n=-1}^{-\infty}(-1)^{-n} x_{t}^{+}(t-n t_0/2)+  x_{t}^{+}(t)   +\sum_{n=1}^{\infty}(-1)^n x_{t}^{+}(t-nt_0/2)$$

$$y_{t}=\sum_{n=1}^{\infty}(-1)^{-n} x_{t}^{+}(t+n t_0/2) +  x_{t}^{+}(t) + \sum_{n=1}^{\infty}(-1)^n x_{t}^{+}(t-nt_0/2)$$

Applying fourier Transform

$$y_{t}=\sum_{n=1}^{\infty}(-1)^{-n} X_{f}e^{i\omega t_0/2}+  x_{t}^{+}(t) + \sum_{n=1}^{\infty}(-1)^n x_{t}^{+}(t-nt_0/2)$$






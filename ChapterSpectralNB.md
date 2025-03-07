
# Narrow Band Signals

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

```{code-cell} ipython3
:tags: [remove-stderr]

import sys
print("this is some stdout")
print("this is some stderr", file=sys.stderr)
```
The shape of the half cycle signals resemble a gaussian pulse (?) in frequency domain, we se that the amplitude is centered in zero frequency, even if the carrier frequency is 1 GHz. Insofar as two identical signals with opposite signals are summed, it nulls each other. In frequency domain, it is explained by the phase inversion (phase difference of 180 Degrees) for all frequency components as shown by the deduction above and the phase plots below.


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


### Infinite Cycle Sin

Now we want to create the infinite cycle of a sin using the positive half signal$
$$x_{t}^{+}(t)=\sin{(2\pi f_0  t)}$$


In order to create the infinite sinusoidal function, infinite copies of $x_t$  are added at the left/right side lagged  $\frac{nt_0}{2}$  for $n=±1,2,3…$, presenting alternating phase inversion, as in the following,

<!-- $$ (-1)^n x_{t}^{+}(t \pm nt_0/2)= (-1)^n\sin{(2\pi f_0 (t\pm nt_0/2))}$$ -->

$$y_{t}=\sum_{n=-1}^{-\infty}(-1)^{-n} x_{t}^{+}(t-n t_0/2)+  x_{t}^{+}(t)   +\sum_{n=1}^{\infty}(-1)^n x_{t}^{+}(t-nt_0/2)$$

$$y_{t}=\sum_{n=1}^{\infty}(-1)^{-n} x_{t}^{+}(t+n t_0/2) +  x_{t}^{+}(t) + \sum_{n=1}^{\infty}(-1)^n x_{t}^{+}(t-nt_0/2)$$

Applying fourier Transform

$$y_{t}=\sum_{n=1}^{\infty}(-1)^{-n} X_{f}e^{i\omega t_0/2}+  x_{t}^{+}(t) + \sum_{n=1}^{\infty}(-1)^n x_{t}^{+}(t-nt_0/2)$$






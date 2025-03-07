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

```{code-cell} ipython3
:tags: [remove-stderr]

import sys
print("this is some stdout")
print("this is some stderr", file=sys.stderr)
```
## Space-Time Convention 3D


```{code-cell} ipython3
:tags: [scroll-output]

for ii in range(40):
    print(f"this is output line {ii}")
```
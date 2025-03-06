# Windows Signals 

Before go deep into the standard signals used for microwave applications. After passing throughout the spectral transformation theory, we've seen that the fourier transfom truncate the periodic signals, as well as the finite time signals, we've already been introduced to the first one, the rectangular pulse or rectangular window. The windows are very important due to the gold characteristics of the spetrum, the bandwidth, power profile, and time resolution, the complexity for the adc/dac to dectect or generate the signals.

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

## Triangular  Windows







# Wideband Signals

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


## Gaussian Modulated Signal
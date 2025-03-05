
<style>
.images{
    text-align:center;
}
</style>

# RC Load 
Considering a 1-port System, where the load is an RC circuit with reference port impedance $Z_0=50$, and load impedance, which is also the input impedance of the system,

$$
Z_{in}=Z_{L}=R+\frac{1}{j\omega C}
$$
#### Reflection Coeficient

Usually in electrical circuits we analyze the voltages ratio, i.e. the transfer fucntion, which relates the output voltage to the incident voltage. For mirowave system the reflection/trasmission coeficient is commonly used, it takes into account the effect of backwardwaves among the impedances, which in this case for 1-port circuit, it is equal to the $S_{11}$ at the source port,

$$
S_{11}=\frac{V^{-}_1}{V^{+}_1}=\frac{Z_{in}-Z_0}{Z_{in}+Z_0}=\frac{R+\frac{1}{j\omega C}-Z_0}{R+\frac{1}{j\omega C}+Z_0}
$$


$$
S_{11}=\frac{1+j\omega C(R-Z_0)}{1+j\omega C(R+Z_0)}
$$


We have a pole and a zero, located respectivelly at $p_1=-1/ (C(R+Z_0))$ and $z_1=-1/ (C(R-Z_0))$. 

**For $R=0$**

$$
S_{11}=\frac{1-j\omega C(Z_0)}{1+j\omega C(Z_0)}
$$
$$
|S_{11}|=1
$$
$$
\angle S_{11}=\arctan{(-\omega CZ_0)}-\arctan{(\omega CZ_0)}=-2\arctan{(\omega CZ_0)}

Then we have a All-Band Stop filter

$$


if $Z_{eq}=R-Z_0<0$

if $Z_{eq}=R-Z_0>0$

For the other cases we gonna have a high pass filter

#### Voltage Gain
Thus the transfer fucntion of Voltages would be, gain

$$
\frac{V_{L}}{V^{+}_1}=1+\frac{1+j\omega C(R-Z_0)}{1+j\omega C(R+Z_0)}
$$


$$
\frac{V_{L}}{V^{+}_1}=2\frac{1+j\omega RC}{1+j\omega C(R+Z_0)}
$$


**For $R=0$**

No zeros, on pole, then we have a low pass filter, since from frequency response theory the poles engenders a decaying output ? But everything was reflected at the S11. Thus for 1-port microwave circuits there is no sense to analyze voltage gains? but the reflection coeficient.


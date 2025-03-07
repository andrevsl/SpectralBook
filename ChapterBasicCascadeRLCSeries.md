
<style>
.images{
    text-align:center;
}
</style>


# Cascade RLC Series
$$
Z_{in}=Z_{L}=R+j\omega L+\frac{1}{j\omega C}
$$

In the laplace domain
$$
Z_{in}(s)=\frac{sR+s^2 L+1/ C}{s}
$$


In the laplace domain
$$

$$
## Reflection Coeficient

Usually in electrical circuits we analyze the voltages ratio, i.e. the transfer fucntion, which relates the output voltage to the incident voltage. For mirowave system the reflection/trasmission coeficient is commonly used, it takes into account the effect of backwardwaves among the impedances, which in this case for 1-port circuit, it is equal to the $S_{11}$ at the source port,

$$
S_{11}=
\frac{
    \frac{sR+s^2 L+1/ C}{s}-Z_0
    }{
     \frac{sR+s^2 L+1/ C}{s}+Z_0
    }
$$


$$
S_{11}=
\frac{
    s^2 L+s(R-Z_0)+1/ C
    }{
    s^2 L+s(R+Z_0)+1/ C
    }
$$

We have two pole and a zero, located respectivelly at 

$$

p_{1,2}=\frac{
-(R-Z_0)\pm \sqrt{(R-Z_0)^2-4L/ C}
}{
    2L
}

$$
$$

z_{1,2}=\frac{
-(R+Z_0)\pm \sqrt{(R+Z_0)^2-4L/ C}
}{
    2L
}

$$

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

## Quality Factor and Bandwidth

$$
Q=\frac{\omega L}{R}=\frac{1}{\omega RC}
$$


## Power

## Cascade Parallel of RLC series

<style>
.images{
    text-align:center;
}
</style>


# Cascade RLC Series

Let consider the 3 RLC circuits
$$
Z_{1}=R_1+j\omega L_1+\frac{1}{j\omega C_1}
$$

$$
\Gamma_{1}=\frac{Z_{1}-Z_0}
{Z_{1}+Z_0}
$$(Gamma1)

$$
Z_{2}=R_2+j\omega L_2+\frac{1}{j\omega C_2}
$$

$$
\Gamma_{2}=\frac{Z_{2}-Z_0}
{Z_{2}+Z_0}
$$(Gamma2)


$$
Z_{3}=R_3+j\omega L_1+\frac{1}{j\omega C_3}
$$

$$
\Gamma_{3}=\frac{Z_{3}-Z_0}
{Z_{3}+Z_0}
$$(Gamma3)


##  Parallel of 2- RLC series

By the definition

$$
Zeq=\frac{Z_1Z_2}{Z_1+Z_2}
$$

the reflection coeficient is

$$
\Gamma_{eq}=\frac{
    \frac{Z_1Z_2}{Z_1+Z_2}-Z_0
    }
    {
    \frac{Z_1Z_2}{Z_1+Z_2}+Z_0
    }
$$
$$
\Gamma_{eq}=\frac{
Z_1Z_2-Z_0(Z_1+Z_2)
    }
    {
  Z_1Z_2+Z_0(Z_1+Z_2)
    }
$$

if we multiply {eq}`Gamma1` and {eq}`Gamma2`

$$
\Gamma_{eq}=\frac{
Z_1Z_2-Z_0(Z_1+Z_2)
    }
    {
  Z_1Z_2+Z_0(Z_1+Z_2)
    }
$$

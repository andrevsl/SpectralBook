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

<style>
.images{
    text-align:center;
}
</style>

```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]
:tags: [hide-output]
#  Convention
!pip install pandas
!pip install mplcursors
!pip install scipy

from scipy.optimize import curve_fit
import numpy as np
import matplotlib.pyplot as plt
from numpy import pi, sin, cos, exp, tan, log,log10
from mplcursors import cursor  # separate package must be installed

from bookfuncs.py.simuParams import  SimuParam
from bookfuncs.py.PlotData.plotfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot1DSparametricUwrap,plot1DSparametricdB

```

# Coupled Circuits

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


##  Circuit Parallel of 2-RLC Series

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
\Gamma_{1\times 2}=\Gamma_{1}\Gamma_{2}=
(\frac{Z_{1}-Z_0}
{Z_{1}+Z_0})
(\frac{Z_{2}-Z_0}
{Z_{2}+Z_0})
$$
$$
\Gamma_{1\times 2}=
\frac{
Z_1Z_2-Z_0(Z_1+Z_2)+Z_0^2
    }
    {
  Z_1Z_2+Z_0(Z_1+Z_2)+Z_0^2
    }
$$


We can observe that the equations are very similar, considering the reference impedance $Z_0$ real valued.
$$
\Gamma_{eq}=\frac{
Z_1Z_2-Z_0(Z_1+Z_2)
    }
    {
  Z_1Z_2+Z_0(Z_1+Z_2)
    }
$$
$$
\Gamma_{1}\Gamma_{2}=
\frac{
Z_1Z_2-Z_0(Z_1+Z_2)+Z_0^2
    }
    {
  Z_1Z_2+Z_0(Z_1+Z_2)+Z_0^2
    }
$$

By mathematical properties you have vertical shifts at response, it does not alter the poles/zeros of the system, then only the losses are changed.

Though, we can be aided by the bode theory or frequency response analysis in order to design microwave filters, treating the circuits separatelly.

Then we fall into the Foster synthesis as explained previously. But Foster theory restrict to LC systems in series or parallel.  

```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]

def addElementCircuit(type,Z1,Z2):
    if type=='Series':
        Zeq=Z1+Z2
    if type=='Shunt':
        Zeq=(Z1*Z2)/(Z1+Z2)
    return Zeq

def createRLC(freq,type,R,L,C):
    omega=2*pi*freq
    if type=='Series':
        Z=R+1j*omega*L+1/(1j*omega*C)
    if type=='Shunt':
        Zc=1/(1j*omega*C)
        ZLind=1j*omega*L
        Z=addElementCircuit(type,Zc,ZLind)
        Z=addElementCircuit(type,Z,R)
    return Z

def gammaFromZ(Z0,Zeq):
    gamma=(Zeq-Z0)/(Zeq+Z0)
    return gamma

f=np.arange(0.1,40,0.1)*1e9
omega=2*pi*f
R1=50
R2=50
L1=1e-9
L2=1e-9
C1=1e-12
C2=0.1e-12
Z0=50
Z1=createRLC(f,'Series',R1,L1,C1)
Z2=createRLC(f,'Series',R2,L2,C2)
Zeq=addElementCircuit('Shunt',Z1,Z2)

Gamma=gammaFromZ(Z0,Zeq)
Gamma1=gammaFromZ(Z0,Z1)
Gamma2=gammaFromZ(Z0,Z2)

Gamma12=Gamma2*Gamma1


fig2,ax=plt.subplots(1,2)
fig2.set_size_inches((10,5))
plot1DSparametricdB(ax,f,[0,40],(0,Gamma,'b','-'),
                          (0,Gamma12,'r','-'))
ax[0].legend(['Gamma','Gamma1xGamma2'])
cursor(hover=True)
plt.show

```





















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

# Network Analysis - S-Parameters


Scattering parameters (S-Parameters) are commonly used to analyze newtork dynamics, because it takes into account the foward/backward waves or power travelling waves into the networks. However other techniques as Impedance/Admittance and ABCD matrices are also used as needed for a given application, but S-Parameters are usually the core among those transformations, because it deals as already stated with the concept of the power flow direction.
We gonna see that the forward or backward waves, as we've seen in previous section, it can have positive or negative polarity. Besides, this concept is crucial, because the foward waves that "really" carry the usefull power to the load or to the other side of the network. The backward waves, when not being seen as transmited power, yeilds power loss to the network as we gonna see further.

## N-Port

In a N- Port System, by definition, we gonna have N ports interacting with each other, exchanging power within a system, each one located at a defined plane of reference $t_n$, which will have a reference impedance $Z_{0n}$, forward waves leaving the port and entering the system $V^{+}_{n}$, and backward waves $V^{*}_{n}$ arriving from the system or reflected at the port $n$. 

<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1ET94oZxq5ziFZT_2WpiBvt7bqxCYaqoY" 
    style="width: 400px;  height: 400 px;display: block;margin-left: auto;margin-right: auto;"  />
(POZAR- fazer figura depois- adicionando a impedância de ref conectada a porta talvez, unica mudança talvez, figura muito legal)

The foward waves are related by the scaterring matrix {eq}`NSParMatrix` as found below.

$$
[V^{-}_n]=[S][V^{+}_n]
$$(NSParMatrix)


Generally normalized waves are employed due to interesting properties which facilite the analysis, being portable to be used or analyzed with different sources/load impedance, as we gonna see further. Where the normalized incident power wave is $a_n=V^{+}_n/\sqrt{Z_{0n}}$, and the reflected normalized power wave is $b_n=V^{-}_n/\sqrt{Z_{0n}}$, then we have

$$
[b_n]=[S][a_n]
$$(NSParPowerWaveMatrix)


```{prf:theorem} Characterization of the Exponential Distribution
:label: exp_unique

If $X$ is a random variable supported on $\RR_+$, then there exists a
$\lambda > 0$ such that $X \sim \Exp(\lambda)$ if and only if, for all
positive $s, t$,

$$
    \PP \{X > s + t \,|\, X > s \} = \PP \{X > t\}
$$ (memexpo)

```

### Ports terminated with a Reference Source

Then, for the voltages, following the Kirchhoff's laws, it is the addition of the foward and backward voltages, because the backward voltage it does not infer a negative voltage polarity, instead, a voltage which is generating a backward wave from the same terminals reference.

$$
V_{0n}=V_{0n}^{+}-V_{0n}^{-}
$$

<div class='images'>

<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1HJevSJNgrxOR0HLlT5kJRzvxaMkLOPYn" 
    style="width: 350px;  height: 400 px;"  />
</div>

On the other side, for the currents, also following the Kirchhoff's laws, it is the substraction of the foward and backward currents, hence a backward current implies direction, also opposite sign, so the negative signal is important, besides the current will be taken related to the reference impedance. Very mind blowing all that stuff. 

$$
I_{0n}=I_{0n}^{+}-I_{0n}^{-}
$$

Consideringthe generator have a voltage source $V_{gn}$ and a reference impedance $Z_{0n}$ attached to the port

$$
I_{0n}=I_{0n}^{+}-I_{0n}^{-}=\frac{1}{Z_{0n}}(V_{gn}^{+}-V_{0n}^{-})
$$

Then, replacing the equations () into () we gona find
$$
V_{0n}^{+}=\frac{V_{0n}+Z_{0n}I_{0n}}{2}  
$$

$$
V_{0n}^{-}=\frac{V_{0n}-Z_{0n}^{*}I_{0n}}{2} 
$$

The foward voltage can be defined as the voltage if the input impedance of the system $Z_{in}=Z_0^{*}$ is conjugated matched to the source impedance, in this case the reference impedance.

$$
V_{0n}^{+}=V_{gn}\frac{Z_0^{*}}{Z_0+Z_0^{*}}=V_{gn}\frac{Z_0^{*}}{2R_0}
$$
$$
I_{0n}^{+}=V_{gn}\frac{1}{2R_0}
$$

$$
P_{0n}^{+}=1/2\R {\{V_{0n}^{+}{I_{gn}^{+}}^{*}\}}=V_{gn}^2\frac{1}{8R_0}=\frac{1}{2}|a_n|^{2}
$$


$$
|a_n|=\sqrt{V_{gn}^2\frac{1}{4R_0}}=\frac{V_{gn}}{2\sqrt{R_0}}
$$

for power waves definition
 

$$
a_{0n}=\frac{V_{0n}+Z_{0n}I_{0n}}{2\sqrt{R_{0n}}}  
$$

$$
b_{0n}=\frac{V_{0n}-Z_{0n}^{*}I_{0n}}{2\sqrt{R_{0n}}}  
$$

### Reflection coeficient


The reflection coefficient stands for the ratio between the backward waves and forward waves voltages, implying that the port when excited with a signal which will generate foward wave, however, the system will not absorb totally the signal due to impedance mismatches, if it occurs, then a backward wave is generated with opposite direction.
Before connecting the $nth$ port to the soruce, we place the reference impedance $Z_{0n}$ at its termination, supposing we have a foward wave $V^{+}_{0n}$ incoming the system, and a backward wave  $V^{-}_{0n}$ leaving the system into the reference load. 

#### Source with a Reference Impedance
$$
   \Gamma_{G}=\frac{ Z_G-Z_0 } {Z_G+Z_0 }
$$


#### Port Terminated with a Reference Impedance

Attaching the reference impedance $Z_{0n}$ to the port of the system. By the scatering parameter definition we have,

$$
\Gamma_{n}^{in}=\frac{V^{-}_{0n}}{ V^{+}_{0n}}=\frac{\sum_{m=1}^{N} S_{nm}V^{+}_{0n}}{ V^{+}_{0n}}
$$

From the system we have

$$
V_{0n}=Z_{n}^{in}I_{0n}
$$

$$
V^{+}_{0n}+V^{-}_{0n}=Z_{n}^{in}\frac{V^{+}_{0n}-V^{-}_{0n}}{ Z_{0n}}
$$
Dividing by  $V^{+}_n$ and rearranging the equation we have

$$
\Gamma_{0n}^{in}=\frac{Z_{n}^{in}-Z_{0n}}{Z_{n}^{in}+Z_{0n}}
$$(GammaNthImpedance)

#### Load with a Reference Impedance
$$
\Gamma_{n}^{L}=\frac{Z_{Ln}-Z_{0n}}{Z_{Ln}+Z_{0n}}
$$(GammaLNthImpedance)


#### Port Terminated with a Source

The reference impedance provides flexibility to make the transformation for different source/load impedances. Attaching a generator, replacing the reference impedance by the voltage source $V_{gn}$ and  its source impedance $Z_{gn}$

<div class='images'>

<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1HJevSJNgrxOR0HLlT5kJRzvxaMkLOPYn" 
    style="width: 350px;  height: 400 px;"  />
</div>

The Refletion between the source impedance and the system can defined as
$$
\Gamma_{n}^{d}=\frac{Z_{n}^{in}-Z_{gn}}{Z_{n}^{in}+Z_{gn}}
$$(GammaGNthImpedance)

Across the system input impedance we have
$$
V_n=V_{gn} \frac{Z_{n}^{in}}{Z_{n}^{in}+Z_{gn}}
$$(vgNthTerminated)

from {eq}`GammaNthImpedance` and {eq}`GammaGNthImpedance`  


$$
Z^{in}_{n}=Z_{0n}\frac{1+\Gamma_{n}^{in}}{1-\Gamma_{n}^{in}}
$$(ZinFromGammaIn)

$$
Z_{gn}=Z_{0n}\frac{1+\Gamma_{0n}^{G}}{1-\Gamma_{0n}^{G}}
$$(ZgFromGammaG)

the replacing into {eq}`vgNthTerminated` and rearraging

$$
V_n=V_{gn} \frac{(1+\Gamma_{0n}^{in})(1-\Gamma_{0n}^{G})}
{2(1-\Gamma_{0n}^{in}\Gamma_{0n}^{G})}
$$

$$
V_{n}^{+}=V_{gn} \frac{(1+\Gamma_{0n}^{in})(1-\Gamma_{0n}^{G})}
{2(1-\Gamma_{0n}^{in}\Gamma_{0n}^{G})(1+\Gamma_{n}^{in})}
$$
(to be validated with simulations)

if $Z_{0n}=Z_{gn}$ implies $\Gamma_{0n}^{G}=0$

$$
V_{n}=\frac{V_{gn}}{2}(1+\Gamma_{0n}^{in})
$$


then we can infer
$$

V_{n}^{+}=\frac{V_{gn}}{2}
$$

 As expected by the electrical circuit theory, half voltage across the source impedance, and half voltage across the input impedace at the $nth$ port. For this reason the source impedance is preferred to be equal to the reference impedance.

#### Port Terminated with a Load


### Power
#### Input Power

The input power, it is only possible when a voltage source or current source is attached to the $nth$ port.

The power delivered to the system by the $nth$ port

$$

P_n=\frac{1}{2} \Re\{V_nI_n^{*}\} =\frac{1}{2Z_0}(|V_n^{+}|^2-|V_n^{-}|^2)

$$

### 2-Port

For a 2-Port System, the most employed in microwave systems as we are always analysing point-to-point networks, as power transmission lines, antenna matching circuits, amplifiers, phase shifters,etc. We will gonna analyze separetally this system.


<div class="images">
<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1AM-wG6j6wtHJWoK0YQQhSxhtK7xk7Dzr" 
    style="width: 450px;  height: 400 px;" />
<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1CSpsEMyn2YrWkT8Zwu0GF1IU5tygpy02" 
    style="width: 450px;  height: 400 px;"  />
</div>



For s-parameters measurements, it is commonly employed using incoming/outcoming waves normalized to a port reference impedance $Z_0=R_0+jX_0$, called power waves, it caracterizes the power flow, 

$$

a_{1}=\frac{ V_1^{+} }{ \sqrt{R_0} }=\frac{V_{1}+Z_0I_{1}}{2\sqrt{R_0}}  

$$

$$
b_{1}=\frac{ V_1^{+} }{ \sqrt{R_0} }=\frac{V_{1}-Z_0^{*}I_{1}}{2\sqrt{R_0}}  
$$

$$
a_{2}=\frac{ V_2^{+} }{ \sqrt{R_0} }=\frac{V_{2}+Z_LI_{2}}{2\sqrt{R_L}}   
$$

$$
b_{2}=\frac{ V_1^{+} }{ \sqrt{R_0} }=\frac{V_{2}-Z_L^{*}I_{2}}{2\sqrt{R_L}}  
$$


#### The Reflection coeficient

 In a 2-Port system we will define 4 reflection coeficients depending on the location and side it has been seen as ilustrated below. We gonna have the reflection coeficient $\Gamma_{in}$ for the signals outcoming from the generator at the port 1 toward the systems. 

$$
   \Gamma_{in}=\frac{V^{-}_{1}}{V^{+}_{1}}=\frac{ Z_{in}-Z_0 } {Z_{in}+Z_0 }
$$

$$
V^{-}_{1}=\frac{ S_{11}V^{+}_{1}+S_{12}V^{+}_{2}}{ V^{+}_1}=1+\frac{ S_{12}V^{+}_{2}}{ V^{+}_1} \\

V^{-}_{2}=\frac{ S_{21}V^{+}_{1}+S_{22}V^{+}_{2}}{ V^{+}_2} \\
$$


$$
   \Gamma_{in}=S_{11}+\frac{ S_{12}S_{21}\Gamma_L } {1- S_{22}\Gamma_{L}}
$$
The reflection coeficient $\Gamma_G$, for the signals incoming into the generator at the port 1 from the network. 
$$
   \Gamma_{G}=\frac{ Z_G-Z_0 } {Z_G+Z_0 }
$$

The reflection coeficient $\Gamma_L$, for reaching the load at the port 2.

$$
   \Gamma_{L}=\frac{V^{+}_2}{V^{-}_2}==\frac{ Z_L-Z_0 } {Z_L+Z_0 }
$$


The reflection coeficient $\Gamma_{out}$, for the signals leaving the Load toward the netwrok at the port 2.

$$
   \Gamma_{out}=\frac{ Z_{out}-Z_0 } {Z_{out}+Z_0 }
$$

#### Input Impedance

$$
   Z_{in}=Z_{11}-\frac{ Z_{12}Z_{21}} {Z_{22}+Z_L}
$$


####63 Power Gain

- Power gain
- Transducer power Gain
- Avalaible power Gain
- Operating power Gain



### 1-Port

#### Input Impedance

$$
   Z_{in}=Z_{11}=Z_L
$$


#### Power 
$$
   Z_{in}=Z_{11}=Z_L
$$



### Microwave vs Electrical Circuits Point of View

The trick part is when to treat the system as the traditional electric circuit, and when treat as microwave elements which can have impedance mismatches adn reflections. We need to treat as both.
From electric circuit's law, related the generator connected to a given port. 

#### Maximum Power Transfer
In order to have maximal power transfer
Usually Electrical circuits and Microwave circuits, respectivelly,
$$
   Z_{0}=Z_{in}^{*}
$$

$$
   Z_{0}=Z_{in}
$$

As we've already known the electrical systems and microwave don't like reactive energy, then to respect both conditions, ensure maximal power transmission, the reference impedances and impedances of the sytems (input, output, load, Source) impedances must be real valued.

#### Measurements
In order to obtain the scattering matrix elements, generally to have an exact solution for the systems, one excitation port voltage is excited at time, the excitation signal wil be cosneidered $V^{+}_n$, all other port are measured, the value obetained will be $V^{-}_n$, including the backward wave of the excited port using directional couplers (vector analyzers).


#### 1-Port Excited All others Passive Port

$$
[\Gamma_n]=\frac{V^{-}_n}{ V^{+}_n}=\frac{\sum_{m=1}^{N} S_{nm}V^{+}_{n}}{ V^{+}_n}
$$


#### All Port Excited 

$$
[\Gamma_n]=\frac{V^{-}_n}{ V^{+}_n}=\frac{\sum_{m=1}^{N} S_{nm}V^{+}_{n}}{ V^{+}_n}
$$


# Network Analysis - Z/Y-Parameters 

# Network Analysis - ABCD-Parameters


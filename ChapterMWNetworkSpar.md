
<style>
.images{
    text-align:center;
}
</style>

# Network Analysis - S-Parameters

Scattering parameters (S-Parameters) are commonly used to analyze newtork dynamics, because it takes into account the foward/backward waves or power travelling waves into the networks. However other techniques as Impedance/Admittance and ABCD matrices are also used as needed for a given application, but S-Parameters are usually the core among those transformations, because it deals as already stated with the concept of the power flow direction.
We gonna see that the forward or backward waves, as we've seen in previous section, it can have positive or negative polarity. Besides, this concept is crucial, because the foward waves that "really" carry the usefull power to the load or to the other side of the network. The backward waves, when not being seen as transmited power, yeilds power loss to the network as we gonna see further.

### N-Port

In a N- Port System, by definition, we gonna have N ports interacting with each other, exchanging power within a system, each one located at a defined plane of reference $t_n$, which will have a reference impedance $Z_{0n}$, forward waves leaving the port and entering the system $V^{+}_{n}$, and backward waves $V^{*}_{n}$ arriving from the system or reflected at the port $n$.

<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1ET94oZxq5ziFZT_2WpiBvt7bqxCYaqoY" 
    style="width: 400px;  height: 400 px;display: block;margin-left: auto;margin-right: auto;"  />
(POZAR- fazer figura depois)

The foward waves are related by the scaterring matrix {eq}`NSParMatrix` as found below.

$$
[V^{-}_n]=[S][V^{+}_n]
$$(NSParMatrix)


##### Power Waves

Generally normalized waves are employed due to interesting properties which facilite the analysis, being portable to be used or analyzed with different sources/load impedance. Where the normalized incident power wave is $a_n=V^{+}_n/\sqrt{Z_{0n}}$, and the reflected normalized power wave is $b_n=V^{-}_n/\sqrt{Z_{0n}}$, then we have

$$
[b_n]=[S][a_n]
$$(NSParPowerWaveMatrix)

Then, for the voltages, following the Kirchhoff's laws, it is the addition of the foward and backward voltages, because the backward voltage it does not infer a negative voltage polarity, instead, a voltage which is generating a backward wave from the same terminals reference.

$$
V_n=V_n^{+}+V_n^{-}
$$


On the other side, for the currents, also following the Kirchhoff's laws, it is the substraction of the foward and backward currents, hence a backward current implies direction, also opposite sign, so the negative signal is important, besides the current will be taken related to the reference impedance. Very mind blowing all that stuff. 

$$
I_n=I_n^{+}-I_n^{-}=\frac{1}{Z_{0n}}(V_n^{+}-V_n^{-})
$$

Then, replacing the equations () into () we gona find

$$
V_n^{+}=\frac{V_{n}+Z_{0n}I_{n}}{2}  
$$

$$
V_n^{-}=\frac{V_{n}-Z_{0n}I_{n}}{2} 
$$

##### Refleciton coeficient


$$
[\Gamma_n]=\frac{V^{-}_n}{ V^{+}_n}=\frac{\sum_{m=1}^{N} S_{nm}V^{+}_{n}}{ V^{+}_n}
$$

##### Input Impedance


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
   \Gamma_{in}=\frac{ Z_{in}-Z_0 } {Z_{in}+Z_0 }=S_{11}+\frac{ S_{12}S_{21}\Gamma_L } {1- S_{22}\Gamma_{L}}
$$

$$
V^{-}_{1}=\frac{ S_{11}V^{+}_{1}+S_{12}V^{+}_{2}}{ V^{+}_1}=1+\frac{ S_{12}V^{+}_{2}}{ V^{+}_1} \\

V^{-}_{2}=\frac{ S_{21}V^{+}_{1}+S_{22}V^{+}_{2}}{ V^{+}_2} \\
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
   \Z_{in}=Z_{11}-\frac{ Z_{12}Z_{21}} {Z_{22}+Z_L}
$$


#### Power Gain

- Power gain
- Transducer power Gain
- Avalaible power Gain
- Operating power Gain

#### Voltage Gain
$$
\frac{V_{2}}{V^{+}_1}=\frac{V^{+}_2+V^{-}_2}{V^{+}_1}=
\frac{\Gamma_LV^{-}_2}{V^{+}_1}+S_{21}=
(\Gamma_L+1)S_{21}
$$ 
#### Current Gain
$$
\frac{I_{2}}{I^{+}_1}=
(\Gamma_L-1)S_{21}
$$ 
### 1-Port

#### Input Impedance

$$
   Z_{in}=Z_{11}=Z_L
$$


#### Power 
$$
   Z_{in}=Z_{11}=Z_L
$$

#### Voltage Gain

$$
\frac{V_{L}}{V^{+}_1}=\frac{V^{+}_1+V^{-}_1}{V^{+}_1}=1+S_{11}=\frac{V_g}{V^{+}_1}\frac{Z_{in}}{Z_{in}+Z_0}
$$ 


#### Current Gain
Analogously, the current gain

$$
\frac{I_{L}}{I^{+}_1}=\frac{V^{+}_1-V^{-}_1}{V^{+}_1}=1-S_{11}
$$

### Microwave vs Electrical Circuits Point of View

The trick part is when to treat the system as the traditional electric circuit, and when treat as microwave elements which can have impedance mismatches adn reflections.
From electric circuit's law, related the generator connected to a given port. 

<div class='images'>

<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1HJevSJNgrxOR0HLlT5kJRzvxaMkLOPYn" 
    style="width: 350px;  height: 400 px;"  />
</div>

You cannot do that, because when you attach the generator you have another system, the voltages $V_n^{+/-}$ and current will change. 

$$
V_n=Z^{in}_{n}I_n=V_{gn}-Z_g(I_n^{+}-I_n^{-})=V_{gn}-Z_g\frac{(V_n^{+}-V_n^{-})}{Z_{0n}}
$$


$$
V_2=Z_LI_2=Z_L\frac{V_2^{+}-V_2^{-}}{Z_{0n}}
$$

The reference impedance provides flexibility to make the transformation for different source/load impedances.


$$
V_n=Z^{in}_{n}I_n=V_{gn}-Z_g(I_n^{+}-I_n^{-})=V_{gn}-Z_g\frac{(V_n^{+}-V_n^{-})}{Z_{in}}
$$


The power delivered to the load is (to do for the complex impedance case)

$$

P_L=\frac{1}{2} \Re\{V_1I_1^{*}\} =\frac{1}{2Z_0}(|V_1^{+}|^2-|V_1^{-}|^2)

$$

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


# Application to Antenna Systems


## Introduction 

Antenna design is an important part of the development of  many electronic devices and for new generations of mobiles telecommunications systems. Mobility and comfort are some advantages that wireless communications provide to society. Different techniques for antenna optimization are used in literature, however, sometimes without translate and interpret physically some basic principles for researchers and engineers. These insights can be essential and very useful in antenna design, giving many degrees of freedom to antenna engineer and researchers to optimize their structures. We aim to build an overview of some approaches that can help antennas engineer in the optimization and physical understanding.    

The antenna can be viewed by three perspectives in accordance with [1]-[3]. Firstly, as a transducer that couple electric power into radiated electromagnetic energy. Secondly as an electric circuit element, a powerful tool and maybe the preferred for the most radiofrequency (RF) engineers, aided especially by smith charts and transmission line theory [3]. And finally by electromagnetic (EM) view, where the field’s distribution should comply with Maxwell’s equations. In this context, metasurfaces and transformation optics techniques that control EM’s signatures efficiently have been widely employed after Pendry [4] and Leonhardt [5] disclosure of the electromagnetic cloak.

On the other hand, solving analytically complex electromagnetic problems can be laborious. Computational techniques as Finite Element Method (FEM), Finite Difference Time Doman (FDTD), Method of Moments and Integral Methods are preferred to simplify and accelerate the analysis in the design process [2],[6]-[7]. Generally, commercial software provides built-in optimization algorithms as interpolated quasi newton, particle swarm, and genetic algorithm [8]-[9]. However, it works well for fine-tune mostly, being the initial concept and design still dependent on the physical basis of the researches and antenna engineers.


## Antenna Perspectives

As pointed out in previous chapter, antenna may be analyzed by three different kinds of operation, as a transducer, a radiator and, an electric circuit element, being all intrinsic related to each other. The radiation quality may be evaluated by its energy conversion efficiency, equivalent circuit parameters behavior as by its radiation characteristics. These items are discussed in following sub items.

### Electric Circuit Element

In order to create radiation, everything begins with a current flow which excitate a transmission line waveguide or waevguides.

Antenna treatment as circuit element may be the most interesting way to optimize antenna impedance matching and performance, but still dependent of the other viewpoints. It can be regarded as a transmission line (generally open-ended) or a waveguide, or even a bandpass filter, which possess its circuit elements characteristics, as resistance, conductance, inductance and capacitance. The optimization of the antenna performance is mainly based on fine-tuning of these parameters, being possible, even by modifying antenna structure or materials, by adding proper a lumped reactance (Foster) or nonlinear and active elements to achieve some specials features (non-Foster) [3].

As well known in literature the antenna circuit can be represented by a simple circuit presenting radiation resistance $R_{rad}$, loss resistance $R_{loss}$, and a reactance $X_{A}$. Also as a transmission line model with characteristic impedance $Z_{0}$, that works as a impedance transformer between generator impedance  $Z_{0}$ to free space wave impedance $\eta_0$ in the medium as shown in eq. (3). 


![image.png](.\bookimages\AntennaChapter\AntennaCircuit.png)

<!-- <img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1wQ1a23yn0DjUxHOTGMt-yfg3RfNskui5" 
    style="width: 300px;  height: 300 px"  />
<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1wQbXkHxG__qFOIhwyXBQ-OnLGHEJ28j8" 
    style="width: 300px;  height: 300 px"  /> -->



### Electromagnetic Radiator

Good radiation is the main objective of antenna design and, an analysis by means of electromagnetic theory is essential to predict and improve antenna performance. 


In addition, solving the Helmholtz homogeneous wave equation is the starting step to solve any electromagnetic problem [10]-[11]. As a consequence of being a second-order differential equation and a linear operator, the solution of wave equation yields a linear combination of eigenfunctions that depending on the coordinate system, can be even harmonic functions as sines, cosines, and complex exponentials, satisfying Laplace equation for the Cartesian coordinate system, or Bessel’s functions well fitted for cylindrical and spherical coordinates [11]. Meanwhile, the eigenvalues are always related to the wave phase constant (frequency) as shown in (2b), in frequency domain form [12]. In order to ensure the uniqueness theorem, proper Cauchy boundary conditions must be applied to these Sturm-Liouville problems [14].

<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
    TeX: { equationNumbers: { autoNumber: "AMS" } }
});
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js"></script>

$$

\nabla^2 E+k^2 E=0  
$$


$$

[L+\alpha]E=0
$$


 being   $L= ∇^2$ and  $α=k^2$     

$$

 E=\sum_{-\infty}^{+\infty} a_n f_n (α_n d_n )
$$

for a eigenfunction $f_n $    

Then, applying Fourier Spectral transform twice in (2a) over space domain similar to the Fourier transformation that yields frequency form, we obtain equation (4a) and (4b). From it, we can infer that to respect the wave equation, electromagnetic fields radiated should vary over space with an angular (or spatial) wave constant equal to the time/frequency wave constant (eigenvalue). In others words, EM field’s spatial oscillation should have the same period of the time oscillations. If for a given eigenvalue, fields do not respect this condition, it will vanish rapidly.

$$

-K^2 E+k^2 E=0             
$$

Then

$$K=k $$   

The  boundaries condition upon a surface o an antenna can written as found below, taking into account the Maxwell's equations and the impedance of any source with surface impedance $Z_s$

$$

    [(\overline{E}_s+\overline{E}_{i})\cdot \overline{a}_t]\overline{a}_t=Z_s\overline{J}
$$


$$

      L_s(\overline{J})= -j\omega \mu \iint\limits_S\overline{J} \frac{e^{-j k R}}{4 \pi R} dS^{'} +
    \nabla \biggl[ \frac{1}{j\omega \epsilon}\iint\limits_S \nabla \cdot \overline{J}\frac{e^{-j k R}}{4 \pi R} dS^{'}  \biggl] 
    
$$


$$

\overline{E}_{i}\cdot \overline{a}_t=Z_s\overline{J}+j\omega \mu \iint\limits_S\overline{J} \frac{e^{-j k R}}{4 \pi R} dS^{'} -
    \nabla \biggl[ \frac{1}{j\omega \epsilon}\iint\limits_S \nabla \cdot \overline{J}\frac{e^{-j k R}}{4 \pi R} dS^{'}  \biggl] 
$$


$$
\overline{E}_{i}\cdot \overline{a}_t=Z_{self}\overline{J}+Z_{emcoupling}\overline{J}
$$


### Transducer

Antenna is basically an energy converter that couples electric power into radiated electromagnetic power, and vice-versa. In this context, energy efficiency is often a major concern for their applications. Thus, electromagnetic radiated power by an antenna should be as close as possible of the electric power delivered at its terminals. Being the radiated electromagnetic power dependent of the electric field E and magnetic field H as expressed in (1a), and for electric counterpart, from voltage V and current I (1b) [10].

$$
P=\frac{1}{2}VI^{*}=\frac{1}{2}Re\{E\times H^{*}\}
$$



## Impedance Matching Techniques

### Smitch Chart 
The Smith charts  Theory to write after

<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1f1zCzXU-T6J6sROk2-syS3aSlxQ2vMIN" 
    style="width: 400px;  height: 400 px;display: block;margin-left: auto;margin-right: auto;"  />

If you have a Anntenna load, and a intput reflection coeficient. 
You are measuring the input reflection at terminals of the load. Then, in order to add an electric component going toward the generator (CW) in the Smith chart. However if you have a transmisiion Line or antenna electric path, and tou need information about the impedances of the antenna, you go toward the load direction (CCW) in the Smith chart.


![image.png](.\bookimages\AntennaChapter\AntennaCircuit.png)

You have many classical electric components options to build your matching network
Simulation Paremeters

Dipole Matlab/MoM  

- Series Inductance
    - S11
    - Voltage/Current Gains
    - Time Domain
    - Poles/Zeros
    - Check Foster Theorem

- Series Capacitance
- Series Resistor
- Shunt Inductance
- Shunt Capacitance
- Shunt Resistors
- Stubs

### Applications Situations ( Guidelines )

####  Narrowband Impedace Matching 
##### Quarter Wavelength
-   <ins>Characteristics</ins>
-   <ins>Application</ins>   

#####  L section
-   <ins>Characteristics</ins>
-   <ins>Application</ins>
    - If the RLoad > Rgenerator -> config Shunt+Series
    - If the RLoad < Rgenerator -> config Series+Shunt

##### PI/T section 
-   <ins>Characteristics</ins>
    - Narrow than L-section
-   <ins>Application</ins>   
    
##### Stubs
##### Coils

### Wideband Impedace Matching 
- Multisection
- Tapering
- Cascade Impedance Mataching

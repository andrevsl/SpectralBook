
# Microwave: Transmission Lines

## General Overview
  Electrical circuits are topological networks, topology in mathematical concept, which studies the space properties invariance under continous deformation. We have an arrangement of nodes, and edges, where the disposition does not matter, but the interaction. Will it matter in the microwave circuits? (Or still topological). The electromagnetic properties will change? The voltages, currents remain unchangeable if you stretch the transmission lines, what does justifies the topological idea of the electromagnetism. The symmetric operations? Graph theory also helps to visualize and decribe the interconexions, as well as, to optimize this circuits, the telecommunication and computer science have stolen the ideas.
    
  Electric circuits are the basic representation of the electromagnetic circuits, being both the same, which the concerned metrics are Voltages and Currents. In the microwave countepart we add the beauties of the electromagnetic fields and its effects as main metrics. 
  


  {cite}`balanisAntenna`.


### Justification
   In the literature we will commonly find the time analysis using narrow band signals. However wide band signals can provide a richer time-space-frequency resolution from the time motion of the current. Using Full Wave simulations of the transmission lines and waveguides, we will try to analyse practical application of the time-frequency-space domain analysis.



###  Linear Space and Time Varying (2D)
The voltage waves and currents for a canonical transmission line with a time dimension and one spatial dimension can be defined as

\begin{equation}
V(t,z)=V^{+}(t,z) e^{-\gamma_z \cdot z } + V^{-}(t,z)e^{\gamma_z \cdot z }
\end{equation}

\begin{equation}
V(t,z)=V^{+}(t,z) e^{-\gamma_z \cdot z } + V^{-}(t,z)e^{\gamma_z \cdot z } 
\end{equation}

$$I(t,z)=I^{+}(t,z) e^{-\gamma_z \cdot z } + I^{-}(t,z)e^{\gamma_z \cdot z } $$

In frequency-time domain

$$V(f,z)=V^{+}(f,z) e^{-\gamma_z \cdot z } + V^{-}(f,z)e^{\gamma_z \cdot z } $$

$$I(f,z)=I^{+}(f,z) e^{-\gamma_z \cdot z } + I^{-}(f,z)e^{\gamma_z \cdot z } $$

### 2.2 Planar Space and Time Varying (3D)

For  planar circuits, with one time dimension and two spatial dimentions

$$V(t,\overline{s})=V^{+}(t,\overline{s}) e^{-\overline{\gamma} \cdot \overline{s} } + V^{-}(t,\overline{s})e^{\overline{\gamma} \cdot \overline{s} } $$


## 3 Characteristic Impedance
For homogeneous and symmetric transmission line along their length, the geometry remains unchangeble, the characteristic impedance will be constant, i.e., space and time independent. However for antennas and microwave circuits which are in general heavly assymetric, the characteristic impedance will depend on spatial coordinates.

### 2.1 Linear Space and Time Varying (2D)

Considering that the electrical properties of the transmission line are time-independent, only space variant

$$Z_{0}=\frac{V^{+}(z)}{I^{+}(z)} =\frac{V^{+}(z)}{I^{+}(z)} $$


### 2.1 Planar Space and Time Varying (3D)

or for 2D (?)

$$Z_{0x}(x,y)=?\frac{V^{+,-}_x(x,y)}{I^{+,-}_x(x,y)} =+ or - \frac{V^{-,+}_x(x,y)}{I^{-,+}_x(x,y)} $$

$$Z_{0y}(x,y)=?\frac{V^{+,-}_y(x,y)}{I^{+,-}_y(x,y)} =+ or - \frac{V^{-,+}_y(x,y)}{I^{-,+}_y(x,y)} $$


$$E^2=E_{x}^2+E_{y}^2+E_{z}^2$$

$$V^2(x,y,t)=V_{x}^2(x,y,t)+V_{y}^2(x,y,t)=[Z_{0x}(x,y,t)I_{x}(x,y,t)]^2+[Z_{0y}(x,y,t)I_{y}(x,y,t)^2$$

$$V=\int_{0}^{l} E_{x}(x,y,t) \cdot dx \approx =\sum_{0}^{n } E_{n }(n \Delta x,y) \Delta x $$

Considering the coupling between Electromagnetic Polarizations, the divergence of electric field is not zero,


$$V_x=Z_{xx}I_x +Z_{xy}I_{y}$$

$$V_y=Z_{yx}I_x +Z_{yy}I_{y}$$


Usin the Method of Moments, it is possible to obtain an approximation of the impedances

$$ Z^{xx}_0=\frac{E^{+}_{n \Delta x} \Delta x}{I^{+}_{n \Delta x}}=-\frac{E^{-}_{n \Delta x} \Delta x}{I^{-}_{n \Delta x}}  \ ?$$


$$ Z^{yy}_0=\frac{E^{+}_{n \Delta y} \Delta y}{I^{+}_{n \Delta y}} \ ? $$




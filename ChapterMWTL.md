
# Microwave: Transmission Lines


Differently from the conventional electrical circuits with low frequency where this effects can be neglete.Within the Microwave system, where the wavelength is comparable to the structure, the voltages and current will interact with the different impedances among the system, generating backward waves or reflected wavesm in opposite sense of the excitation signa, called foward wave, as alread introduced in the AC voltage section. 
The foward voltage can be defined as the 

The voltage waves can have positive or negative polarities, different different directions.
However the current will

Examples
- Foward Voltage Wave with Positive Polarity ->Foward Current

- Foward Wave with Negative Polarity -> Foward Current

- Backward Voltage Wave with Positive Polarity ->Backward Current

- Backward Wave with Negative Polarity -> Foward Current

An electrical circuit with different series impedances should be treated taking into account those interactions.


###  Linear Space and Time Varying (2D)
The voltage waves and currents for a canonical transmission line with a time dimension and one spatial dimension can be defined as
$$
V(t,z)=V^{+}(t,z) e^{-\gamma_z \cdot z } + V^{-}(t,z)e^{\gamma_z \cdot z }
$$


$$
I(t,z)=I^{+}(t,z) e^{-\gamma_z \cdot z } + I^{-}(t,z)e^{\gamma_z \cdot z } 
$$

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



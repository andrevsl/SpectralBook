
# Modelagem pelo Método de Ondas Planas e Linhas de Transmissão

Método de ondas planas, também um clássico e extraordinário, uma vez que todo campo eletromagnético pode ser decomposto em um espectro de ondas planas, se o divergente do camplo eletromagnético for zero, tratando o problema também no espaço spectral dos ângulos, direções das ondas incidentes, ele analisa as reflexões e transmissões de ondas planas entre diferentes meios, levando conta suas características dos meios a partir das impedâncias das ondas eletromagnéticas nos respectivos meios. 

O método das Linhas de transmissão também compartilha a mesma essência do método de ondas plans, mas neste método se dá com a manipulação das impedâncias e parâmetros de circuitos elétricos, tendo também muita importância no desenvolvimento dos ciruitos eletromagnéticos das antenas, como o a optimização do casamento de impedâncias, pode-se tratar todo o sistema de irradiação como um circuito elétrico.

Logo, tem-se a visão tanto espaço espectral ângular como do espaço spectral frequencial, assim como a modelagem por circuitos elétricos.

### Descrição do Método 

Neste método, considera-se uma onda incidente que se propaga na linha de transmissão do ar, e alcança uma discontinuidade, representada por uma impedância superficial $Z_s$, que representa a RIS. Essa impedância irá espalha um campo eletromagético, assim como transmitir outro campo eletromagnético na linha de transmissão do ar.

<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1i2FgcvuscNZaELtdCInN_5nCSkCVawbb" 
    style="width: 300px;  height: 300 px;display: block;margin-left: auto;margin-right: auto;"  />


Dadas as condiçõoes de contorno e a definição dos campos \cite{A}, a impedância vista da RIS representada pela impedância superficial e o meio 2 que pode ser considerado uma linha de transmissão com impedância de onda $\eta_2^{TM}$ , é dada por,

$$

   Z_{in}= \frac{Z_s \eta_2^{TM} }{\eta_2^{TM}+Z_s}

$$

Se o meio 2 é o idêntico ao meio 1, e todos os dois, o espaço Livre, o caso da RIS, pois a impedância superficial encapsula toda estrutura, temos $\eta^{TM}_{2}=\eta^{TM}_1=\eta^{TM}_0$

E o coeficiente de reflexão se deduz como,

$$
   \Gamma= \frac{Z_{in}-\eta_1^{TM}}
    {Z_{in}+\eta_1^{TM}}
$$(GammPWTLZin)

Se os dois meios forem o espaço livre,

$$
    \Gamma=\frac{-\eta^{TM}_0}{2Z_s+\eta^{TM}_0}
$$

A impedância superficial em relação ao coeficiente de reflexão



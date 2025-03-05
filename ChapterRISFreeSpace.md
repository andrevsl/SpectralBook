
# Metodo do Espaço Livre

A propagação no espaço livre, no campo distante, é largamente utilizada e descrita pela equação Fris. Porém, sendo necessária a obtenção dos parâmetros de ganho das antenas, área efetivas e potência de transmissão. Os dois primeiros obtidos geralmente por simulações numéricas das antenas. Por outro lado para cenários de espalhamento e de propagação mais complexa, a física ótica e/ou traçado de raios (ray tracing) é amplamente empregado pelos pesquisadores e engenheiros.

Dentro deste contexto, deriva-se a potência e eficiência espectral para um único usuário, uma IRS único transmissor (podendo ser um arranjo de antena) utlizando a equação de Fris {[}27{]}. Inferindo as potências
recebidas a partir da área efetiva e do radar cross section da IRS que cálcularemos com o método dos momentos. Portanto, a densidade de potência incidente a partir do transmissor direcionada ao usúario e à IRS são, respectivamente, descritas por,

$$

W_{txk} = W_{0txk}G_{txk} = \frac{P_{t}G_{t}(\theta_{txk},\phi_{txk})}{(4\pi R_{1}^{2})}

$$

$$
W_{txirs} = W_{0txirs}G_{txirs} = \frac{P_{t}G_{t}(\theta_{txirs},\phi_{txirs})}{(4\pi R_{2}^{2})}
$$


Define-se como $\lambda$ o comprimento de onda,
$G_{txk} = G_{t}(\theta_{txk},\phi_{txk})$ o ganho da antena transmissora na direção do usuário,
$G_{txirs} = G_{t}\left( \theta_{txirs},\phi_{txirs} \right)$ o ganho da antena transmissora na direção da IRS, $G_{r}(\theta_{rxtx},\phi_{rxtx})$ o ganho da antena do usuário na direção do transmissor, $A_{rxtx}$ a área efetiva do usuário na direção do transmissor, $P_{t}$ a potência de transmissão, $R_{1}$ a distância entre o transmissor e o usuário, e $R_{2}$ a distância entre o transmissor e a IRS. Logo, a potência recebida diretamente pelo usuário diretamente do AP é,

$$
P_{tx - user} = W_{txk}A_{rxtx} = \frac{P_{t}G_{t}\left( \theta_{txk},\phi_{txk} \right)G_{r}\left( \theta_{rxtx},\phi_{rxtx} \right)\lambda^{2}}{\left( 4\pi R_{1} \right)^{2}}
$$


A área efetiva da IRS e do usuário receptor para o feixe advindo da IRS são dadas, respectivamente, como
$$

A_{irs} = \sigma_{irs}(\theta_{irs},\phi_{irs})
$$

$$
A_{rxirs} = \left( \frac{\lambda^{2}}{4\pi} \right)G_{r}\left( \theta_{rxirs},\phi_{rxirs} \right)\ 
$$


Sendo $\sigma_{irs}(\theta_{irs},\phi_{irs})$, o \emph{radar crosssection} da IRS na direção do usuário,
$G_{r}\left( \theta_{rxirs},\phi_{rxirs} \right)$  O ganho da antena na direção do feixe advindo da IRS. Obtem-se a potência recebida pela IRS para a distância $R_{1}$ entre o transmissor e a IRS, como,

$$
P_{irs} = W_{txirs}A_{irs} = \frac{P_{t}G_{t}(\theta_{txirs},\phi_{txirs})}{(4\pi R_{2}^{2})}\sigma_{irs}\left( \theta_{irs},\phi_{irs} \right)
$$


Analogamente, define-se a densidade de potência da onda espalhada pela
IRS na direção do usuário por uma distância $R_{3}$,

$$
W_{s} = \frac{P_{irs}}{(4\pi R_{2}^{2})} = \frac{P_{t}G_{t}(\theta_{txirs},\phi_{txirs})}{\left( 4\pi R_{2}R_{3} \right)^{2}}\sigma_{irs}\left( \theta_{irs},\phi_{irs} \right)
$$

Deste modo, a potência recebida pelo usuário através da IRS é dada,

$$
P_{tx-irs-user} = A_{rxirs}W_{s}
$$

$$
P_{tx - irs - user} = \sigma_{irs}\left( \theta_{irs},\phi_{irs} \right)\frac{P_{t}G_{t}(\theta_{txirs},\phi_{txirs})G_{r}\left( \theta_{rxirs},\phi_{rxirs} \right)}{4\pi}\left( \frac{\lambda}{4\pi R_{2}R_{3}} \right)^{2}
$$

Portanto a potência total do usuário,

$$
{P_{rxtotal} = P_{tx -user} + P}_{tx-irs-user}
$$

$$

P_{rxtotal} = \frac{P_{t}G_{t\ }\left( \theta_{txk},\phi_{txk} \right)G_{r}\left( \theta_{rxtx},\phi_{rxtx} \right)\lambda^{2}}{\left( 4\pi R_{1} \right)^{2}} + \\
\sigma_{irs}\left( \theta_{irs},\phi_{irs} \right)\frac{P_{t}G_{t}(\theta_{txirs},\phi_{txirs})G_{r}\left( \theta_{rxirs},\phi_{rxirs} \right)}{4\pi}\left( \frac{\lambda}{4\pi R_{2}R_{3}} \right)^{2}

$$

A eficiência espetral é dada por,

$$
SE = \left( 1 - \frac{1}{3850} \right)\log_2\left( 1 + \frac{P_{rxtotal}}{N_{\sigma}} \right)
$$


Para potência de ruido $N_{\sigma} = 1$

$$
SE = \left( 1 - \frac{1}{3850} \right)\log_2\left( 1 + P_{rxtotal} \right)
$$



Se considerarmos o temperatura da antenas e do sistema, temos a potência
do ruído

$$
N_{\sigma - dB} = 10\log{\left( KT_{s}B \right) =}10{\log{\left( KT_{a}B \right) + NF}}_{dB}

$$

$$
T_{s} = T_{a\ } + T_{rx}
$$


Assumindo $T_{s}$ como a temperatura do sistema, $T_{a\ }$ a temperature da antenna, $T_{rx}$ temperatura do receptor radiofrequência do usuário, $K$ a constante de Boltzmann e B a largura de banda do sinal.


## Método de Arranjos
Os método de arranjos é um clássico que nunca sai de moda, comumente usado na literatura para analisar arranjos de antenas perfeitos, sem considerar todos os efeitos eletromagnéticos reais, com o intuito de construir diagramas ideais e perfeitos de referência que guiam a modelagem dos arranjos para uma determinada aplicação, com uma determinada técnica de atribuição dos pesos complexos. Por exemplo, a amplitudes e fase dos sinais são modificados pelos amplificadores, defasadores, pelos coeficientes de reflexão complexos dos elementos da RIS. Portanto, a RIS também pode ser vista como um arranjo de antenas, que ao refletir aplica um peso complexo a amplitude do campo elétromagnético da onda incidente.

Considerando um arranjo planar distribuido no plano $xy$, com $N_{ZsW}$ elementos em x, com $N_{ZsL}$ elementos em y, 


Fig. Fazer Figura
<!-- 
<img src="https://drive.google.com/a/domain.com/thumbnail?id=18B6Ljysui90jiwX72OlsBrIRbBX9gtQ1&sz=w{500}-h{200}" style="width: 400px;  height: 500 px"  /> -->

<!-- ![image](https://drive.google.com/a/domain.com/thumbnail?id=18B6Ljysui90jiwX72OlsBrIRbBX9gtQ1&sz=w{500}-h{400}) -->


O modelo planar do método de arranjo de antenas clássico {cite}`balanisAntenna` é dado por
$$
\overline{E}_s=\sum_{m=1}^{M} \sum_{n=1}^{N} I_{1m}e^{j(m-1)kd_x \sin \theta \cos \phi+\Omega_x}
                                I_{1n}e^{j(m-1)kd_x \sin \theta \cos \phi+\Omega_x}
$$


Sendo que $\beta_x$ e $\beta_y$, são a defasagens continuamente aplicadas, respectivamente,  aos elementos ao longo dos eixos $x$ e $y$.
Porém se considerarmos coeficiente de reflexão com amplitude e fase variável ao longo de todo os, a defasagem entre elementos vizinhos, podendo não ser necessariamente constante. O coeficients de reflexão da RIS paras as duas polarizações

$$
\Gamma^{x}_{NM}=A^{x}_{NM} e^{j \Omega^x_{NM}}e^{j \Omega^y_{NM}}
$$

$$
\Gamma^{y}_{NM}=A^{y}_{NM} e^{j \Omega^x_{NM}}e^{j \Omega^y_{NM}}
$$

O coefiente englobando o efeito das duas componentes,

$$
\Gamma_{NM}=\Gamma^{x}_{NM}\Gamma^{y}_{NM}=A_{NM} e^{j \Omega^x_{NM}}e^{j \Omega^y_{NM}}
$$


Logo, considerando a RIS de referência, o campo incidente sendo unitário e em phase sobre toda a superfície 
$$
\overline{E}_s=\sum_{m=1}^{M} \sum_{n=1}^{N} A_{NM}e^{j(m-1)kd_x \sin \theta \cos \phi+\Omega_{NM}^x}
                                e^{j(m-1)kd_x \sin \theta \cos \phi+\Omega_{NM}^y}
$$



## Modelagem pelo Método de Ondas Planas e Linhas de Transmissão

Método de ondas planas, também um clássico e extraordinário, uma vez que todo campo eletromagnético pode ser decomposto em um espectro de ondas planas, se o divergente do camplo eletromagnético for zero, tratando o problema também no espaço spectral dos ângulos, direções das ondas incidentes, ele analisa as reflexões e transmissões de ondas planas entre diferentes meios, levando conta suas características dos meios a partir das impedâncias das ondas eletromagnéticas nos respectivos meios. 

O método das Linhas de transmissão também compartilha a mesma essência do método de ondas plans, mas neste método se dá com a manipulação das impedâncias e parâmetros de circuitos elétricos, tendo também muita importância no desenvolvimento dos ciruitos eletromagnéticos das antenas, como o a optimização do casamento de impedâncias, pode-se tratar todo o sistema de irradiação como um circuito elétrico.

Logo, tem-se a visão tanto espaço espectral ângular como do espaço spectral frequencial, assim como a modelagem por circuitos elétricos.

### Descrição do Método 

Neste método, considera-se uma onda incidente que se propaga na linha de transmissão do ar, e alcança uma discontinuidade, representada por uma impedância superficial $Z_s$, que representa a RIS. Essa impedância irá espalha um campo eletromagético, assim como transmitir outro campo eletromagnético na linha de transmissão do ar.

<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1i2FgcvuscNZaELtdCInN_5nCSkCVawbb" 
    style="width: 300px;  height: 300 px;display: block;margin-left: auto;margin-right: auto;"  />


Dadas as condiçõoes de contorno e a definição dos campos \cite{A}, a impedância vista da RIS representada pela impedância superficial e o meio 2 que pode ser considerado uma linha de transmissão com impedância de onda $\eta_2^{TM}$ , é dada por,

\begin{equation}

   Z_{in}= \frac{Z_s \eta_2^{TM} }{\eta_2^{TM}+Z_s}

\end{equation}

Se o meio 2 é o idêntico ao meio 1, e todos os dois, o espaço Livre, o caso da RIS, pois a impedância superficial encapsula toda estrutura, temos $\eta^{TM}_{2}=\eta^{TM}_1=\eta^{TM}_0$

E o coeficiente de reflexão se deduz como,

\begin{equation}
   \Gamma= \frac{Z_{in}-\eta_1^{TM}}
    {Z_{in}+\eta_1^{TM}}
\end{equation}

Se os dois meios forem o espaço livre,

\begin{equation}
    \Gamma=\frac{-\eta^{TM}_0}{2Z_s+\eta^{TM}_0}
\end{equation}

A impedância superficial em relação ao coeficiente de reflexão



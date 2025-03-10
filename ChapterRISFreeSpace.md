
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


Se considerarmos o temperatura das antennas ( os elementos da RIS) e do sistema, temos a potência do ruído, como

$$
N_{\sigma - dB} = 10\log{\left( KT_{s}B \right) =}10{\log{\left( KT_{a}B \right) + NF}}_{dB}

$$

$$
T_{s} = T_{a\ } + T_{rx}
$$


Assumindo $T_{s}$ como a temperatura do sistema, $T_{a\ }$ a temperature da antenna, $T_{rx}$ temperatura do receptor radiofrequência do usuário, $K$ a constante de Boltzmann e B a largura de banda do sinal.


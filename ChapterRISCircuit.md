
# Modelagem Circuito elétrico

O circuito básico dá RIS pode ser modificado em relação ao descrito anteriomente, identificando melhor as estruturas do sistema. Que se constitue geralmente de um \textit{patch} sob um substrado dielétrico com um plano de terra na sua superfície inferior. Nesta nova configuração, a onda incidente encontra primeirammente impedância do \textit{patch}  $Z_p$ e logo após percorre a linha de trasmissão do dielétrico com impedância de onda $\eta_d$ que está curto circuitada pelo plano de terra de impedância $Z_g$.

Melhorar figura e colocar Zg (exportar, não faz )
<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=17_eq7NOBCh6Q9ycTYJQGyD6bm6H1CCQd" 
    style="width: 300px;  height: 300 px;display: block;margin-left: auto;margin-right: auto;"  />
Do \textit{patch} tem-se $Z_p$,

$$
Z_p=R_p+j\omega L_p+\frac{1}{j\omega C_p}
$$

Sendo $R_p$ a sua resistência superfical, $C_p$ a sua capacitância, $L_p$ a sua indutância. Já para o dielétrico, a impedância vista a partir do \textit{patch} é dada por


$$
Z_d=\eta_d\frac{Z_g+j\eta_d \tan{kl}}{\eta_d+jZ_g\tan{kl}}
$$

Como $ Z_g$ é muito pequena, tem-se

$$
Z_d=j\eta_d\tan{kl}
$$

 
A impedância vista pela onda incidente, será

$$

   Z_{in}= \frac{Z_p Z_d}{Z_p+Z_d}

$$

$$

   Z_{in}= \frac{(R_p+j\omega L_p+\frac{1}{j\omega C_p}) (j\eta_d\tan{kl})}
   {(R_p+j\omega L_p+\frac{1}{j\omega C_p})+(j\eta_d\tan{kl})}

$$
Se todo circuito for encapsulado como descrito inicialmente, a impedância $Z_s$, será

$$

    Z_s=\frac{Z_{in}\eta_0^{TM}}{\eta_0^{TM}-Z_{in}}
$$


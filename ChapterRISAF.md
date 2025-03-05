
# Método de Arranjos
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


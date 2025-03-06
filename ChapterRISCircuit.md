
# Modelagem Circuito elétrico

O circuito básico dá RIS pode ser modificado em relação ao descrito anteriomente, identificando melhor as estruturas do sistema, entrando mais no conceito dos circuitos elétricos com suas resistências, capacitâncias e indutâncias. Que se constitue geralmente de um \textit{patch} sob um substrado dielétrico com um plano de terra na sua superfície inferior. Nesta nova configuração, a onda incidente encontra primeirammente impedância do \textit{patch}  $Z_p$ e logo após percorre a linha de trasmissão do dielétrico com impedância de onda $\eta_d$ que está curto circuitada pelo plano de terra de impedância $Z_g$.

Melhorar figura e colocar Zg (exportar, não faz )
<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=17_eq7NOBCh6Q9ycTYJQGyD6bm6H1CCQd" 
    style="width: 300px;  height: 300 px;display: block;margin-left: auto;margin-right: auto;"  />
Do \textit{patch} tem-se $Z_p$,

$$
Z_p=R_p+j\omega L_p+\frac{1}{j\omega C_p}
$$
No dominio de Laplace

$$
Z_p(s)=\frac{sR_p+s^2 L_p+1/C_p}{s }
$$

Sendo $R_p$ a sua resistência superfical, $C_p$ a sua capacitância, $L_p$ a sua indutância. Já para o dielétrico, a impedância vista a partir do \textit{patch} é dada por


$$
Z_d=\eta_d\frac{Z_g+j\eta_d \tan{kl}}{\eta_d+jZ_g\tan{kl}}
$$

Como $ Z_g$ é muito pequena, tem-se

$$
Z_d=j\eta_d\tan{kl}=jX_d
$$
No dominio de Laplace
considerando a variação da indutância bem pequena com a frequência

$$
Z_d(s)=s L_d
$$
 
A impedância vista pela onda incidente, será

$$

   Z_{in}= \frac{Z_p Z_d}{Z_p+Z_d}

$$


Se todo circuito for encapsulado como descrito inicialmente, em uma impedância $Z_s$, teremos

$$

    Z_s=\frac{Z_{in}\eta_0^{TM}}{\eta_0^{TM}-Z_{in}}
$$

Porém analisando melhor,
$$

   Z_{in}= \frac{(R_p+j\omega L_p+\frac{1}{j\omega C_p}) (jX_d)}
   {(R_p+j\omega L_p+\frac{1}{j\omega C_p})+(jX_d)}

$$
$$

   Z_{in}= \frac
   {(\frac{sR_p+s^2 L_p+1/C_p}{s }) (sL_d)
   }
   {
  (\frac{sR_p+s^2 L_p+1/C_p}{s })+sL_d
   }

$$
$$

   Z_{in}= \frac
   {
      (sR_p L_d+s^2 L_pL_d+L_d/C_p)s
   }
   {
  sR_p+s^2 L_p+1/C_p+s^2L_d
   }

$$

insertin in the reflection coeficient {eq}`GammPWTLZin`
$$
   \Gamma= \frac{
      (R_p+j\omega L_p+\frac{1}{j\omega C_p}) (jX_d)
  -\eta_1^{TM}((R_p+j\omega L_p+\frac{1}{j\omega C_p})+(jX_d))
               }
               {
      (R_p+j\omega L_p+\frac{1}{j\omega C_p}) (jX_d)
   +\eta_1^{TM}((R_p+j\omega L_p+\frac{1}{j\omega C_p})+(jX_d))
   }
$$


$$
   \Gamma= \frac{
       (-\omega L_pX_d-\eta_1^{TM}R_p+\frac{X_d}{\omega C_p})
            +j(X_dR_p-\eta_1^{TM}X_d-\eta_1^{TM}\omega L_p+\frac{\eta_1^{TM}}{\omega C_p})   
               }
               {
                 (-\omega L_pX_d+\eta_1^{TM}R_p+\frac{X_d}{\omega C_p})
            +j(X_dR_p+\eta_1^{TM}X_d+\eta_1^{TM}\omega L_p-\frac{\eta_1^{TM}}{\omega C_p})   


    }
$$


$$
   \Gamma= \frac{
       (-\omega^2C_p L_pX_d-\eta_1^{TM}\omega C_pR_p+X_d)
            +j(X_d\omega C_pR_p-\eta_1^{TM}\omega C_pX_d-\eta_1^{TM}\omega^2 C_p L_p-\eta_1^{TM})   
               }
               {
     (-\omega^2C_p L_pX_d+\eta_1^{TM}\omega C_pR_p+X_d)
            +j(X_d\omega C_pR_p+\eta_1^{TM}\omega C_pX_d+\eta_1^{TM}\omega^2 C_p L_p+\eta_1^{TM})   


    }
$$

$$
\frac{
   \frac
      {
         (sR_p L_d+s^2 L_pL_d+L_d/C_p)s
      }
      {
         sR_p+s^2 L_p+1/C_p+s^2L_d
      }
      -\eta_1^{TM}
   }{

   \frac
      {
         (sR_p L_d+s^2 L_pL_d+L_d/C_p)s
      }
      {
         sR_p+s^2 L_p+1/C_p+s^2L_d
      }
      +\eta_1^{TM}

   }
   $$


$$
   \frac{

         (sR_p L_d+s^2 L_pL_d+L_d/C_p)s
    
      -\eta_1^{TM}( sR_p+s^2 L_p+1/C_p+s^2L_d)
   }{


         (sR_p L_d+s^2 L_pL_d+L_d/C_p)s
     
      +\eta_1^{TM}( sR_p+s^2 L_p+1/C_p+s^2L_d)

   }
   $$

   
$$
   \frac{

   s^3 L_pL_d+s^2( L_pL_d-\eta_1^{TM}L_p-\eta_1^{TM}L_d)
   +s(R_pL_d-\eta_1^{TM}R_p)
   -\eta_1^{TM}/C_p
   }{

   s^3 L_pL_d+s^2( L_pL_d+\eta_1^{TM}L_p+\eta_1^{TM}L_d)
   +s(R_pL_d+\eta_1^{TM}R_p)
   +\eta_1^{TM}/C_p

   }
   $$
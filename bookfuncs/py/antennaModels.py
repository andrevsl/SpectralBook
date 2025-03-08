## Fourier
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle,log,sqrt,power
import matplotlib.pyplot as plt



def dipoleAntenna(emconst,w,h,freq):
    # Balanis/Pozar Equations a checar se começou com o Gupta?(As do gupta sao diferentes, procurar melhor depois ou agora de quem é) 
    # ele ta nas ref do Balanis/Pozar, o balanis diz que ta resumindo a informação (Advanced electromagnetism)
    # o pessoal skrf ajudou colocou umas referencias hammerstad_er, mas ta diferente a equacao com um 10 no lugar do 12 (mas tao bem diferentes, sei nao)
    Rr=
    Rin=Rr/power(sin(beta*l),2)
    Xin=Xm/power(sin(beta*l),2)
   
    return Rin,Rr,Xin,Xm


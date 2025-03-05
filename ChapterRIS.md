# Application to RIS

- Definições
- Justificativa
- Applicações

## Estudo do Circuito RIS

- Validar o artigo de ref corretamente (Capacitância analitica)
- Analisar o intervalo variação tipo de circuito de Indutâncias/capacitâncias para as frequências target ?(3.5-6 GHz,7-8Ghz,7.125–8.5 GHz, 10.7–13.25 GHz, 14–15.35 GHz,24-40 Ghz)
- Analisar o efeito no circuito equivalente de Vias, stubs, coils
- Simular/Validar no MoM uma estrutura complexa encapsulada em uma Zs?
- Inferir a impedância superficial por simulação CST?
- Inferir a impedância superficial por MOM periodico?

### Ground Inductance
 - For higher frequecies, it should be used lower permittivity substrates or small thickness
<img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fdrive.google.com/uc?id=1DjFYlnoSSf-5_zBDVuR8ienuzwkZxpsY" 
    style="width: 800px;  height: 1000 px;display: block;margin-left: auto;margin-right: auto;"  />


## Estudo do circuito de Controle dos Varactors (Depois ou antes da Quali se conseguir)

- MPLAB para os chip microchip, e a analog devices tem os spice models dos CIs
- Não consigos simular diodos no ADS, melhor aparentemente, para co-cimulação S-paramters e analog
- Falta Libraries dos vendors, não consigo achar
- Outros fabricantes muito dificil achar
- Tentando reproduzir o controle dos varactors no MPLAB

## Tecnica de Medição RIS (Depois ou antes da Quali se conseguir)

- SIMU 2 cornetas lado/lado versus espaçamento (Anlisar S21 e Decaimento do Campo no Ambiente) 
- SIMU 2 cornetas lado/lado versus inclinação (Anlisar S21 e Decaimento do Campo no Ambiente) 
- SIMU 2 cornetas lado/lado com objetos metalicos no ambiente (Anlisar S21 e Decaimento do Campo no Ambiente))
- SIMU 2 cornetas lado/lado com um placa metalica de diferentes areas (Anlisar S21 e Decaimento do Campo no Ambiente) 
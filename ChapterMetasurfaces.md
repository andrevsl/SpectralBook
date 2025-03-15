---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.9'
    jupytext_version: 1.5.0
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Application to Metasurfaces and Lenses

```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]
:tags: [hide-output]
#  Convention
!pip install pandas
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle,sqrt,log
from bookfuncs.plotfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot2DTparametric
import pandas as pd
import matplotlib.pyplot as plt


from bookfuncs.simuParams import *
from bookfuncs.simuParams import  SimuParam

import time
import warnings
warnings.filterwarnings(action='ignore')

```
## Resistive Sheet

A resistive sheet with area $ a \times b$ and infinitesimal thickeness it used as Load in the middle of the Frees Space Transmission Line.

$$
\begin{equation}
\begin{bmatrix}
    e^{j\beta l} &  \\
    4 & e^{j\beta l} 
\end{bmatrix} 

\end{equation}
$$

## Inductive Sheet

## Capacitive Sheet

## Low Pass FSS
## Hig Pass FSS

## Split Ring


```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]

```

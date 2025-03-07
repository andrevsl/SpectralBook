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

# Antenna Loop
```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]
:tags: [hide-output]
#  Convention

import numpy as np
from numpy import sin, exp, cos, log10, pi,angle, cos
import pandas as pd
import matplotlib.pyplot as plt
from bookfuncs.simuParams import  SimuParam
from bookfuncs.plotfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot1DSparametricUwrap
from scipy import signal
from bookfuncs.signalFunc import  gaussinaSignal

from bookfuncs.simuParams import *
from bookfuncs.simuParams import  SimuParam

import time
import warnings
warnings.filterwarnings(action='ignore')

```

```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]


```

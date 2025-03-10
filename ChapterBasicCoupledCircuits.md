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

<style>
.images{
    text-align:center;
}
</style>

```{code-cell} ipython3
:tags: [scroll-output]
:tags: [hide-input]
:tags: [hide-output]
#  Convention
!pip install pandas
!pip install mplcursors
!pip install scipy

from scipy.optimize import curve_fit
import numpy as np
import matplotlib.pyplot as plt
from numpy import pi, sin, cos, exp, tan, log,log10
from mplcursors import cursor  # separate package must be installed

from bookfuncs.py.simuParams import  SimuParam
from bookfuncs.py.PlotData.plotfunc import plot1DTparametric,plot1DS,plot1DSparametric,S1d,plot1DSparametricUwrap,plot1DSparametricdB

```

# Coupled Circuits


















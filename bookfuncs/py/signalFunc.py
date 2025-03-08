import pandas as pd
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle


def gaussinaSignal(t,tau,td):
    gt=exp(-np.power((t-td)/tau,2))
    return gt


def gaussinaSignalCarrier():
    True


def gaussinaSignal1st():
    True

def gaussinaSignal2nd():
    True
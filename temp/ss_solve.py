'''
Solves the ss of the Aghion-Howitt Optimal cap vs lab tax paper

Current issue: 7 vars to solve, 6 equations
'''

import numpy as np
from scipy import fsolve

# deep parameters
param = dict()
param['beta'] = 0.98
param['phi'] = 6.7
param['eta'] = 0.833
param['alpha'] = 0.295
param['lambda'] = 1.0522
param['delta'] = 0.06
param['psi'] = 0.05
param['G_0'] - 0.1

# reduced form params
Omega = 1.0 - ((param['lambda'] - 1.0)/param['lambda']) * (1.0 - param['alpha'])

# System of equations
def eq1():
    return k*q + c + param['G_0'] - Omega * y - (1.0 - param['delta']) * k

def eq2():
    return c * q - (param['beta'] * c * (1.0 + (1.0 - tau_k) * param['alpha'] * y/k - param['delta']))

def eq3():
    return param['phi'] * c * (lab**(1.0 + param['eta'])) - ((1.0 - tau_l)* ((1.0 - param['alpha'])/param['lambda']) * y)

def eq4():
    return y - k ** param['alpha'] * lab ** (1.0 - param['alpha'])

def eq5():
    return param['G_0'] - ( ((1.0 - param['alpha'])/param['lambda']) * tau_l + param['alpha'] * tau_k ) * y

def eq6():
    q - ( 1.0 + ((param['lambda'] - 1.0)/param['lambda']) * ((1 - param['alpha'])/param['psi'])* y )


def steadyS(vars):
    k = vars[0]
    q = vars[1]
    c = vars[2]
    y = vars[3]
    tau_k = vars[4]
    l = vars[5]
    tau_l = vars[6]

    f = np.zeros(6)

    f[0] = k*q + c + param['G_0'] - Omega * y - (1.0 - param['delta']) * k
    f[1] = c * q - (param['beta'] * c * (1.0 + (1.0 - tau_k) * param['alpha'] * y/k - param['delta']))
    f[2] = param['phi'] * c * (lab**(1.0 + param['eta'])) - ((1.0 - tau_l)* ((1.0 - param['alpha'])/param['lambda']) * y)
    f[3] = y - k ** param['alpha'] * lab ** (1.0 - param['alpha'])
    f[4] = param['G_0'] - ( ((1.0 - param['alpha'])/param['lambda']) * tau_l + param['alpha'] * tau_k ) * y
    f[5] = q - ( 1.0 + ((param['lambda'] - 1.0)/param['lambda']) * ((1 - param['alpha'])/param['psi'])* y )

import mpmath as mp
import numpy as np
import scipy.io as spio
import os
from subprocess import call

# set wd
os.chdir('C:/Users/admin/Documents/personal/aghion/gen_eq/python/')

cbeta  = 0.96
cdelta  = 0.1
calpha  = 0.33
cgamma  = 1.2
clambda = 1.0
csigma  = 0.8
ctheta = 0.9
cnu = 1.50
cpsi = 6.50


def steady_s(c,y,k,g,r,l,w):
    # == functions to minimize to find steady states == #
    f = list(np.zeros(7,))

    # HH Euler
    f[0] = (1.0/c)*cbeta*(r + 1.0 - cdelta) - (1.0+g)/c

    # Goods market clearing
    f[1] = y - c - k*(1.0 + g) + k*(1.0-cdelta)

    # Capital Market clearing
    f[2] = k - (calpha**2.0/r)**(1.0/(1.0 - calpha)) * l

    # production function for final good
    f[3] = y - k**calpha * l**(1.0 - calpha)

    # growth rate
    f[4] = g - (cgamma - 1.0) * clambda * (csigma*clambda*(calpha - 1.0) * (k/l)**calpha)**(csigma/(1.0-csigma))

    # FOC HH wrt l
    f[5] = 1.0/c - cpsi * l**cnu/w

    # labour market clearing
    f[6] = w - (1.0 - calpha)*(k/l)**calpha

    return f

# == Initial Guesses == #
vars0 = list(np.ones((7,)))

# == Solving for Steady State == #
xssc = mp.findroot(steady_s, vars0)
xssnp = np.array(xssc.apply(mp.re).tolist(), dtype=float)[:,0]

c = xssnp[0]
y = xssnp[1]
k = xssnp[2]
g = xssnp[3]
r = xssnp[4]
l = xssnp[5]
w = xssnp[6]

# == Dynare == #
# writing .mod file


replace = {'cbeta_params' : 0.99,
        'cdelta_params': 0.1 ,
        'calpha_params' : 0.33 ,
        'cgamma_params' : 1.2 ,
        'clambda_params' : 1.0 ,
        'csigma_params' : 0.8 ,
        'ctheta_params' : 0.9,
        'cnu_params' : 1.50,
        'cpsi_params' : 6.50,
        'c_xinit' : c,
        'y_xinit' : y,
        'k_xinit' : k,
        'g_xinit' : g,
        'r_xinit' : r,
        'l_xinit' : l,
        'w_xinit' : w,
        'etau_k_policy' : 0,
        'etau_l_policy' : 0}

with open('model_in.mod', "rt") as fin:
    with open('model_out.mod', "wt") as fout:
        for line in fin:
            line = line.rstrip()
            if not line:
                continue
            for f_key, f_value in replace.items():
                if f_key in line:
                    line = line.replace(f_key, f"{f_value}")
            fout.write(line + '\n')


# calling dynare++

call(["dynare++", "model_out.mod"])

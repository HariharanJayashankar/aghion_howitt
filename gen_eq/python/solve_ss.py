import mpmath as mp
import numpy as np
import scipy.io as spio

params = dict()
params['cbeta'] = 0.96
params['cdelta'] = 0.1
params['calpha'] = 0.33
params['cgamma'] = 1.2
params['clambda']= 1.0
params['csigma'] = 0.8
params['etau'] = 0.0

spio.savemat('C:/Users/admin/Documents/personal/aghion/gen_eq/python/params.mat', params)

def steady_s(c,y,k,g,r):
    # unpacking paramters
    cbeta = params['cbeta']
    cdelta = params['cdelta']
    calpha = params['calpha']
    cgamma = params['cgamma']
    clambda= params['clambda']
    csigma = params['csigma']


    # == functions to minimize to find steady states == #
    f = list(np.zeros(5,))

    # HH Euler
    f[0] = (1.0/c)*cbeta*(r + 1.0 - cdelta) - (1.0+g)/c

    # Goods market clearing
    f[1] = y - c - k*(1.0 + g) + k*(1.0-cdelta)

    # Capital Market clearing
    f[2] = r - (k)**(calpha-1.0)*calpha**2.0

    # production function for final good
    f[3] = y - k**calpha

    # growth rate
    pi = (calpha - 1.0) * k**calpha #small pi, this isnt actual profits
    f[4] = g - (cgamma - 1.0) * clambda * (csigma*clambda*pi)**(csigma/(1.0-csigma))

    return f

# == Initial Guesses == #
vars0 = list(np.ones((5,)))

# == Solving for Steady State == #
xssc = mp.findroot(steady_s, vars0)
xssnp = np.array(xssc.apply(mp.re).tolist(), dtype=float)[:,0]

xss = dict()
xss['c'] = xssnp[0]
xss['y'] = xssnp[1]
xss['k'] = xssnp[2]
xss['g'] = xssnp[3]
xss['r'] = xssnp[4]

spio.savemat('C:/Users/admin/Documents/personal/aghion/gen_eq/python/xss.mat', xss)


# == Dynare == #

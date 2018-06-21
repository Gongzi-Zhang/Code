#!/usr/bin/env python

#--------------------------------------------------------------------
# EXAMPLE showing how to set up a fit with MINUIT using pyroot
#--------------------------------------------------------------------

from ROOT import TMinuit, Double, Long
import numpy as np
from array import array as arr
import matplotlib.pyplot as plt

# −− > define some d a t a
ax = arr ('f', (0.05 ,0.36 ,0.68 ,0.80 ,1.09 ,1.46 ,1.71 ,1.83 ,2.44 ,2.09
    ,3.72 ,4.36 ,4.60)   )
ay = arr ('f', (0.35 ,0.26 ,0.52 ,0.44 ,0.48 ,0.55 ,0.66 ,0.48 ,0.75 ,0.70
    ,0.75 ,0.80 ,0.90) )
ey = arr ('f', (0.06, 0.07, 0.05, 0.05, 0.07, 0.07, 0.09, 0.10, 0.11, 0.10,
    0.11, 0.12, 0.10) )
nPoints = len ( ax )

# ---> Set parameters and function to fit
# a list with convenient names
name = ["a", "m", "b"]
# the initial values
vstart = arr('d', (1.0, 1.0, 1.0) )
# the initial step size
step = arr('d', (0.001, 0.001, 0.001) ) 
npar = len(name)

# function we are going to fit:
def fitfunc(x, npar, apar):
    a = apar[0]
    m = apar[1]
    b = apar[2]
    f = Double(0)
    f = a*x*x + m*x + b
    return f

# the function to minimize, here a chi^2-function
def calcChi2(npar, apar):
    chisq = 0.0
    for i in range(0, nPoints):
        x = ax[i]
        curFuncV = fitfunc(x, npar, apar)
        curYV = ay[i]
        curYE = ey[i]
        chisq += ( (curYV - curFuncV)**2/(curYE**2) )
    return chisq

# --- fcn -- called by MINUIT repeatedly with varying parameters
# NOTE: the function name is set via TMinuit.SetFCN
def fcn(npar, deriv, f, apar, iflag):
    """ meaning of parameters:
        npar:   # of parameters
        deriv:  array of derivatives df/dp_i(x), optional
        f:      value of function to be minimised (typically chi2 or negLogL)
        apar:   the array of parameters
        iflag:  internal flag: 1 at first call, 3 at the last, 4 during
        minimisation 
    """
    f[0] = calcChi2(npar, apar)

# --> set up MINUIT
myMinuit = TMinuit(npar)    # initialize TMinuit with maximum of npar parameters
myMinuit.setFCN(fcn)        # set func to minimize
arglist = arr('d', 2*[0.01])# set error definition
ieflg = Long(0)
arglist[0] = 1.             # 1 sigma is Delta chi^2 = 1
myMinuit.mnexcm("SET ERR", arglist, 1, ierflg)



#−−>Set starting values and step sizes for parameters
for i in range(0, npar):
#Define the parameters for the fit
    myMinuit.mnparm(i, name[i], vstart[i], step[i], 0, 0, ierflg)

arglist[0] = 6000   # Number of calls to FCN before giving up.
arglist[1] = 0.3    # Tolerance
myMinuit.mnexcm("MIGRAD", arglist, 2, ierflg)   # execute the minimisation

#−−> check TMinuit status
amin, edm, errdef = Double(0.), Double(0.), Double(0.)
nvpar, nparx, icstat = Long(0), Long(0), Long(0)
myMinuit.mnstat(amin, edm, errdef, nvpar, nparx, icstat)
#meaning of parameters:
# amin: value of fcn at minimum (=chi^2)
# edm:  estimated distance to mimimum
# errdef:   delta_fcn used to define 1 sigma errors
# nvpar:    number of variable parameters
# nparx:    total number of parameters
# icstat:   status of error matrix:
#           3 = accurate
#           2 = forced pos.def
#           1 = approximative
#           0 = not calculated
myMinuit.mnprin(3,amin) # print−out by Minuit
#−−> get results from MINUIT
finalPar=[]
finalParErr=[]
p, pe=Double(0), Double(0)
for i in range(0, npar):
    myMinuit.GetParameter(i, p, pe) # retrieve parameters and errors
    finalPar.append(float(p))
    finalParErr.append(float(pe))
#get covariance matrix
buf=arr('d',npar*npar*[0.])
myMinuit.mnemat(buf,npar)   # retrieve error matrix
emat=np.array(buf).reshape(npar,npar)

#−−> provide formatted output of results
print "\n"
print "*==*MINUIT fit completed:"
print 'fcn@minimum = %.3g'%(amin), "error code =", ierflg, "status = ", icstat 
print "Results: \t value error corr.mat."
for i in range(0,npar):
    print' %s: \t%10.3e +/- %.1e '%(name[i], finalPar[i], finalParErr[i]),
    for j in range(0,i):
        print'%+.3g'%(emat[i][j]/np.sqrt(emat[i][i])/np.sqrt(emat[j][j])),
        print''
#−−> plot result using matplotlib
plt.figure()
plt.errorbar(ax, ay, yerr=ey, fmt="o", label='data') # the data
x=np.arange(ax[0], ax[nPoints−1], abs( (ax[nPoints−1]−ax[0])/100.) )
y=fitfunc(x, npar, finalPar)    # function at best−fit−point
plt.title("Fit Result")
plt.grid()
plt.plot(x, y, label='fit function')
plt.legend(loc=0)
plt.show()

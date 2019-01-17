// vars
var c y r f etau_k G_0;

varexo cepsilon;

// parameters
parameters cbeta cdelta calpha cgamma clambda csigma ctheta;

load params;
load xinit;

// setting params
cbeta = params(1);
cdelta = params(2);
calpha = params(3);
cgamma = params(4);
clambda= params(5);
csigma = params(6);
ctheta = params(7);

// model
model;
// HH Euler
(1/c(+1))*cbeta*(r(+1)*(1-etau_k) + 1 - cdelta) = (1+g(+1))/c;

// Goods market clearing
y = c + k*(1 + g(+1)) - k(-1)*(1 - cdelta) + G_0;

// Capital Market clearing
r = (k(-1))^(calpha-1)*calpha^2;

// production function for final good
y = k(-1)^calpha;

// growth rate
g = (cgamma - 1) * clambda * (csigma*clambda*(calpha - 1) * (k(-1))^calpha)^(csigma/(1-csigma));

// government constraint
G_0 = etau_k * r * k(-1);

// tax process
etau_k = ctheta * etau_k(-1) + cepsilon(-3);
end;

// init values
initval;
c = xinit(1);
y = xinit(2);
k = xinit(3);
g = xinit(4);
r = xinit(5);
etau_k = xinit(6);
G_0 = params(8);
cepsilon = 0;
end;
steady;
resid;


// sets a sequence of tau to 0 for first 20 periods
shocks;
var cepsilon;
stderr 0.8;
end;

// solve
stoch_simul(order=1, irf=70, nograph);

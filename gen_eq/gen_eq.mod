// vars
var c y k r vpi g;

varexo etau;

// parameters
parameters cbeta cdelta cphi cgamma clambda csigma calpha;

load params;
load paramsend;
load xinit;
load xend;

// setting params
cbeta = params(1);
cdelta = params(2);
cphi = params(3);
cgamma = params(4);
clambda = params(5);
csigma = params(6);
calpha = params(7);

// model
model;
cbeta * (1 + r(+1)*(1 - etau) - cdelta) * (c(+1)*(1+g)/c)^(-cphi) = 1;
g = (cgamma - 1) * clambda * (clambda * csigma * vpi)^(csigma/(1 - csigma));
y = k(-1)^calpha;
k = (calpha/r)^(1/(1 - calpha));
vpi = calpha * (1 - calpha) * k(-1)^calpha;
y = c + k - k(-1)/(1+g(-1));
end;

// init values
initval;
c = xinit(1);
k = xinit(2);
r = xinit(3);
vpi = xinit(4);
g = xinit(5);
y = xinit(6);
etau = params(8);
end;

resid;

// end values
endval;
c = xend(1);
k = xend(2);
r = xend(3);
vpi = xend(4);
g = xend(5);
y = xend(6);
etau = paramsend(8);
end;

resid;

// sets a sequence of tau to 0 for first 20 periods
shocks;
var etau;
periods 1:20;
values 0;
end;

// solve
perfect_foresight_setup(periods=100);
perfect_foresight_solver;

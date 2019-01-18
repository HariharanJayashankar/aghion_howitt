// vars
var r g;
trend_var(growth_factor=1+g) A;
var(deflator=A) k y c;

varexo etau_k;

// parameters
parameters cbeta cdelta calpha cgamma clambda csigma;

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
y = c + k- k(-1)*(1 - cdelta);

// Capital Market clearing
r = (k(-1)/A(-1))^(calpha-1)*calpha^2;

// production function for final good
y = A(-1)^(1 - calpha) * k(-1)^calpha;

// growth rate
g = (cgamma - 1) * clambda * (csigma*clambda*(calpha - 1) * (k(-1)/A(-1))^calpha)^(csigma/(1-csigma));
end;

initval;
c = xinit(1);
y = xinit(2);
k = xinit(3);
g = xinit(4);
r = xinit(5);
etau_k = policy(1);
end;


// Sets shocks
shocks;
var etau_k;
stderr 0.8;
end;


// solve
stoch_simul(order=1);

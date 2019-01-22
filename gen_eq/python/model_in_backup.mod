// vars
var r g l;
trend_var(growth_factor=1+g) A;
var(deflator=A) k y c w;

varexo etau_k etau_l;

// parameters
parameters cbeta cdelta calpha cgamma clambda csigma cpsi cnu;

/**********************
*****setting params****
***********************/
cbeta = cbeta_params;
cdelta = cdelta_params;
calpha = calpha_params;
cgamma = cgamma_params;
clambda = clambda_params;
csigma = csigma_params;
ctheta = ctheta_params;
cnu = cnu_params;
cpsi = cpsi_params;


// model
model;
// HH Euler
(1/c(+1))*cbeta*(r(+1)*(1-etau_k) + 1 - cdelta) = (1+g(+1))/c;

// Goods market clearing
y = c + k- k(-1)*(1 - cdelta);

// Capital Market clearing
r = (k(-1)/l * A(-1))^(calpha-1)*calpha^2;

// production function for final good
y = (A(-1) * l)^(1 - calpha) * k(-1)^calpha;

// growth rate
g = (cgamma - 1) * clambda * (csigma*clambda*(calpha - 1) * (k(-1)/l * A(-1))^calpha)^(csigma/(1-csigma));

// FOC HH wrt l
1/c = cpsi * l^cnu/w * (1 - etau_l);

// labour market clearing
w = (1 - calpha)* A(-1)^(1 - calpha) * (k(-1)/l)^calpha;
end;


/**********************
*****initvals****
***********************/
initval;
c = c_xinit;
y = y_xinit;
k = k_xinit;
g = g_xinit;
r = r_xinit;
l = l_xinit;
w = w_xinit;
etau_k = etau_k_policy;
etau_l = etau_l_policy;
end;


// Some checks
steady;
resid(1);
check;

// Sets shocks
shocks;
var etau_k;
stderr 0.8;
var etau_l;
stderr 0.8;
end;


// solve
stoch_simul(order=1, nograph);

// vars
var r g l k y c w;
varexo etau_k etau_l;
// parameters
parameters cbeta cdelta calpha cgamma clambda csigma cpsi cnu;
/**********************
*****setting params****
***********************/
cbeta = 0.99;
cdelta = 0.1;
calpha = 0.33;
cgamma = 1.2;
clambda = 1.0;
csigma = 0.8;
ctheta = 0.9;
cnu = 1.5;
cpsi = 6.5;
// model
model;
// HH Euler
(1/c(+1))*cbeta*(r(+1)*(1-etau_k) + 1 - cdelta) = (1+g(+1))/c;
// Goods market clearing
y = c + k- k(-1)*(1 - cdelta);
// Capital Market clearing
r = (k(-1)/l)^(calpha-1)*calpha^2;
// production function for final good
y = (l)^(1 - calpha) * k(-1)^calpha;
// growth rate
g = (cgamma - 1) * clambda * (csigma*clambda*(calpha - 1) * (k(-1)/l)^calpha)^(csigma/(1-csigma));
// FOC HH wrt l
1/c = cpsi * l^cnu/w * (1 - etau_l);
// labour market clearing
w = (1 - calpha)^(1 - calpha) * (k(-1)/l)^calpha;
end;
/**********************
*****initvals****
***********************/
initval;
c = 0.326903525201622;
y = 0.3547648325033787;
k = 0.2563118707632364;
g = 0.00870080741400032;
r = 0.15073000772291703;
l = 0.41636379826072206;
w = 0.5708768119855212;
etau_k = 0;
etau_l = 0;
end;
order = 3;
// Sets shocks
vcov = [0.8 0;
0 0.8];

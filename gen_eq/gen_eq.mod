// vars
var c l k w r A vpi g;

// parameters
parameters cbeta cdelta cpsi cv cphi cgamma clambda csigma calpha;

load params;
load xss;

// setting params
cbeta = params(1);
cdelta = params(2);
cpsi= params(3);
cv = params(4);
cphi = params(5);
cgamma = params(6);
clambda = params(7);
csigma = params(8);
calpha = params(9);

// model
model;
cbeta * (1 + r  - cdelta) * (c(+1)/c)^(- cphi) = 1;
l^cv = w * c^(-cphi)/cpsi;
g = (cgamma - 1) * clambda * (clambda * csigma * vpi)^(csigma/(1 - csigma));
A(+1) = (1+g)* A;
k(-1) = (calpha^2/r)^(1/(1 - calpha)) * l * A;
w = (1 - calpha) * l^(-calpha) * k(-1);
y = k + c;
k = (1 - cdelta) * k(-1) + k - k(-1);
end;

//init values
initval;
c = xss(1);
l = xss(2);
k = xss(3);
w = xss(4);
r = xss(5);
A = xss(6);
vpi = xss(7);
g = xss(8);
end;

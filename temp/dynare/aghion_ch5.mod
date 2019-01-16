// declare endogenous variables
var k g vpi log_k;

predetermined_variables k;

// parameters
parameters s cdelta cgamma clambda csigma calpha;

load params;
load xss;

s = params(1);
cdelta = params(2);
cgamma = params(3);
clambda = params(4);
csigma = params(5);
calpha = params(6);

// model
model;
k(+1) *(1 + g) = s * k + (1 - cdelta)*k;
g = (cgamma - 1) * clambda * (csigma * clambda * vpi) ^ (csigma/(1 - csigma));
vpi = calpha * (1 - calpha) * k ^ calpha;
log_k = log(k);
end;


// initial values
initval;
k = 0.9 * xss(1);
vpi = calpha * (1 - calpha) * k ^ calpha;
g = (cgamma - 1) * clambda * (csigma * clambda * vpi) ^ (csigma/(1 - csigma));
log_k = log(k);
end;

// end values
endval;
k = xss(1);
g = xss(2);
vpi = xss(3);
log_k = log(k);
end;

steady;
// compute residual. Should be 0 if the steady state is correct in the end values
resid;

// setup perfect foresight model
perfect_foresight_setup(periods=200);
perfect_foresight_solver;

//rplot command: display simulation results
rplot log_k;
rplot g;
rplot vpi;

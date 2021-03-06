// vars
var r g l etau_l;
trend_var(growth_factor=1+g) A;
var(deflator=A) k y c w;

varexo junk; //Not a real exo var. Needed for dynare to behave

// parameters
parameters cbeta cdelta calpha cgamma clambda csigma cpsi cnu cG_0 etau_k;

load params;
load xinit;
load policy;

// setting params
cbeta = params(1);
cdelta = params(2);
calpha = params(3);
cgamma = params(4);
clambda= params(5);
csigma = params(6);
ctheta = params(7);
cnu = params(8);
cpsi = params(9);
cG_0 = params(10);
etau_k = policy(1);

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

//Government constriant
cG_0 = etau_k * k(-1) * r + etau_l * l * w;
end;

initval;
c = xinit(1);
y = xinit(2);
k = xinit(3);
g = xinit(4);
r = xinit(5);
l = xinit(6);
w = xinit(7);
etau_l = policy(2);
end;

// Some checks
steady;
resid(1);
check;

// solve
stoch_simul(order=3, irf = 0);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulation %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load init_sim;
t = 200;
shock_matrix = zeros(t,M_.exo_nbr);
tau_0_simul = simult_(init_sim,oo_.dr,shock_matrix,3);

%{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Solves the ss of the Aghion-Howitt Optimal cap vs lab tax paper

Current issue: 7 vars to solve, 6 equations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}

% deep parameters
beta    = 0.98;      %discount rate
phi     = 6.7;       %disutil of labour scale param
eta     = 0.833;     %labour elasticity
alpha   = 0.295;     %capital share
lambda  = 1.0522;    %intermediate productivity increase param
delta   = 0.06;      %depri
psi     = 0.05;      %innovation spending parameter
G_0     = 0.1;       %government spending at 0

% reduced form params
Omega = 1.0 - (( lambda - 1.0)/ lambda) * (1.0 -  alpha);

params = [beta, phi, eta, alpha, lambda, delta, psi];

%defining initial conditions
init_vars = ones(1, 6)

%solving for steady state
f = @steadyS;
options = optimoptions ( ’ fsolve ’ , ’ Display ’ , ’ iter ’ );
[ k1 , fval , exitflag ] = fsolve ( f , init_vars, options );

clear; clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% parameter_setting %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters
cbeta = 0.96;
cdelta = 0.1;
calpha = 0.33;
cgamma = 1.2;
clambda= 1;
csigma = 0.8;
ctheta = 0.9;
cnu = 1.50;
cpsi = 6.50;
cG_0 = 0.1;
etau_l = 0.5;

params = [cbeta,
          cdelta, 
          calpha,
          cgamma,
          clambda,
          csigma,
          ctheta,
          cnu,
          cpsi,
          cG_0,
          etau_l];

save('params.mat', 'params');

% == getting steady state == %
vars_init = ones(1, 8);
f = @get_ss;
[vars_ss, fval, exitflag] = fsolve(f, vars_init);
save('ss_vars.mat', 'vars_ss');



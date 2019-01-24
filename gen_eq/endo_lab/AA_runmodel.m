
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

% initial policy params

etau_k = 0; etau_l = 0;

params = [cbeta cdelta calpha cgamma clambda csigma ctheta cnu cpsi cG_0];
policy = [etau_k, etau_l];

save('params.mat', 'params');
save('policy.mat', 'policy');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

compute_steadystate;
dynare model_initval.mod nostrict;

init_sim = oo_.dr.ys;
save('init_sim.mat', 'init_sim')

% new policy params
cap_tax_range = linspace(0, 1, 3);
welfare_vec = NaN(numel(cap_tax_range), 2);
for i = length(cap_tax_range)
    etau_k = cap_tax_range(i); etau_l = 0;
    policy = [etau_k, etau_l];

    save('policy.mat', 'policy');
    
    compute_steadystate;
    dynare model_toloop.mod nostrict noclearall;

    %% evaluating welfare %%

    p_r = find(M_.endo_names(oo_.dr.order_var) == 'r');
    p_g = find(M_.endo_names(oo_.dr.order_var) == 'g');
    p_l = find(M_.endo_names(oo_.dr.order_var) == 'l');
    p_etau_l = find(M_.endo_names(oo_.dr.order_var) == 'e');
    p_k = find(M_.endo_names(oo_.dr.order_var) == 'k');
    p_y = find(M_.endo_names(oo_.dr.order_var) == 'y');
    p_c = find(M_.endo_names(oo_.dr.order_var) == 'c');
    p_w = find(M_.endo_names(oo_.dr.order_var) == 'w');

    c = tau_0_simul(p_c, :);
    l = tau_0_simul(p_l, :);
    g = tau_0_simul(p_g, :);

    A_0 = 1;
    g = tau_0_simul(p_g, :);
    A_series = [A_0];
    for i = 1:(numel(g)-1)
    A_1 = (1 + g(i+1)) * A_0;
    A_series = [A_series, A_1];
    A_0 = A_1;
    end

    util = log(c .* A_series)/(1 - cbeta) - cpsi * ((l .* A_series).^(1 + cnu)/(1 + cnu));
    welfare = sum(util)
    welfare_vec(i, 1) = etau_k;
    welfare_vec(i, 2) = welfare;
end

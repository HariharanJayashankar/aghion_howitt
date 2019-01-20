%{
Refer to: http://www.dynare.org/manual/index_27.html#Stochastic-solution-and-simulation
%}

% M_.endo_names(oo_.dr.order_var,:) %gets us the list of variables for LHS
% M_.endo_names(oo_.dr.inv_order_var,:) %gets us the list of variables for RHS

% gererating 40 observations of Steady States for all variables
% ss values are found in oo_.steady_state, ordered according to M_.endo_names

y_ss = [oo_.dr.ys];

%storing params in convenient objects
A = oo_.dr.ghx;
B = oo_.dr.ghu;
% looping over to create series for IRF

%making shock matrix; each column is a tiem period, each row is a var
u_0 = 0; % initialize the shock vector
u_1 = 0.8;
u =[u_0, u_1, (zeros(1, 98))];

series = [];
y_0 = y_ss(oo_.dr.state_var);
for i = 1:100
    y_1 = y_ss + A * (y_0 - y_ss(oo_.dr.state_var)) + B * u(i);
    series = [series, y_1];
    y_0 = y_1(oo_.dr.state_var);
end

%need to touch this up a bit. It isn't giving me the IRFS

%Choose initial k and A

K = 1;
A = 1;

y_0 = K/A; %initial point in the policy function

y_ss = oo_.dr.ys;
state = find(M_.endo_names(oo_.dr.order_var,:) == 'k');

%policy func params
g_0 = oo_.dr.g_0;
g_1 = oo_.dr.g_1;
g_2 = oo_.dr.g_2;

% defining z according to dynare documentation
% http://www.dynare.org/manual/index_27.html#Stochastic-solution-and-simulation
z = [y_0 - y_ss(state);
    0;
    0]

% Use policy function to get a series path

series = [y_0];
for i = 1:100
  y_1 = y_ss + g_0 + g_1 * z + g_2 * (kron(z, z)) + g_3 * (kron(kron(z, z), z));
  z = [y_1 - y_ss(state);
      0;
      0];
  series = [series, y_1];
end


% rescale series

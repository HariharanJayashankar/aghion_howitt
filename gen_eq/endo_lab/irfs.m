%{
Refer to: http://www.dynare.org/manual/index_27.html#Stochastic-solution-and-simulation
%}

% M_.endo_names(oo_.dr.order_var,:) %gets us the list of variables for LHS
% M_.endo_names(oo_.dr.inv_order_var,:) %gets us the list of variables for RHS

% gererating 40 observations of Steady States for all variables
% ss values are found in oo_.steady_state, ordered according to M_.endo_names

n = 40;
n_shocks = 2;
state = find(M_.endo_names(oo_.dr.order_var,:) == 'k');

y_ss = [oo_.dr.ys];

%storing params in convenient objects
A = oo_.dr.ghx;
B = oo_.dr.ghu;
% looping over to create series for IRF

%making shock matrix; each column is a tiem period, each row is a var
u_0 = zeros(n_shocks, 1); % initialize the shock vector
u_1 = [0.8; 0.8];
u =[u_0, u_1, (zeros(n_shocks, n - 2))];


series = [];
% generating IRF series
for i = 1:n_shocks
  y_0 = y_ss(state);
  for j = 1:n
      y_1 = y_ss + (A * (y_0 - y_ss(state))) + (B(:, i) * u(i, j));
      series = [series, y_1];
      y_0 = y_1(state);
  end
end

% setting up plot
figure1 = figure;
if mod(numel(y_ss),2) == 2
  a = 2;
  b = numel(y_ss)/2;
else
  a = 2;
  b = (numel(y_ss)+1)/2;
end

% actually plotting

for i=1:numel(y_ss)
  subplot(a, b, i); plot(series(i, 1:n));
  hold on;
  plot(y_ss(i) * ones(n, 1), ':');
  hold off;
  title(M_.endo_names_long(oo_.dr.order_var,:)(i));
end
subtitle('IRF: Shock to tau_k');
saveas(figure1,'irf_tauk.png');


for i=1:numel(y_ss)
  subplot(a, b, i); plot(series(i, n+1:2*n));
  hold on;
  plot(y_ss(i) * ones(n, 1), ':');
  hold off;
  title(M_.endo_names_long(oo_.dr.order_var,:)(i));
end
subtitle('IRF: Shock to tau_l');
saveas(figure1,'irf_taul.png');

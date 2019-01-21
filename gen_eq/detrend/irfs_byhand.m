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
y_0 = y_ss(2);


% generating IRF series
for i = 1:100
    y_1 = y_ss + (A * (y_0 - y_ss(2))) + (B * u(i));
    series = [series, y_1];
    y_0 = y_1(2);
end

%plotting
figure1 = figure;
if mod(numel(y_ss),2) == 2
  a = 2;
  b = numel(y_ss)/2;
else
  a = 2;
  b = (numel(y_ss)+1)/2;
end

for i=1:numel(y_ss)
  subplot(a, b, i); plot(series(i, :));
  hold on;
  plot(y_ss(i) * ones(100, 1), ':');
  hold off;
  title(M_.endo_names_long(oo_.dr.order_var,:)(i));
end
subtitle('Impulse Response Functions (by Hand)');
set(figure1,'PaperUnits','inches','PaperPosition',[0 0 10 6]);
saveas(figure1,'irfs_byhand.png');

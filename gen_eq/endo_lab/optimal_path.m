%{
Toying around to find optimal path of economy once we have computed
the policy functions.
Draws a lot of inspiration from "irfs.m"
%}

n = 40;
n_shocks = 2;
state = find(M_.endo_names(oo_.dr.order_var,:) == 'k');
growth = find(M_.endo_names(oo_.dr.order_var,:) == 'g');

y_ss = [oo_.dr.ys];

%storing params in convenient objects
A = oo_.dr.ghx;

%creating SS path

series = y_ss * ones(1, 40);
%{
% generating IRF series
for i = 1:n_shocks
  y_0 = y_ss(state);
  for j = 1:n
      y_1 = y_ss + (A * (y_0 - y_ss(state)));
      series = [series, y_1];
      y_0 = y_1(state);
  end
end
%}
%{
The above loop just repeats the steady state values for 40 periods. Kinda useless
to find the policy function just for this.
%}


%series for A
g = series(find(M_.endo_names(oo_.dr.order_var,:) == 'g'), :);
A_0 = 1;
series_a =[A_0];
for i = 1:40
  A_1 = (1 + g(i)) * A_0;
  series_a = [series_a, A_1];
  A_0 = A_1;
end

%transforming all variables back
growth = find(M_.endo_names(oo_.dr.order_var,:) != 'l' & M_.endo_names(oo_.dr.order_var,:) != 'r' & M_.endo_names(oo_.dr.order_var,:) != 'g');
series_g = series(growth);

series_trns = [];
for i = 1:numel(growth)
  series_trns(i, :) = series_g(i, :) .* series_a;
end

%{
Toying around to find optimal path of economy once we have computed
the policy functions.
Draws a lot of inspiration from "irfs.m"
%}


p_r = find(M_.endo_names(oo_.dr.order_var,:) == 'r')
p_g = find(M_.endo_names(oo_.dr.order_var,:) == 'g')
p_l = find(M_.endo_names(oo_.dr.order_var,:) == 'l')
p_etau_l = find(M_.endo_names(oo_.dr.order_var,:) == 'etau_l')
p_k = find(M_.endo_names(oo_.dr.order_var,:) == 'k')
p_y = find(M_.endo_names(oo_.dr.order_var,:) == 'y')
p_c = find(M_.endo_names(oo_.dr.order_var,:) == 'c')
p_w = find(M_.endo_names(oo_.dr.order_var,:) == 'w')


% coeffs for policy func

A = [oo_.dr.ghx(oo_.dr.inv_order_var(p_k),:)];
B = [oo_.dr.ghu(oo_.dr.inv_order_var(p_k),:)];

C = [oo_.dr.ghx(oo_.dr.inv_order_var(p_r),:);
     oo_.dr.ghx(oo_.dr.inv_order_var(p_g),:);
     oo_.dr.ghx(oo_.dr.inv_order_var(p_l),:);
     oo_.dr.ghx(oo_.dr.inv_order_var(p_etau_l),:);
     oo_.dr.ghx(oo_.dr.inv_order_var(p_y),:);
     oo_.dr.ghx(oo_.dr.inv_order_var(p_c),:);
     oo_.dr.ghx(oo_.dr.inv_order_var(p_w),:)];

D = [oo_.dr.ghu(oo_.dr.inv_order_var(p_r),:);
     oo_.dr.ghu(oo_.dr.inv_order_var(p_g),:);
     oo_.dr.ghu(oo_.dr.inv_order_var(p_l),:);
     oo_.dr.ghu(oo_.dr.inv_order_var(p_etau_l),:);
     oo_.dr.ghu(oo_.dr.inv_order_var(p_y),:);
     oo_.dr.ghu(oo_.dr.inv_order_var(p_c),:);
     oo_.dr.ghu(oo_.dr.inv_order_var(p_w),:)];

Us1 = [oo_.dr.ghxx(oo_.dr.inv_order_var(p_k),:)];
Us2 = [oo_.dr.ghuu(oo_.dr.inv_order_var(p_k),:)];


% Steady state
y_ss = [oo_.dr.ys(oo_.dr.inv_order_var(p_r), :);
        oo_.dr.ys(oo_.dr.inv_order_var(p_g), :);
        oo_.dr.ys(oo_.dr.inv_order_var(p_l), :);
        oo_.dr.ys(oo_.dr.inv_order_var(p_etau_l), :);
        oo_.dr.ys(oo_.dr.inv_order_var(p_y), :);
        oo_.dr.ys(oo_.dr.inv_order_var(p_c), :);
        oo_.dr.ys(oo_.dr.inv_order_var(p_w), :);
        oo_.dr.ys(oo_.dr.inv_order_var(p_k), :);];

% Simulation

T = 200;

for i = 1:T


end

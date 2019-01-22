% Usage:
%       out = model_out_f(params, y)
%   where
%       out    is a (7,1) column vector of the residuals
%              of the static system
%       params is a (8,1) vector of parameter values
%              in the ordering as declared
%       y      is a (7,1) vector of endogenous variables
%              in the ordering as declared
%
% Created by Dynare++ v. 4.5.6

% params ordering
% =====================
% cbeta
% cdelta
% calpha
% cgamma
% clambda
% csigma
% cpsi
% cnu
%
% y ordering
% =====================
% r
% g
% l
% k
% y
% c
% w

function out = model_out_f(params, y)
if size(y) ~= [7,1]
	error('Wrong size of y, must be [7,1]');
end
if size(params) ~= [8,1]
	error('Wrong size of params, must be [8,1]');
end

% hardwired constants
a0 =            0;
a1 =            1;
a2 = NaN;
a3 =    1.1283792;
% numerical constants
a4 =            1;
a36 =            2;
% parameter values
a7 = params(1); % cbeta
a14 = params(2); % cdelta
a33 = params(3); % calpha
a46 = params(4); % cgamma
a48 = params(5); % clambda
a50 = params(6); % csigma
a61 = params(7); % cpsi
a62 = params(8); % cnu
% exogenous variables to zeros
a10 = 0.0; % etau_k
a67 = 0.0; % etau_l
% endogenous variables to y
a30 = y(1); % r
a9 = y(1); % r
a45 = y(2); % g
a17 = y(2); % g
a31 = y(3); % l
a25 = y(4); % k
a23 = y(4); % k
a22 = y(5); % y
a19 = y(6); % c
a5 = y(6); % c
a65 = y(7); % w

t6 = a4 / a5;
t8 = t6 * a7;
t11 = a4 - a10;
t12 = a9 * t11;
t13 = a4 + t12;
t15 = t13 - a14;
t16 = t8 * t15;
t18 = a4 + a17;
t20 = t18 / a19;
t21 = t16 - t20;
t24 = a19 + a23;
t26 = a4 - a14;
t27 = a25 * t26;
t28 = t24 - t27;
t29 = a22 - t28;
t32 = a25 / a31;
t34 = a33 - a4;
t35 = t32 ^ t34;
t37 = a33 ^ a36;
t38 = t35 * t37;
t39 = a30 - t38;
t40 = a4 - a33;
t41 = a31 ^ t40;
t42 = a25 ^ a33;
t43 = t41 * t42;
t44 = a22 - t43;
t47 = a46 - a4;
t49 = t47 * a48;
t51 = a48 * a50;
t52 = t34 * t51;
t53 = t32 ^ a33;
t54 = t52 * t53;
t55 = a4 - a50;
t56 = a50 / t55;
t57 = t54 ^ t56;
t58 = t49 * t57;
t59 = a45 - t58;
t60 = a4 / a19;
t63 = a31 ^ a62;
t64 = a61 * t63;
t66 = t64 / a65;
t68 = a4 - a67;
t69 = t66 * t68;
t70 = t60 - t69;
t71 = t40 ^ t40;
t72 = t53 * t71;
t73 = a65 - t72;
% setting the output variable
out = zeros(7, 1);
out(1) = t21;
out(2) = t29;
out(3) = t39;
out(4) = t44;
out(5) = t59;
out(6) = t70;
out(7) = t73;

% Usage:
%       out = model_out_ff(params, y)
%   where
%       out    is a (7,7) matrix of the first order
%              derivatives of the static system residuals
%              columns correspond to endo variables in
%              the ordering as declared
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

function out = model_out_ff(params, y)
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
t74 = t8 * t11;
t75 = a1 / a19;
t76 = -(t75);
t12 = a9 * t11;
t13 = a4 + t12;
t15 = t13 - a14;
t77 = -(a4);
t78 = a5 * a5;
t79 = t77 / t78;
t80 = a7 * t79;
t81 = t15 * t80;
t18 = a4 + a17;
t82 = -(t18);
t83 = a19 * a19;
t84 = t82 / t83;
t85 = -(t84);
t1 = a1;
t86 = -(a1);
t26 = a4 - a14;
t136 = -(t26);
t137 = -(t136);
t37 = a33 ^ a36;
t138 = -(a25);
t139 = a31 * a31;
t140 = t138 / t139;
t34 = a33 - a4;
t32 = a25 / a31;
t143 = t34 - a1;
t144 = t32 ^ t143;
t145 = t34 * t144;
t146 = t140 * t145;
t147 = t37 * t146;
t148 = -(t147);
t149 = a1 / a31;
t150 = t145 * t149;
t151 = t37 * t150;
t152 = -(t151);
t42 = a25 ^ a33;
t40 = a4 - a33;
t238 = t40 - a1;
t239 = a31 ^ t238;
t240 = t40 * t239;
t241 = t42 * t240;
t242 = -(t241);
t41 = a31 ^ t40;
t245 = a33 - a1;
t246 = a25 ^ t245;
t247 = a33 * t246;
t248 = t41 * t247;
t249 = -(t248);
t47 = a46 - a4;
t49 = t47 * a48;
t51 = a48 * a50;
t52 = t34 * t51;
t287 = t32 ^ t245;
t288 = a33 * t287;
t289 = t140 * t288;
t290 = t52 * t289;
t55 = a4 - a50;
t56 = a50 / t55;
t53 = t32 ^ a33;
t54 = t52 * t53;
t293 = t56 - a1;
t294 = t54 ^ t293;
t295 = t56 * t294;
t296 = t290 * t295;
t297 = t49 * t296;
t298 = -(t297);
t299 = t149 * t288;
t300 = t52 * t299;
t301 = t295 * t300;
t302 = t49 * t301;
t303 = -(t302);
t68 = a4 - a67;
t437 = a62 - a1;
t438 = a31 ^ t437;
t439 = a62 * t438;
t440 = a61 * t439;
t441 = t440 / a65;
t442 = t68 * t441;
t443 = -(t442);
t63 = a31 ^ a62;
t64 = a61 * t63;
t444 = -(t64);
t445 = a65 * a65;
t446 = t444 / t445;
t447 = t68 * t446;
t448 = -(t447);
t449 = t77 / t83;
t71 = t40 ^ t40;
t519 = t71 * t289;
t520 = -(t519);
t521 = t71 * t299;
t522 = -(t521);
% setting the output variable
out = zeros(7, 7);
out(1,1) = out(1,1) + t74; % r(1)
out(1,2) = out(1,2) + t76; % g(1)
out(1,6) = out(1,6) + t81; % c(1)
out(1,6) = out(1,6) + t85; % c(0)
out(2,5) = out(2,5) + t1; % y(0)
out(2,4) = out(2,4) + t86; % k(0)
out(2,6) = out(2,6) + t86; % c(0)
out(2,4) = out(2,4) + t137; % k(-1)
out(3,3) = out(3,3) + t148; % l(0)
out(3,1) = out(3,1) + t1; % r(0)
out(3,4) = out(3,4) + t152; % k(-1)
out(4,3) = out(4,3) + t242; % l(0)
out(4,5) = out(4,5) + t1; % y(0)
out(4,4) = out(4,4) + t249; % k(-1)
out(5,3) = out(5,3) + t298; % l(0)
out(5,2) = out(5,2) + t1; % g(0)
out(5,4) = out(5,4) + t303; % k(-1)
out(6,3) = out(6,3) + t443; % l(0)
out(6,7) = out(6,7) + t448; % w(0)
out(6,6) = out(6,6) + t449; % c(0)
out(7,3) = out(7,3) + t520; % l(0)
out(7,7) = out(7,7) + t1; % w(0)
out(7,4) = out(7,4) + t522; % k(-1)

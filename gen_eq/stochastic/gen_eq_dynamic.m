function [residual, g1, g2, g3] = gen_eq_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(10, 1);
T40 = params(3)^2;
T43 = y(1)^params(3);
lhs =1/y(16)*params(1)*(1+y(18)*(1-y(11))-params(2));
rhs =(1+y(17))/y(6);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =y(6)+(1+y(17))*y(8)-y(1)*(1-params(2))+y(12);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(1)^(params(3)-1)*T40;
residual(3)= lhs-rhs;
lhs =y(7);
rhs =T43;
residual(4)= lhs-rhs;
lhs =y(9);
rhs =(params(4)-1)*params(5)*(T43*(params(3)-1)*params(5)*params(6))^(params(6)/(1-params(6)));
residual(5)= lhs-rhs;
lhs =y(12);
rhs =y(1)*y(11)*y(10);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =params(7)*y(2)+y(5);
residual(7)= lhs-rhs;
lhs =y(13);
rhs =x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(14);
rhs =y(3);
residual(9)= lhs-rhs;
lhs =y(15);
rhs =y(4);
residual(10)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(10, 19);

  %
  % Jacobian matrix
  %

T96 = getPowerDeriv(y(1),params(3),1);
  g1(1,6)=(-((-(1+y(17)))/(y(6)*y(6))));
  g1(1,16)=(1+y(18)*(1-y(11))-params(2))*params(1)*(-1)/(y(16)*y(16));
  g1(1,17)=(-(1/y(6)));
  g1(1,18)=1/y(16)*params(1)*(1-y(11));
  g1(1,11)=1/y(16)*params(1)*(-y(18));
  g1(2,6)=(-1);
  g1(2,7)=1;
  g1(2,1)=1-params(2);
  g1(2,8)=(-(1+y(17)));
  g1(2,17)=(-y(8));
  g1(2,12)=(-1);
  g1(3,1)=(-(T40*getPowerDeriv(y(1),params(3)-1,1)));
  g1(3,10)=1;
  g1(4,7)=1;
  g1(4,1)=(-T96);
  g1(5,1)=(-((params(4)-1)*params(5)*(params(3)-1)*params(5)*params(6)*T96*getPowerDeriv(T43*(params(3)-1)*params(5)*params(6),params(6)/(1-params(6)),1)));
  g1(5,9)=1;
  g1(6,1)=(-(y(11)*y(10)));
  g1(6,10)=(-(y(11)*y(1)));
  g1(6,11)=(-(y(1)*y(10)));
  g1(6,12)=1;
  g1(7,2)=(-params(7));
  g1(7,11)=1;
  g1(7,5)=(-1);
  g1(8,19)=(-1);
  g1(8,13)=1;
  g1(9,3)=(-1);
  g1(9,14)=1;
  g1(10,4)=(-1);
  g1(10,15)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,361);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,6859);
end
end
end
end

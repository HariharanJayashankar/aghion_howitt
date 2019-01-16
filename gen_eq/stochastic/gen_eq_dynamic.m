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

residual = zeros(5, 1);
T38 = params(3)^2;
T41 = y(1)^params(3);
lhs =1/y(7)*params(1)*(1+y(9)*(1-x(it_, 1))-params(2));
rhs =(1+y(8))/y(2);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =y(2)+(1+y(8))*y(4)-y(1)*(1-params(2));
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(1)^(params(3)-1)*T38;
residual(3)= lhs-rhs;
lhs =y(3);
rhs =T41;
residual(4)= lhs-rhs;
lhs =y(5);
rhs =(params(4)-1)*params(5)*(T41*(params(3)-1)*params(5)*params(6))^(params(6)/(1-params(6)));
residual(5)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(5, 10);

  %
  % Jacobian matrix
  %

T69 = getPowerDeriv(y(1),params(3),1);
  g1(1,2)=(-((-(1+y(8)))/(y(2)*y(2))));
  g1(1,7)=(1+y(9)*(1-x(it_, 1))-params(2))*params(1)*(-1)/(y(7)*y(7));
  g1(1,8)=(-(1/y(2)));
  g1(1,9)=1/y(7)*params(1)*(1-x(it_, 1));
  g1(1,10)=1/y(7)*params(1)*(-y(9));
  g1(2,2)=(-1);
  g1(2,3)=1;
  g1(2,1)=1-params(2);
  g1(2,4)=(-(1+y(8)));
  g1(2,8)=(-y(4));
  g1(3,1)=(-(T38*getPowerDeriv(y(1),params(3)-1,1)));
  g1(3,6)=1;
  g1(4,3)=1;
  g1(4,1)=(-T69);
  g1(5,1)=(-((params(4)-1)*params(5)*(params(3)-1)*params(5)*params(6)*T69*getPowerDeriv(T41*(params(3)-1)*params(5)*params(6),params(6)/(1-params(6)),1)));
  g1(5,5)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],5,100);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,1000);
end
end
end
end

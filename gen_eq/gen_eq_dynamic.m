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

residual = zeros(6, 1);
T25 = (y(8)*(1+y(7))/y(2))^(-params(3));
T44 = y(1)^params(7);
lhs =params(1)*(1+y(9)*(1-x(it_, 1))-params(2))*T25;
rhs =1;
residual(1)= lhs-rhs;
lhs =y(7);
rhs =(params(4)-1)*params(5)*(params(5)*params(6)*y(6))^(params(6)/(1-params(6)));
residual(2)= lhs-rhs;
lhs =y(3);
rhs =T44;
residual(3)= lhs-rhs;
lhs =y(4);
rhs =(params(7)/y(5))^(1/(1-params(7)));
residual(4)= lhs-rhs;
lhs =y(6);
rhs =T44*params(7)*(1-params(7));
residual(5)= lhs-rhs;
lhs =y(3);
rhs =y(2)+y(4)-y(1)/(1+y(7));
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 10);

  %
  % Jacobian matrix
  %

T63 = getPowerDeriv(y(8)*(1+y(7))/y(2),(-params(3)),1);
T69 = getPowerDeriv(y(1),params(7),1);
  g1(1,2)=params(1)*(1+y(9)*(1-x(it_, 1))-params(2))*(-(y(8)*(1+y(7))))/(y(2)*y(2))*T63;
  g1(1,8)=params(1)*(1+y(9)*(1-x(it_, 1))-params(2))*T63*(1+y(7))/y(2);
  g1(1,9)=T25*params(1)*(1-x(it_, 1));
  g1(1,7)=params(1)*(1+y(9)*(1-x(it_, 1))-params(2))*T63*y(8)/y(2);
  g1(1,10)=T25*params(1)*(-y(9));
  g1(2,6)=(-((params(4)-1)*params(5)*params(5)*params(6)*getPowerDeriv(params(5)*params(6)*y(6),params(6)/(1-params(6)),1)));
  g1(2,7)=1;
  g1(3,3)=1;
  g1(3,1)=(-T69);
  g1(4,4)=1;
  g1(4,5)=(-((-params(7))/(y(5)*y(5))*getPowerDeriv(params(7)/y(5),1/(1-params(7)),1)));
  g1(5,1)=(-(params(7)*(1-params(7))*T69));
  g1(5,6)=1;
  g1(6,2)=(-1);
  g1(6,3)=1;
  g1(6,1)=1/(1+y(7));
  g1(6,4)=(-1);
  g1(6,7)=(-y(1))/((1+y(7))*(1+y(7)));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,100);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1000);
end
end
end
end

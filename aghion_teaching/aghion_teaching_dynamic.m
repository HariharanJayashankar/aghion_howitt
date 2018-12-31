function [residual, g1, g2, g3] = aghion_teaching_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(8, 1);
T12 = y(4)^params(1);
T15 = params(1)^2;
T19 = 1/(1-params(1));
T42 = y(6)^params(1);
lhs =y(3);
rhs =T12*y(1);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =(T15/y(6))^T19;
residual(2)= lhs-rhs;
lhs =y(6);
rhs =params(2)*params(3)*y(11)/(params(4)+params(2)*y(8));
residual(3)= lhs-rhs;
lhs =y(2);
rhs =params(5)-y(4);
residual(4)= lhs-rhs;
lhs =y(6);
rhs =y(9)/y(1);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =(1-params(1))/params(1)*(T15/T42)^T19;
residual(6)= lhs-rhs;
lhs =y(5);
rhs =params(3)*y(1);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =log(params(3))*params(2)*y(2);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 11);

  %
  % Jacobian matrix
  %

  g1(1,3)=1;
  g1(1,4)=(-(y(1)*getPowerDeriv(y(4),params(1),1)));
  g1(1,1)=(-T12);
  g1(2,4)=1;
  g1(2,6)=(-((-T15)/(y(6)*y(6))*getPowerDeriv(T15/y(6),T19,1)));
  g1(3,6)=1;
  g1(3,11)=(-(params(2)*params(3)/(params(4)+params(2)*y(8))));
  g1(3,8)=(-((-(params(2)*params(2)*params(3)*y(11)))/((params(4)+params(2)*y(8))*(params(4)+params(2)*y(8)))));
  g1(4,4)=1;
  g1(4,2)=1;
  g1(5,1)=(-((-y(9))/(y(1)*y(1))));
  g1(5,6)=1;
  g1(5,9)=(-(1/y(1)));
  g1(6,6)=(-((1-params(1))/params(1)*(-(T15*getPowerDeriv(y(6),params(1),1)))/(T42*T42)*getPowerDeriv(T15/T42,T19,1)));
  g1(6,7)=1;
  g1(7,1)=(-params(3));
  g1(7,5)=1;
  g1(8,2)=(-(params(2)*log(params(3))));
  g1(8,10)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,121);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,1331);
end
end
end
end

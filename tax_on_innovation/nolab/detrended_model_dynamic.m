function [residual, g1, g2, g3] = detrended_model_dynamic(y, x, params, steady_state, it_)
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
T42 = params(3)^2;
T144 = params(1)*1/(y(11)*(1+y(10)));
T147 = 1/(1+y(4));
T152 = y(2)*T147/T147;
T156 = T147^(1-params(3));
T157 = (y(2)*T147)^params(3);
T161 = (params(3)-1)*params(5)*params(6)*T152^params(3);
lhs =(1+y(9)*(1-y(5))-params(2))*T144;
rhs =(1+y(10))/y(8);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =y(8)+y(6)-(1-params(2))*y(2)*T147;
residual(2)= lhs-rhs;
lhs =y(3);
rhs =T42*T152^(params(3)-1);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =T156*T157;
residual(4)= lhs-rhs;
lhs =y(4);
rhs =(params(4)-1)*params(5)*T161^(params(6)/(1-params(6)));
residual(5)= lhs-rhs;
lhs =y(5);
rhs =y(1)-x(it_, 1);
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 12);

  %
  % Jacobian matrix
  %

T167 = (-1)/((1+y(4))*(1+y(4)));
T176 = getPowerDeriv(T152,params(3)-1,1);
T182 = getPowerDeriv(y(2)*T147,params(3),1);
T188 = getPowerDeriv(T152,params(3),1);
T191 = getPowerDeriv(T161,params(6)/(1-params(6)),1);
  g1(1,9)=(1-y(5))*T144;
  g1(1,10)=(1+y(9)*(1-y(5))-params(2))*params(1)*(-y(11))/(y(11)*(1+y(10))*y(11)*(1+y(10)))-1/y(8);
  g1(1,5)=T144*(-y(9));
  g1(1,8)=(-((-(1+y(10)))/(y(8)*y(8))));
  g1(1,11)=(1+y(9)*(1-y(5))-params(2))*params(1)*(-(1+y(10)))/(y(11)*(1+y(10))*y(11)*(1+y(10)));
  g1(2,4)=(1-params(2))*y(2)*T167;
  g1(2,2)=(1-params(2))*T147;
  g1(2,6)=(-1);
  g1(2,7)=1;
  g1(2,8)=(-1);
  g1(3,3)=1;
  g1(3,4)=(-(T42*(T147*y(2)*T167-y(2)*T147*T167)/(T147*T147)*T176));
  g1(3,2)=(-(T42*T176));
  g1(4,4)=(-(T157*T167*getPowerDeriv(T147,1-params(3),1)+T156*y(2)*T167*T182));
  g1(4,2)=(-(T156*T147*T182));
  g1(4,7)=1;
  g1(5,4)=1-(params(4)-1)*params(5)*(params(3)-1)*params(5)*params(6)*(T147*y(2)*T167-y(2)*T147*T167)/(T147*T147)*T188*T191;
  g1(5,2)=(-((params(4)-1)*params(5)*T191*(params(3)-1)*params(5)*params(6)*T188));
  g1(6,1)=(-1);
  g1(6,5)=1;
  g1(6,12)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,144);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1728);
end
end
end
end

function [residual, g1, g2, g3] = detrended_model_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 5, 1);

%
% Model equations
%

T29 = 1/(1+y(2));
T35 = params(3)^2;
T36 = y(3)*T29/T29;
T42 = T29^(1-params(3));
T43 = (y(3)*T29)^params(3);
T54 = (params(3)-1)*params(5)*params(6)*T36^params(3);
lhs =(1+y(1)*(1-x(1))-params(2))*params(1)*1/(y(5)*(1+y(2)));
rhs =(1+y(2))/y(5);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =y(5)+y(3)-(1-params(2))*y(3)*T29;
residual(2)= lhs-rhs;
lhs =y(1);
rhs =T35*T36^(params(3)-1);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =T42*T43;
residual(4)= lhs-rhs;
lhs =y(2);
rhs =(params(4)-1)*params(5)*T54^(params(6)/(1-params(6)));
residual(5)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(5, 5);

  %
  % Jacobian matrix
  %

T69 = (-1)/((1+y(2))*(1+y(2)));
T78 = getPowerDeriv(T36,params(3)-1,1);
T84 = getPowerDeriv(y(3)*T29,params(3),1);
T90 = getPowerDeriv(T36,params(3),1);
T93 = getPowerDeriv(T54,params(6)/(1-params(6)),1);
  g1(1,1)=(1-x(1))*params(1)*1/(y(5)*(1+y(2)));
  g1(1,2)=(1+y(1)*(1-x(1))-params(2))*params(1)*(-y(5))/(y(5)*(1+y(2))*y(5)*(1+y(2)))-1/y(5);
  g1(1,5)=(1+y(1)*(1-x(1))-params(2))*params(1)*(-(1+y(2)))/(y(5)*(1+y(2))*y(5)*(1+y(2)))-(-(1+y(2)))/(y(5)*y(5));
  g1(2,2)=(1-params(2))*y(3)*T69;
  g1(2,3)=(-(1-(1-params(2))*T29));
  g1(2,4)=1;
  g1(2,5)=(-1);
  g1(3,1)=1;
  g1(3,2)=(-(T35*(T29*y(3)*T69-y(3)*T29*T69)/(T29*T29)*T78));
  g1(3,3)=(-(T35*T78));
  g1(4,2)=(-(T43*T69*getPowerDeriv(T29,1-params(3),1)+T42*y(3)*T69*T84));
  g1(4,3)=(-(T42*T29*T84));
  g1(4,4)=1;
  g1(5,2)=1-(params(4)-1)*params(5)*(params(3)-1)*params(5)*params(6)*(T29*y(3)*T69-y(3)*T29*T69)/(T29*T29)*T90*T93;
  g1(5,3)=(-((params(4)-1)*params(5)*T93*(params(3)-1)*params(5)*params(6)*T90));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],5,25);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,125);
end
end
end
end

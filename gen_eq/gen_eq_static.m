function [residual, g1, g2, g3] = gen_eq_static(y, x, params)
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

residual = zeros( 6, 1);

%
% Model equations
%

T24 = (y(1)*(1+y(6))/y(1))^(-params(3));
T43 = y(3)^params(7);
lhs =params(1)*(1+y(4)*(1-x(1))-params(2))*T24;
rhs =1;
residual(1)= lhs-rhs;
lhs =y(6);
rhs =(params(4)-1)*params(5)*(params(5)*params(6)*y(5))^(params(6)/(1-params(6)));
residual(2)= lhs-rhs;
lhs =y(2);
rhs =T43;
residual(3)= lhs-rhs;
lhs =y(3);
rhs =(params(7)/y(4))^(1/(1-params(7)));
residual(4)= lhs-rhs;
lhs =y(5);
rhs =T43*params(7)*(1-params(7));
residual(5)= lhs-rhs;
lhs =y(2);
rhs =y(1)+y(3)-y(3)/(1+y(6));
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

T58 = getPowerDeriv(y(3),params(7),1);
  g1(1,4)=T24*params(1)*(1-x(1));
  g1(1,6)=params(1)*(1+y(4)*(1-x(1))-params(2))*getPowerDeriv(y(1)*(1+y(6))/y(1),(-params(3)),1);
  g1(2,5)=(-((params(4)-1)*params(5)*params(5)*params(6)*getPowerDeriv(params(5)*params(6)*y(5),params(6)/(1-params(6)),1)));
  g1(2,6)=1;
  g1(3,2)=1;
  g1(3,3)=(-T58);
  g1(4,3)=1;
  g1(4,4)=(-((-params(7))/(y(4)*y(4))*getPowerDeriv(params(7)/y(4),1/(1-params(7)),1)));
  g1(5,3)=(-(params(7)*(1-params(7))*T58));
  g1(5,5)=1;
  g1(6,1)=(-1);
  g1(6,2)=1;
  g1(6,3)=(-(1-1/(1+y(6))));
  g1(6,6)=(-y(3))/((1+y(6))*(1+y(6)));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,36);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,216);
end
end
end
end

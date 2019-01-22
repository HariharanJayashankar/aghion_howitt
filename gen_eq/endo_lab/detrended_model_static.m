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

residual = zeros( 7, 1);

%
% Model equations
%

T29 = 1/(1+y(2));
T35 = params(3)^2;
T37 = y(4)*T29/y(3);
T38 = T29*T37;
T45 = (T29*y(3))^(1-params(3));
T46 = (y(4)*T29)^params(3);
T57 = (params(3)-1)*params(5)*params(6)*T38^params(3);
T67 = params(7)*y(3)^params(8);
T75 = (1-params(3))*T29^(1-params(3));
T76 = T37^params(3);
lhs =(1+y(1)*(1-x(1))-params(2))*params(1)*1/(y(6)*(1+y(2)));
rhs =(1+y(2))/y(6);
residual(1)= lhs-rhs;
lhs =y(5);
rhs =y(6)+y(4)-(1-params(2))*y(4)*T29;
residual(2)= lhs-rhs;
lhs =y(1);
rhs =T35*T38^(params(3)-1);
residual(3)= lhs-rhs;
lhs =y(5);
rhs =T45*T46;
residual(4)= lhs-rhs;
lhs =y(2);
rhs =(params(4)-1)*params(5)*T57^(params(6)/(1-params(6)));
residual(5)= lhs-rhs;
lhs =1/y(6);
rhs =T67/y(7)*(1-x(2));
residual(6)= lhs-rhs;
lhs =y(7);
rhs =T75*T76;
residual(7)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(7, 7);

  %
  % Jacobian matrix
  %

T87 = (-1)/((1+y(2))*(1+y(2)));
T94 = T37*T87+T29*y(4)*T87/y(3);
T95 = getPowerDeriv(T38,params(3)-1,1);
T100 = getPowerDeriv(T29*y(3),1-params(3),1);
T102 = getPowerDeriv(y(4)*T29,params(3),1);
T108 = getPowerDeriv(T38,params(3),1);
T111 = getPowerDeriv(T57,params(6)/(1-params(6)),1);
T118 = getPowerDeriv(T37,params(3),1);
  g1(1,1)=(1-x(1))*params(1)*1/(y(6)*(1+y(2)));
  g1(1,2)=(1+y(1)*(1-x(1))-params(2))*params(1)*(-y(6))/(y(6)*(1+y(2))*y(6)*(1+y(2)))-1/y(6);
  g1(1,6)=(1+y(1)*(1-x(1))-params(2))*params(1)*(-(1+y(2)))/(y(6)*(1+y(2))*y(6)*(1+y(2)))-(-(1+y(2)))/(y(6)*y(6));
  g1(2,2)=(1-params(2))*y(4)*T87;
  g1(2,4)=(-(1-(1-params(2))*T29));
  g1(2,5)=1;
  g1(2,6)=(-1);
  g1(3,1)=1;
  g1(3,2)=(-(T35*T94*T95));
  g1(3,3)=(-(T35*T95*T29*(-(y(4)*T29))/(y(3)*y(3))));
  g1(3,4)=(-(T35*T95*T29*T29/y(3)));
  g1(4,2)=(-(T46*y(3)*T87*T100+T45*y(4)*T87*T102));
  g1(4,3)=(-(T46*T29*T100));
  g1(4,4)=(-(T45*T29*T102));
  g1(4,5)=1;
  g1(5,2)=1-(params(4)-1)*params(5)*(params(3)-1)*params(5)*params(6)*T94*T108*T111;
  g1(5,3)=(-((params(4)-1)*params(5)*T111*(params(3)-1)*params(5)*params(6)*T108*T29*(-(y(4)*T29))/(y(3)*y(3))));
  g1(5,4)=(-((params(4)-1)*params(5)*T111*(params(3)-1)*params(5)*params(6)*T108*T29*T29/y(3)));
  g1(6,3)=(-((1-x(2))*params(7)*getPowerDeriv(y(3),params(8),1)/y(7)));
  g1(6,6)=(-1)/(y(6)*y(6));
  g1(6,7)=(-((1-x(2))*(-T67)/(y(7)*y(7))));
  g1(7,2)=(-(T76*(1-params(3))*T87*getPowerDeriv(T29,1-params(3),1)+T75*y(4)*T87/y(3)*T118));
  g1(7,3)=(-(T75*T118*(-(y(4)*T29))/(y(3)*y(3))));
  g1(7,4)=(-(T75*T118*T29/y(3)));
  g1(7,7)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,49);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],7,343);
end
end
end
end

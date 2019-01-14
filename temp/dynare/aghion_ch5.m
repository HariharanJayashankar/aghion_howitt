%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'aghion_ch5';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('aghion_ch5.log');
M_.endo_names = 'k';
M_.endo_names_tex = 'k';
M_.endo_names_long = 'k';
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'vpi');
M_.endo_names_tex = char(M_.endo_names_tex, 'vpi');
M_.endo_names_long = char(M_.endo_names_long, 'vpi');
M_.endo_names = char(M_.endo_names, 'log_k');
M_.endo_names_tex = char(M_.endo_names_tex, 'log\_k');
M_.endo_names_long = char(M_.endo_names_long, 'log_k');
M_.endo_partitions = struct();
M_.param_names = 's';
M_.param_names_tex = 's';
M_.param_names_long = 's';
M_.param_names = char(M_.param_names, 'cdelta');
M_.param_names_tex = char(M_.param_names_tex, 'cdelta');
M_.param_names_long = char(M_.param_names_long, 'cdelta');
M_.param_names = char(M_.param_names, 'cgamma');
M_.param_names_tex = char(M_.param_names_tex, 'cgamma');
M_.param_names_long = char(M_.param_names_long, 'cgamma');
M_.param_names = char(M_.param_names, 'clambda');
M_.param_names_tex = char(M_.param_names_tex, 'clambda');
M_.param_names_long = char(M_.param_names_long, 'clambda');
M_.param_names = char(M_.param_names, 'csigma');
M_.param_names_tex = char(M_.param_names_tex, 'csigma');
M_.param_names_long = char(M_.param_names_long, 'csigma');
M_.param_names = char(M_.param_names, 'calpha');
M_.param_names_tex = char(M_.param_names_tex, 'calpha');
M_.param_names_long = char(M_.param_names_long, 'calpha');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 0;
M_.endo_nbr = 4;
M_.param_nbr = 6;
M_.orig_endo_nbr = 4;
M_.aux_vars = [];
M_.predetermined_variables = [ 1 ];
M_.Sigma_e = zeros(0, 0);
M_.Correlation_matrix = eye(0, 0);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('aghion_ch5_static');
erase_compiled_function('aghion_ch5_dynamic');
M_.orig_eq_nbr = 4;
M_.eq_nbr = 4;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 2;
 0 3;
 0 4;
 0 5;]';
M_.nstatic = 3;
M_.nfwrd   = 0;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 1;
M_.ndynamic   = 1;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:0];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(4, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(0, 1);
M_.params = NaN(6, 1);
M_.NNZDerivatives = [9; 0; -1];
load params;
load xss;
M_.params( 1 ) = params(1);
s = M_.params( 1 );
M_.params( 2 ) = params(2);
cdelta = M_.params( 2 );
M_.params( 3 ) = params(3);
cgamma = M_.params( 3 );
M_.params( 4 ) = params(4);
clambda = M_.params( 4 );
M_.params( 5 ) = params(5);
csigma = M_.params( 5 );
M_.params( 6 ) = params(6);
calpha = M_.params( 6 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0.9*xss(1);
oo_.steady_state( 3 ) = M_.params(6)*(1-M_.params(6))*oo_.steady_state(1)^M_.params(6);
oo_.steady_state( 2 ) = (M_.params(3)-1)*M_.params(4)*(M_.params(4)*M_.params(5)*oo_.steady_state(3))^(M_.params(5)/(1-M_.params(5)));
oo_.steady_state( 4 ) = log(oo_.steady_state(1));
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.steady_state( 1 ) = xss(1);
oo_.steady_state( 2 ) = xss(2);
oo_.steady_state( 3 ) = xss(3);
oo_.steady_state( 4 ) = log(oo_.steady_state(1));
steady;
resid;
options_.periods = 200;
perfect_foresight_setup;
perfect_foresight_solver;
var_list_ = char('log_k');
rplot(var_list_);
var_list_ = char('g');
rplot(var_list_);
var_list_ = char('vpi');
rplot(var_list_);
save('aghion_ch5_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('aghion_ch5_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('aghion_ch5_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('aghion_ch5_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('aghion_ch5_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('aghion_ch5_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('aghion_ch5_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off

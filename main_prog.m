%%              Real Coded Genetic algorithm (RCGA)                %%
%    _________________________________________________________      %
%       Real Coded Genetic Algorithm source codes version 1.0       %
%                                                                   %
%       Developed in MATLAB R2021a(9.10.0.1602886)                  %
%       Programmer: Arafat Ibne Ikram                               %
%       e-Mail: arafatibne.ikram@gmail.com                          %
%       Homepage: https://github.com/arafatikram                    %
%       Reference Used: https://doi.org/10.1016/j.amc.2009.02.044   %
%___________________________________________________________________%

%% Objective function and associated parameter selection; Plotting the objective function
clc; clear; close all;
Func_name='F4'; % F1, F2, F3, F4
[lb,ub,dim,fobj] = testing_functions(Func_name);

%% Plotting the objective function
figure(1)
func_plot_rcga(Func_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Func_name,'( x_1 , x_2 )']);

%% Optimization algorithm associated parameter
params.size=100;            % Population Size
params.max_iter=1000;       % Max generation
params.termination=1000;	% termination criteria
params.total_run=1;         % Number of total program run

% Objective-function's paramter
params.ub=ub;       % upper bound constraint
params.lb=lb;       % lower bound constraint
params.dim=dim;     % dimention of decision variable
params.fobj=fobj;   % objective function

% RCGA special paramter
params.cross_prop=0.90; % cross-over probability
params.mut_prop=0.10;   % Mutation probability
params.no_elt=2;        % elite population filter

% Convergence visualization
params.datavis=false;  % true/false | keeping it false for faster run | true for convergence visualization

%% Main Optiomization : RCGA
Results=rcga_main(params);

Best_fitness=Results.Best_obj;
Best_pop=Results.Best_sol;
cg_curve=Results.cg_curve;

%% Plotting the optimization convegence curve
figure(params.total_run+1)
semilogx(1:length(cg_curve),cg_curve,'Color','r');
grid on;
title('Objective function convergence curve')
xlabel('Generation');
ylabel('Fitness of the best elite')
legend('Fitness')

% Ouput results
fprintf('\n\n')
disp(['Best Fitness: ', num2str(Best_fitness)]);
disp(['Best Solutions: ', num2str(Best_pop)]);
 
%    _________________________________________________________      %
%       Real Coded Genetic Algorithm source codes version 1.0       %
%                                                                   %
%       Developed in MATLAB R2021a(9.10.0.1602886)                  %
%       Programmer: Arafat Ibne Ikram                               %
%       e-Mail: arafatibne.ikram@gmail.com                          %
%       Homepage: https://github.com/arafatikram                    %
%       Reference Used: https://doi.org/10.1016/j.amc.2009.02.044   %
%___________________________________________________________________%

function results = rcga_main(params)
% GA Parameters
no_pop=params.size;
MaxGen=params.max_iter;
termination=params.termination;
total_run=params.total_run;

ub=params.ub;
lb=params.lb;
dim=params.dim;
fobj=params.fobj;

Pc=params.cross_prop;
Pm=params.mut_prop;
no_elt=params.no_elt;

datavis=params.datavis;

ub=ub*ones(1,dim);
lb=lb*ones(1,dim);

for qq=1:total_run
    cg_curve = zeros(1,MaxGen);
    
    %%  Initialization
    % generating initial population
    population= rcga_initialization(no_pop,dim,ub,lb);
    fitness=zeros(no_pop,1);
    for i=1:no_pop
        fitness(i,:)=fobj(population(i,:));
    end
    
    % storing the best solution and values
    g = 1;
    [fitness_min, ind]=min(fitness);
    cg_curve(g) = fitness_min;
    Best_sol=population(ind,:);
    Best_obj=fitness_min;
    disp(['Generation # ' , num2str(g), ' where the fitness value is # ', num2str(Best_obj)]);
    %% Main loop for GA
    for g = 2 : MaxGen
        
        % Elite population selection
        pop_elt=rcga_elitism(population, fitness, no_elt);
        % pop_elt=[];
        no_pop_new=no_pop-no_elt;
        
        population_new=zeros(no_pop_new,dim);
        
        for k = 1: 2: no_pop_new
            % Selection
            [ parent1, parent2] = rcga_selection(population, fitness);
            
            % Crossover
            [child1 , child2] = rcga_crossover(parent1, parent2, Pc);
            
            % Mutation and boundary check and correction
            child1=rcga_mutation(child1, Pm, ub, lb, dim);
            child2=rcga_mutation(child2, Pm, ub, lb, dim);
            
            % population after selection, crossover, mutation, and boundary check
            population_new(k,:)=child1;
            population_new(k+1,:)=child2;
        end
        
        % Next generation population
        population_next=[population_new; pop_elt];
        population_next=population_next(randperm(no_pop),:);
        
        % Fitness value calculation for the newly created population set
        population=population_next;
        for i = 1 : no_pop
            fitness(i,:)=fobj(population(i,:));
        end
        
        % Updating the best solution and individual
        [fitness_min, ind]=min(fitness);
        cg_curve(g) = fitness_min;
        Best_sol=population(ind,:);
        Best_obj=fitness_min;
        disp(['Generation # ' , num2str(g), ' where the fitness value is # ', num2str(Best_obj)]);
        
        %% live Convergence curve
        if (datavis)
            figure(qq)
            plot(cg_curve(1:g), 'Color', '#A2142F', 'linewidth', 2 );
            grid on
            xlabel('generation');
            ylabel('best objective value');
            title(sprintf('RUN: %d, ITER: %d, EVAL: %d, OptimalValue: %0.4g',qq, g,g.*no_pop, cg_curve(g)));drawnow;
        end
        %%  Termination Criteria
        if g > 400     % +400 is taken to avoid early and unwanted mature
            if cg_curve(g)==cg_curve(g-1)
                termination=termination+1;
                if termination>2000
                    break;
                end
            else
                termination=0;
            end
        end
        
    end
    cg_all(qq,:)=cg_curve;		% storing the CG for each run
    GBest_Score_all(qq,:)=Best_obj;	% storing the Best score for each run
    GBest_Solution_all(qq,:)=Best_sol;	% storing the Best solutions for each run
end
% Electing the Best fitness+solution from from multple run
[Best_obj, bb]=min(GBest_Score_all); % filtering best score from multiple run

results.Best_obj=Best_obj;
results.Best_sol=GBest_Solution_all(bb,:);	% filtering best solutions from multiple run
results.cg_curve=cg_all(bb,:);			% filtering CG from multiple run

end

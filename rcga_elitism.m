%    _________________________________________________________      %
%       Real Coded Genetic Algorithm source codes version 1.0       %
%                                                                   %
%       Developed in MATLAB R2021a(9.10.0.1602886)                  %
%       Programmer: Arafat Ibne Ikram                               %
%       e-Mail: arafatibne.ikram@gmail.com                          %
%       Homepage: https://github.com/arafatikram                    %
%       Reference Used: https://doi.org/10.1016/j.amc.2009.02.044   %
%___________________________________________________________________%

function pop_elt=rcga_elitism(population, fitness, no_elt)

% Selecting elite individual
for p=1:no_elt
    [best_obj, best_obj_ind]=min(fitness);
    pop_elt(p,:)=population(best_obj_ind,:);
    population(best_obj_ind,:)=[];
    fitness(best_obj_ind,:)=[];
end

end

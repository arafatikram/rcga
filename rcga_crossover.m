%    _________________________________________________________      %
%       Real Coded Genetic Algorithm source codes version 1.0       %
%                                                                   %
%       Developed in MATLAB R2021a(9.10.0.1602886)                  %
%       Programmer: Arafat Ibne Ikram                               %
%       e-Mail: arafatibne.ikram@gmail.com                          %
%       Homepage: https://github.com/arafatikram                    %
%       Reference Used: https://doi.org/10.1016/j.amc.2009.02.044   %
%___________________________________________________________________%

function [child1 , child2] = rcga_crossover(parent1, parent2, Pc)

% BLX-alpha cross over
alpha=0.50;
child1=zeros(1,size(parent1,2));
child2=zeros(1,size(parent2,2));
if rand<Pc
    c_min=min([parent1;parent2]);       c_max=max([parent1;parent2]);
    I=c_max-c_min;
    cross_min=c_min-I*alpha; cross_max=c_max+I*alpha;
    
    for p=1:size(parent1,1)
        for pp=1:size(parent1,2)
            child1(p,pp)=cross_min(pp)+rand*(cross_max(pp)-cross_min(pp));
            child2(p,pp)=cross_min(pp)+rand*(cross_max(pp)-cross_min(pp));
        end
    end
else
    child1=parent1;
    child2=parent2;
end
end

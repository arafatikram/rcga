%    _________________________________________________________      %
%       Real Coded Genetic Algorithm source codes version 1.0       %
%                                                                   %
%       Developed in MATLAB R2021a(9.10.0.1602886)                  %
%       Programmer: Arafat Ibne Ikram                               %
%       e-Mail: arafatibne.ikram@gmail.com                          %
%       Homepage: https://github.com/arafatikram                    %
%       Reference Used: https://doi.org/10.1016/j.amc.2009.02.044   %
%___________________________________________________________________%

% This function initialize the first population of search agents
function population=rcga_initialization(no_pop,dim,ub,lb)
population=zeros(no_pop,dim);
for i=1:no_pop
    for j=1:dim
        population(i,j)=lb(:,j)+rand*(ub(:,j)-lb(:,j));
    end
end
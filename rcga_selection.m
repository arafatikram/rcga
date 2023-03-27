%    _________________________________________________________      %
%       Real Coded Genetic Algorithm source codes version 1.0       %
%                                                                   %
%       Developed in MATLAB R2021a(9.10.0.1602886)                  %
%       Programmer: Arafat Ibne Ikram                               %
%       e-Mail: arafatibne.ikram@gmail.com                          %
%       Homepage: https://github.com/arafatikram                    %
%       Reference Used: https://doi.org/10.1016/j.amc.2009.02.044   %
%___________________________________________________________________%

function [ parent1, parent2] = rcga_selection(population,fitness)

parent=zeros(2,size(population,2));
for ii=1:2
    k=randi(size(population,1));
    kk=randi(size(population,1));
    if fitness(k)<=fitness(kk)
        parent(ii,:)=population(k,:);
    else
        parent(ii,:)=population(kk,:);
    end
end
parent1=parent(1,:);
parent2=parent(2,:);
end
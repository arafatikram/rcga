%    _________________________________________________________      %
%       Real Coded Genetic Algorithm source codes version 1.0       %
%                                                                   %
%       Developed in MATLAB R2021a(9.10.0.1602886)                  %
%       Programmer: Arafat Ibne Ikram                               %
%       e-Mail: arafatibne.ikram@gmail.com                          %
%       Homepage: https://github.com/arafatikram                    %
%       Reference Used: https://doi.org/10.1016/j.amc.2009.02.044   %
%___________________________________________________________________%

function child=rcga_mutation(child,Pm,ub,lb,dim)

% random mutation
if rand<Pm
    for q=1:dim
        if rand<0.50
            child(q)=lb(q)+rand*(ub(q)-lb(q));
        else
            child(q)=child(q);
        end
    end
end

% Boundary Check
for q=1:dim
    if child(q)>ub(q)
        child(q)=ub(q);
    elseif child(q)<lb(q)
        child(q)=lb(q);
    end
end

end
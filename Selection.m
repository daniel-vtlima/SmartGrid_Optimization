function [crom] = Selection(pop, fit)
[row, column] = size(pop);
crom = [];

aux = 1:2:row;

r1 = randi([1 length(aux)], 1,1);
r2 = randi([1 length(aux)], 1,1);

f1 = fit(r1);
f2 = fit(r2);

if(f1>f2)
    crom = pop(aux(r1), :);
    crom = [crom; pop(aux(r1) + 1, :)];
elseif(f2>f1)
    crom = pop(aux(r2), :);
    crom = [crom; pop(aux(r2) + 1, :)];
else
    crom = pop(aux(r1), :);
    crom = [crom; pop(aux(r1) + 1, :)];
end

end
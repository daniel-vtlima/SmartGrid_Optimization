function [newpop, newfit] = elitism(pop, fit, newfit, newpop, n)

[row, column] = size(pop);

wfits = [];
bfits = [];

best = [];
worst = [];

%Finding the K's minimum and maximum values of a vector
[wfits, p1] = mink(newfit, n);
[bfits, p2] = maxk(fit, n);


for j = 1: n
    best = [best; pop(p2(j), :)];
    worst = [worst; newpop(p1(j), :)];
end


for i = 1:n
    newpop(p1(i), :) = best(i, :);
    newfit(p1(i)) = bfits(i);
end
end
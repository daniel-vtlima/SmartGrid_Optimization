function [newpop, newfit] = elitism2(pop, fit, newfit, newpop)

[rows, cols] = size(pop);
min = 10e20;
max = 0;
count = 0;

for i=1:2:rows
    count = count +1;
    if(newfit(count) < min)
        min = newfit(count);
        posf = count;
        pos = i;
    end
    
    if(fit(count) > max)
        best = pop(i, :);
        best = [best; pop(i+1, :)];
        max = fit(count);
        pos2 = count;
    end
end

newpop(pos:pos+1, :) = best;
newfit(posf) = fit(pos2);

end
function [best, pos] = best_crom(pop, fit)

[row, column] = size(pop);
max = 0;
count = 0;

for j = 1:2:row
    count = count +1;
    if(fit(count) > max)
        best = pop(j, :);
        best = [best; pop(j+1,:)];
        
        max = fit(count);
        
        pos = j;
    end

end

end
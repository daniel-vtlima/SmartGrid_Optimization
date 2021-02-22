function [wd] = sumPath(pop, pos, delaydown, jumpCost)

[rows, cols] = size(pop);

aux = [];
wd = [];
nJumps = 0;

for i=1:rows
    for j=1:cols
        if(pos ~= 1)
            wd = [wd, delaydown(i, pos)];
            pos = pop(i, pos);
            nJumps = nJumps + 1;
        else
            wd = [wd, 0];
            break;
        end
    end
end

wd = sum(wd, 2) + jumpCost * nJumps;
nJumps = 0;

end
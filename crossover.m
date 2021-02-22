function [crom] = crossover(p1, p2, c_ratio)

rc = rand;
z = rand;
if(rc <= c_ratio)

[rows, cols] = size(p1);

    r = randi([1 length(p1)-1], 1, 1);
    if(z < .5)
        crom = [p1(1, 1:r) p2(1, r+1:end)];
        crom = [crom; [p1(2, 1:r) p2(2, r+1:end)]];
    else
        crom = [p2(1, 1:r) p1(1, r+1:end)];
        crom = [crom; [p2(2, 1:r) p1(2, r+1:end)]];
    end
else
    if(z <.5)
        crom = p1;
    else
        crom = p2;
    end
end

end
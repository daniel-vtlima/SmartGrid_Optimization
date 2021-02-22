function [dist] = hammingDistance(pop)

[rows, cols] = size(pop);
dist =[];
aux = 0;

for i=1:3:rows-3
    for j=1:cols
        if(pop(i,j) ~= pop(i+2,j))
            aux = aux + 1;
        elseif(pop(i,j) == pop(i+2,j))
            aux = aux + 0;
        end
        
    end
    dist = [dist; aux];
    if(i == rows-3)
        dist = [dist; aux];
    end
    aux = 0;
end

end
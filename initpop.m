function [pop, posup, posup2] = initpop(pop_size,wup, wdown, k)

rng(k, 'twister');

[rows, cols] = size(wup);
[rows2, cols2] = size(wdown);
posup = zeros(12, 12);
posup2 = zeros(12, 12);

r1 = [];
r2 = [];
pop = [];

for i=1:rows-1
    for j=1:12
        if(wup(i,j) ~= 0 && i <= 12)
            posup(i,j) = j;
        elseif(wup(i,j) ~= 0 && i > 12)
            posup2(i-12, j) = j;
        end
    end
end

for i=1:pop_size
    for j=1:12
        aux1 = nonzeros(posup(j, :));
        aux2 = nonzeros(posup2(j, :));
        
        if(isempty(aux1) == 0 && isempty(aux2) == 0)
            rd = randi([1 length(aux2)], 1, 1);
            rp = randi([1 length(aux1)], 1, 1);
            r1 = [r1, aux1(rp)];
            r2 = [r2, aux2(rd)];
        elseif(isempty(aux1) == 0 && isempty(aux2) == 1)
            rp = randi([1 length(aux1)], 1, 1);
            r1 = [r1, aux1(rp)];
            r2 = [r2, 0];
        elseif(isempty(aux1) == 1 && isempty(aux2) == 0)
            rd = randi([1 length(aux2)], 1, 1);
            r2 = [r2, aux2(rd)];
            r1 = [r1, 1];
        else
            r1 = [r1, 1];
            r2 = [r2, 1];
        end
    end
    pop = [pop; r2; r1];
    r1 = [];
    r2 = [];
end

end
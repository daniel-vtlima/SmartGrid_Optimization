function [crom] = mutation(crom, wup, wdown, posup, posdown, m_ratio)
% k = 5;
% rng(k, 'twister');

[rows, cols] = size(crom);
rp = [];
rd = [];

for i=1:2:rows
    for j=1:cols
        r = rand;
        auxu = nonzeros(posup(j, :));
        auxd = nonzeros(posdown(j, :));
        if(r < m_ratio)
            if(isempty(auxu) == 0 && isempty(auxd) == 0)    
                rp = randi([1 length(auxu)], 1, 1);
                rd = randi([1 length(auxd)], 1, 1);
                crom(i, j) = auxu(rp);
                crom(i+1, j) = auxd(rd);
            elseif(isempty(auxu) == 0 && isempty(auxd) == 1)
                rp = randi([1 length(auxu)], 1, 1);
                crom(i, j) = auxu(rp);
                crom(i+1, j) = 1;
            elseif(isempty(auxu) == 1 && isempty(auxd) == 0)
                rd = randi([1 length(auxd)], 1, 1);
                crom(i, j) = 1;
                crom(i+1, j) = auxd(rd);
            else
                %ver se tem bugs aqui
                crom(i, j) = 1;
                crom(i+1, j) = 1;
            end            
        end
        
    end
end

end
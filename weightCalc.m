function [wup, wdown] = weightCalc(cup, cdown)

[rows, cols] = size(cup);
cdown = cdown.';

wup = cup;
wdown = cdown;

for i=1:rows
    for j=1:cols
        if(cup(i,j) > 0)
%             a = wup(i,j)*e+06
            wup(i,j) = 1/(10e+6*wup(i,j));
        end
        
        if(cdown(i,j) > 0)
            wdown(i,j) = 1/(10e+6*wdown(i,j));
        end
    end
end

end
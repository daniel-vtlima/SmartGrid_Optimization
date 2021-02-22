function [rup, rdown] = delayCalc(pop, wup, wdown, dataQt, jumpCost)

[rows, cols] = size(pop);
wu = [];
wd = [];
auxu = [];
auxd = [];
delayup = [];
delaydown = [];

auxTot = [];
delayTot = [];
delayAll = [];

rup = [];
rdown = [];

for i=1:2:rows
    for j=1:cols
        wu = [wu, wup(j+12, pop(i,j))];
        wd = [wd, wup(j, pop(i+1,j))];
    end
    auxu = [auxu; wu];
    auxd = [auxd; wd];
    wu = [];
    wd = [];
end

for i=1:length(auxu)
    for j=1:cols
        wu = [wu, auxu(i,j)*dataQt(1,j)];
        wd = [wd, auxd(i,j)*dataQt(1,j)];
    end
    delayup = [delayup; wu];
    delaydown = [delaydown; wd];
    wu = [];
    wd = [];
end

% rup = delayup;
% rdown = delaydown;
[r, c] = size(delayup);

for i=1:r
    delayAll = [delayAll; delayup(i, :); delaydown(i, :)];
end

% delayup = [];
% delaydown = [];

for i=1:2:rows
    for j=1:cols
        wu = delayAll(i, pop(i, j)) + jumpCost;        
        aux = pop(i, j);
        if(pop(i,j) == 1 || pop(i,j) == 0)
            wd = 0;
%             auxTot = [auxTot, wu+wd];
        else
            aux = aux - 1;
            wd = sumPath(pop(i+1, :), aux, delayAll(i+1, :), jumpCost);
%             wd = delayAll(i+1, aux);
%             aux = pop(i+1, aux);
            
%             aux = 0;
        end
       
        auxTot = [auxTot, wu+wd];
        
        wu = 0;
        wd = 0;
        
    end
    delayTot = [delayTot; auxTot];
    auxTot = [];
end

rtot = delayTot;
%rup = sum(delayup, 2);
%rdown = sum(delaydown, 2);
rup = rtot;
rdown = rtot;

end
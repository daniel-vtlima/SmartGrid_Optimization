function [fit] = Fitness(pop, tup, tdown, dataQt)

[rows, cols] = size(pop);

fit = [];

auxn = [];
nplc = 12;
nplcu = [];
%nplcu = zeros(rows, 1);

for i=1:rows
    [auxn, ~] = hist(pop(i, :), unique(pop(i, :)));
    nplcu = [nplcu; length(auxn)]; 
%     for j=1:cols
%         if(pop(i,j) > 0)
%             nplcu(i) = nplcu(i) + 1;
%         end
%     end
end

aux = [];
auxu = [];
auxd = [];
eud = [];
%ed = [];

for i=1:rows
    aux = [aux; (nplc-nplcu(i))/nplc];
% end
% for i=1:length(tup)
end

for i=1:length(tup);
    for j=1:cols
        auxu = [auxu, dataQt(3, j)/tup(i,j)];
        auxd = [auxd, dataQt(3,j)/tdown(i,j)];
    end
    
    eud = [eud; auxu; auxd];
    %ed = [ed; auxd];
    
    auxu = [];
    auxd = [];
end

for i=1:2:rows
    fit = [fit; aux(i) + sum(eud(i, :), 2) + sum(eud(i+1, :), 2)];
end

fit(isinf(fit)|isnan(fit)) = 1;

end
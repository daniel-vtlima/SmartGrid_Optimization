close all; clear all; clc;
% format long;

%AG parameters
generations = 500;
pop_size = 50;
m_ratio = 0.03;
c_ratio = 0.75;
n = 30;

jumpCost = 0.00007;
limit = 3;
count = 0;

pop = [];
best = [];
evolution =[];
newpop =[];
dist = [];
a = [];
ra = [];

ebest = [];
eevolution = [];
edist = [];


%Problem Parameters
ap = 650;
ieds = [632 645 646 633 634 671 684 611 652 680 692 675];
r = 1:11;
cup = load('matrizUP.txt');
cdown = load('matrizDOWN.txt');

dataQt = [321 1665 321 1665 1344 321 321 1344 1665 1344 321 1344; ...
    448 448 448 448 0 448 448 0 448 0 448 0; ...
    1 1 1 1 100 1 1 100 1 100 1 100; ...
    50 50 50 50 0 50 50 0 50 0 50 0];

[wup, wdown] = weightCalc(cup, cdown);
[~,posup, posdown] = initpop(1, wup, wdown, n);

for k=1:n
    pop = [pop; initpop(pop_size, wup, wdown, k)];
    [rup, rdown] = delayCalc(pop, wup, wdown, dataQt, jumpCost);
    ra = [ra; rup];
    fit = Fitness(pop, rup, rdown, dataQt);
    
    best = [best; best_crom(pop, fit)];
    evolution = [evolution; fit];
    dist = [dist, hammingDistance(pop)];
    
    for i=2:generations
        for j=1:pop_size
            c1 = Selection(pop, fit);
            c2 = Selection(pop, fit);

            crom = crossover(c1, c2, c_ratio);
            crom = mutation(crom, wup, wdown, posdown, posup, m_ratio);
            
            newpop = [newpop; crom];
        end
        
        [rup, rdown] = delayCalc(newpop, wup, wdown, dataQt, jumpCost);
        newfit = Fitness(newpop, rup, rdown, dataQt);
        %[newpop, newfit] = elitism(pop, fit, newfit, newpop, n);
        [newpop, newfit] = elitism2(pop, fit, newfit, newpop);
        
        pop = newpop;
        fit = newfit;
        
        dist = [dist, hammingDistance(pop)];
        best = [best; best_crom(pop, fit)];
        evolution = [evolution, fit];
        
%         if(dist(i) >= limit)
%             m_ratio = .4;
%             count = count + 1;
%             
%             if(count >= 10)
%                 m_ratio = .03;
%                 count = 0;
%             end
%         end
        
        newpop = [];
        newfit = [];
    end
    
    edist = [edist, dist];
    [erup, erdown] = delayCalc(best, wup, wdown, dataQt, jumpCost);
    ebest = [ebest, Fitness(best, erup, erdown, dataQt)];
    a = [a; best];
    eevolution = [eevolution; mean(evolution)];
    
    best = [];
    fit = [];
    evolution = [];
    pop = [];
    dist = [];
    rup = [];
    rdown = [];
end

a;

aux = mean(ebest,2); 
mean_g = mean(eevolution);
distm = mean(edist);
d = delayCalc(a, wup, wdown, dataQt, jumpCost);
dp = mean(d);
rd = mean(ra);

grid on;
plot(mean_g, 'r', 'LineWidth', 2);
hold on;
plot(aux, 'b', 'LineWidth', 2);
legend({'Fitness Medio de cada Geracao','Melhor Fitness de cada Geracao'}, 'FontSize', 22);
legend('boxoff');
xlabel('GERACOES', 'FontSize', 24);
ylabel('FITNESS', 'FontSize', 24);
hold off;
grid off;

figure;
dp = dp.';
rd = rd.';
[m, n] = size(rd);%
x = 1:m;
b = [dp, rd];
bar(x,b, 0.8);
xlabel('IEDS','FontSize', 24);
ylabel('ATRASO', 'FontSize', 24);

% label1 = {'0.0826'; '0.0830';...
%     '0.0824'; '0.0978'; ...
%     '0.0743'; '0.1195'; ...
%     '0.2268'; '0.1509'; ...
%     '0.1612'; '0.1490'; ...
%     '0.2289'; '0.2289'};
% label2 = {'0.7273'; '0.6681'; ...
%     '0.6600'; '0.6122'; ...
%     '0.6227'; '0.7832'; ...
%     '0.8994'; '0.9080'; ...
%     '0.9127'; '0.8928'; ...
%     '0.9316'; '0.9316'};

% text(x,b(:,1),label1,'VerticalAlignment','bottom','HorizontalAlignment','right');
% text(x,b(:,2),label2,'VerticalAlignment','bottom','HorizontalAlignment','left');

figure;
plot(distm);
legend({'Dist�ncia de Hamming'});
xlabel('Gera��es');
ylabel('Dist�ncia de Hamming');
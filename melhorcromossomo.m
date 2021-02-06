function mc= melhorcromossomo(pop, ni, nf, ncd)

maior= aptidao(pop{1},ni, nf, ncd);
mc = pop{1};

for i=2:length(pop)

    a= aptidao(pop{i}, ni, nf, ncd);
   
    if (a > maior);
        maior = a;
        mc = pop{i};
    end
end

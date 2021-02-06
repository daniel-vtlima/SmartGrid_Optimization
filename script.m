function script(geracoes)

%geracoes=300;% número de gerações
ni=4; %número de casas inteiras
nf=10; %números de casas fracionárias
ncd=2; %números de casas decimais
tx=1/30; %taxa de probabilidade
n=6; %número de indivíduos de cada geração
cmc= 1; %contador do melhor cromossomo
%mc= melhor cromossomo



pop=gerarpop(n, ni, nf, ncd);
mc{cmc}=melhorcromossomo(pop,ni,nf,ncd);
cmc=cmc+1;

for j=2:geracoes
    for i= 1: n-1
        y1=selecionacromossomo(pop,ni,nf,ncd);
        y2=selecionacromossomo(pop,ni,nf,ncd);
        
        y3 = crossover(y1,y2,ni,nf);
        mt=mutacao(y3,tx,ni,nf,ncd);
        novapop{i}=mt;
        
    end
    novapop{n} = melhorcromossomo(pop,ni,nf,ncd);
    
    mc{cmc}=melhorcromossomo(novapop,ni,nf,ncd);
    cmc=cmc+1;
    
    pop = novapop;
end

for i=1:geracoes
  fprintf('Aptidão do melhor cromossomo da %dº geração: \n',i)
    aptidao (mc{i},ni,nf,ncd)
  evolucao(i)=aptidao(mc{i},ni,nf,ncd);
end

plot (evolucao)


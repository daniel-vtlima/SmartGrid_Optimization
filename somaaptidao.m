function s = somaaptidao(pop,ni,nf,ncd)
s = 0;
n=length(pop);
for i=1:n
    s = s +  aptidao(pop{i},ni,nf,ncd);
end
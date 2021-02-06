function pop=gerarpop(n, ni, nf, ncd)

a=0;
b=7;

for i=1:n
    
x = a+(b-a)*rand;
c= gerarcromossomo(x, ni,nf, ncd);
pop{i}= c;

end
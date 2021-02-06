function mt = mutacao(c,tx,ni,nf,ncd)
z = rand;

if (z<=tx)
    a = 1;
    b = length(c);
    pm = round(a + (b-a) * rand);
    
    if pm==1
        c(pm)=0;
    else
        c(pm)=1;
    end
end
mt = c;


x=lercromossomo(mt,ni,nf,ncd);

if x<0
    mt=gerarcromossomo(0,ni,nf,ncd);
end
if x>8
    mt=gerarcromossomo(8,ni,nf,ncd);
end



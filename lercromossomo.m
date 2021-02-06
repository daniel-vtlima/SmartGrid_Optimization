function x= lercromossomo(c,ni,nf, ncd)

csinal= c(1);

for i= 1:ni;
    cint(i) = c(i+1);
end

xint=bin2decx(cint);


for i= ni:nf;
    cfrac(i) = c(i+ni+1);
end

xfrac=bin2decx(cfrac);

x = xint+xfrac/(10^ncd);

if (csinal == 1)
    x = x*-1;
end






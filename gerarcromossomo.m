function c=gerarcromossomo(x,ni,nf,ncd)
if(x < 0);
    c(1)=1;
    x=x*-1;
else
    c(1)=0;
end
xint= floor(x);
cint=dec2binx(xint);

if (length(cint) > ni)
fprintf('Número de bits não suportado.')
c = zeros(1,ni+nf+1); %função zeros.
return;
end

n=length(cint);

for i = 2:ni+1-n;
    c(i)= 0;
end

j = 1;
for i = ni+1-n + 1:ni+1;
    c(i)=cint(j);
    j = j+1; 
end

xfrac= floor((x-floor(x))*10^ncd);
cfrac=dec2binx(xfrac);

if (length(cfrac) > nf)
fprintf('Número de bits não suportado.')
c = zeros(1,ni+nf+1); %função zeros.
return;
end

m=length(cfrac);

for i = ni+2:ni+nf+1-m;
    c(i)= 0;
end

j = 1;
for i = ni+nf+1-m + 1:ni+nf+1;
    c(i)=cfrac(j);
    j = j+1;
end  
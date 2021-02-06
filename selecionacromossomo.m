function y=selecionacromossomo (sel,ni,nf,ncd)
at=somaaptidao(sel,ni, nf, ncd);
a=0;
b= at;
n = length(sel);
z = a + (b - a) * rand;
ac=0;
for i=1:n
  if z<=aptidao(sel{i},ni,nf,ncd)+ac
    y=sel{i};
    break;
  else
      ac=ac + aptidao(sel{i},ni,nf,ncd);
  end
end
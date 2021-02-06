%função para tranformar números fracionários em binários.
function bin=dec2binx(x)
i = 1 ;
y=x;

while(y > 1);
  r=mod(y,2);
  y=floor(y/2);
  v(i)=r;
  i=i+1;
end
v(i)=y;
y = length (v);
for i=1:length(v)
    bin(y)=v(i);
    y=y-1;
end

    
    



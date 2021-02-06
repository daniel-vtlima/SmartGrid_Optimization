function y = bin2decx(x)
y=0;
n=length(x);
for i= 1 :n ;    
        y = y + x(n-i+1)*2^(i-1);
end

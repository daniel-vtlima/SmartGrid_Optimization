function dec10binx(x)
i = 1;
y = x;
n = length(y);
while(y>1);
    w = mod(x, 2);
    y = floor (x/2);
    v(i) = w;
    i = i +1;
end

v(i) = x;

v;


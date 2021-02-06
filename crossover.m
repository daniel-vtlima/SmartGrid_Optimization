function c3= crossover(c1,c2, ni, nf)
a= 1;
b= ni + nf;
pc = round(a+(b-a)*rand);
z = rand;

if z < 0.5 
    
    for i = 1: pc;
    c3(i)= c1(i);
    end 
    
    for i = pc+1: ni + nf + 1;
    c3(i)= c2(i);
    end
    
else
    for i = 1: pc;
    c3(i)= c2(i);
    end 
    
    for i = pc+1: ni+nf+1;
    c3(i)= c1(i);
    end
    
end

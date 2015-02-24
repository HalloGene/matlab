function u = seq_sin(x)
u = 0;
fact = -1;
for i=1:10 
    if (i > 1)  
        fact = fact*2*(i-1);
    end
    fact = -1 * fact*(2*(i-1) + 1);
    u = u + x.^(2*(i-1) + 1)/fact; 
end
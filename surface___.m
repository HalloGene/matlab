[x, mu] = meshgrid(-5:0.125:10, 0.125:0.0125:1);
y1 = zeros(size(x, 1), size(mu, 2));
y2 = zeros(size(x, 1), size(mu, 2));
s = 0.5;


for i=2:size(x, 1)
    for j=1:size(mu, 2)
    l = x(i,j) - sqrt(-2*(s^2)*log(mu(i,j)));
    r = x(i,j) + sqrt(-2*(s^2)*log(mu(i,j)));
    
    %l_ = x(i-1,j) - sqrt(-2*(s^2)*log(mu(i-1,j)));
    %r_ = x(i-1,j) + sqrt(-2*(s^2)*log(mu(i-1,j)));        
    
    %x_ = 0.125;
    
    funcL = sin(l); %(sign(l)-sign(l_))/x_;
    funcR = sin(r);%(sign(r)-sign(r_))/x_;  
    
    if (i == 2) 
        prevFuncL = funcL;
        prevFuncR = funcR;
        if (prevFuncL > funcL)
            dirL = 1;
        else 
            dirL = -1;
        end
        
        if (prevFuncR > funcR)
            dirR = -1;
        else 
            dirR = 1;
        end
        
        if (dirL == 1 && dirR == -1) 
            dirR = 1;
        end
        if (dirL == -1 && dirR == 1) 
            dirL = 1;
        end    
    end
    
     if (i > 2)
        if (prevFuncL > funcL) 
            if (dirL == 1)
                y1(i,j) = funcL;                
            else
                y1(i,j) = prevFuncL;
                dirL = -1*dirL;
            end
        else 
            if (dirL == -1)
                y1(i,j) = funcL;                
            else
                y1(i,j) = prevFuncL;
                dirL = -1*dirL;
            end
        end
        
        if (prevFuncR < funcR) 
            if (dirR == 1)
                y2(i,j) = funcR;                
            else
                y2(i,j) = prevFuncR;
                dirR = -1*dirR;
            end
        else 
            if (dirR == -1)
                y2(i,j) = funcR;                
            else
                y2(i,j) = prevFuncR;
                dirR = -1*dirR;
            end
        end
     else
        y1(i,j) = funcL;
        y2(i,j) = funcR;
     end
     
     
        prevFuncL = y1(i,j);
        prevFuncR = y2(i,j);
    end
end
surf(x, y1, mu);
hold on;
surf(x, y2, mu);
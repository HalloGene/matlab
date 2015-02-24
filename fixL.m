function u = fixL(source)

len = length(source);
u = source;
if (source(len - 1) <= source(len))
    dir = 1;
else 
    dir = -1;
end

curvePointIndex = len;

if dir == -1
    for i=len:-1:2
        if (u(i) > u(i-1)) 
            if (dir == 1) 
                curvePointIndex = i;
                dir = -1 * dir;                        
            end
            u(i-1) = u(i-1) - dir * 2 * abs(source(curvePointIndex) - source(i-1));
        else
            if (dir == -1) 
                curvePointIndex = i;
                dir = -1 * dir;        
            end 
        end
    end
else
    for i=len:-1:2
        if (u(i) < u(i-1)) 
            if (dir == 1) 
                curvePointIndex = i;
                dir = -1 * dir;                        
            end
            u(i-1) = u(i-1) + dir * 2 * abs(source(curvePointIndex) - source(i-1));
        else
            if (dir == -1) 
                curvePointIndex = i;
                dir = -1 * dir;        
            end 
        end
    end    
end
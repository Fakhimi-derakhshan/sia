function  out = X_log_X_Y (x,y)

k = max(size(x));

for i=1:k

if x(i) == 0 
    
    out(i) = 0;
    
else
    
    out(i) = x(i) * log (x(i)/y(i));
    
end

end
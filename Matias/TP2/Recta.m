function y = Recta(w,x)
    
    y = zeros(1, length(x));

    for i = 1:length(y);
        y(i) = (-x(i)*w(1) - w(3))/w(2);
    end
        
end
function energia = CalcularEnergia(s)

    energia = 0;
    N = length(s);
    for i = 1:N
    
        if i == 1        
            energia = energia + s(i) * (s(end) + s(i+1));
        elseif i == N
            energia = energia + s(i) * (s(i-1) + s(1));
        else
            energia = energia + s(i) * (s(i-1) + s(i+1));
        end
        
    end
    
    energia = energia * -1/2;

end
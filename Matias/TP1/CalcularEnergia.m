function energia = CalcularEnergia(s)

    energia = 0;
    [fil, col] = size(s);
    
    for i = 1:fil
        for j = 1:col
            
            adyacentes = PosicionesAdyacentesBidimencional(s, i, j);
            suma = SumarAdyacentes(s, i, j, adyacentes);
            energia = energia + s(i,j) * suma;
            
        end
    
    end
        
    energia = energia * -1;
    
end
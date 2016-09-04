function resultado = EsEstable(W, patrones)
    
    numero_patrones = size(patrones);
    numero_patrones = numero_patrones(2); % cada columna es un patron

    resultado = zeros(1, numero_patrones);
    
    for i = 1:numero_patrones
        
        patron = patrones(:,i);
        salida = Hopfield82(W, patron);
        resultado(i) = isequal(patron, salida);
        
    end
end
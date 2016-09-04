function salida = Hopfield82(W, entrada)
    % Procesa la entrada ingresada utilizando la matriz de pesos
    % de la red Hopfield'82 ingresada.
    
    continuar = true;
    salida = entrada;
    n = 0;
    while continuar
        salida_vieja = salida;
        for i = randperm(length(salida));
            salida(i) = sign(W(i,:) * salida);
        end
        
        if isequal(salida_vieja, salida)
            continuar = false;
        end
    end
    
end
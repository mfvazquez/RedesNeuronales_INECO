function salida = Hopfield82(W, entrada)
    % Procesa la entrada ingresada utilizando la matriz de pesos
    % de la red Hopfield'82 ingresada.
    
    continuar = true;
    salida = entrada;
    while continuar
        salida_vieja = salida;
        subindices = randperm(length(salida));
        for i = 1:length(subindices);
            salida(subindices(i)) = SignoNeuronal(W(subindices(i),:) * salida);
        end
        
        if isequal(salida_vieja, salida)
            continuar = false;
        end
    end
%     salida = sign(W*entrada); sincronico
    
end
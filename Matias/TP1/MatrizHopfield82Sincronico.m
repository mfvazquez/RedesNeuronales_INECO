function resultado = MatrizHopfield82Sincronico(W, matriz)
    % aplica la red Hopfield82 a cada columna de la matriz ingresada.
    % Devuelve el resultado en forma de matriz.
    
    entradas = size(matriz);
    entradas = entradas(2);
    
    resultado = zeros(size(matriz));
    for i = 1:entradas
        
       resultado(:,i) = Hopfield82Sincronico(W, matriz(:,i));
        
    end
    
end
    
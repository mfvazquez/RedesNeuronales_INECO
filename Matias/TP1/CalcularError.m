function error = CalcularError(patrones, resultado)
    % Calcula el error entre la matriz de patrones y la matriz
    % del resultado de aplicar la red Hopfield82 a la matriz de patrones.
    
    dimension = size(patrones);
    N = dimension(1); % cantidad de neuronas
    p = dimension(2); % cantidad de patrones

    error = 0;
    
    for x = 1:N
        
       for y = 1:p
           
          error = error + norm(patrones(x,y) - resultado(x,y)) / 2;
           
       end
        
    end
    
    error = error / (N*p);
    
end
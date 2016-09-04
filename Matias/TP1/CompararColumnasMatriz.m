function resultado = CompararColumnasMatriz(primera, segunda)
    % Compara las columnas de las matrices ingresadsa.
    % El resultado es un vector cuyo subindice corresponde a cada columna.
    % Si las columnas son iguales valdrá 1, si son distintas será 0.
    % Precondiciones: las matrices deben tener las mismas dimensiones.

    columnas = size(primera);
    columnas = columnas(2);
    resultado = zeros(1, columnas);
    
    for i = 1:columnas
        
        resultado(i) = isequal(primera(:,i), segunda(:,i));
    
    end
        
end
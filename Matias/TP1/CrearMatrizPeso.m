function W = CrearMatrizPeso(patrones)
    % Crea la matriz de pesos de los patrones ingresados.
    % Precondiciones: La matriz de patrones debe contener los patrones
    %                 en sus columnas.
    
    dimensiones = size(patrones);
    numero_elementos = dimensiones(1);
    numero_patrones = dimensiones(2);
    
    W = zeros(numero_elementos, numero_elementos);

    for i = 1:numero_patrones
       W = W + patrones(:,i) * patrones(:,i)' - eye(numero_elementos);
    end

    W = W./(numero_elementos^2);
    
end
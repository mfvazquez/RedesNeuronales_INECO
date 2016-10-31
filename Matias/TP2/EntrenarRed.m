function red = EntrenarRed(red, aprendizaje, Beta, entradas, resultados)
    % Entrena la red utilizando el algoritmo de Backpropagation
    
    [fil, ~] = size(entradas);
    
    for i = 1:fil
        entrada = entradas(i,:);
        resultado = resultados(i,:);
        [mapa_salidas, mapa_errores] = ObtenerErrores(red, Beta, entrada, resultado);
        red = CorregirRed(red, aprendizaje, mapa_salidas, mapa_errores, entrada);
    end
    
end
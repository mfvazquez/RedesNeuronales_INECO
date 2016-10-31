function resultados = ResultadosXOR(entradas)

    cantidad_entradas = size(entradas,1);
    resultados = zeros(cantidad_entradas, 1);

    for x = 1:cantidad_entradas
       
        entrada = entradas(x,:);
        salida = entrada(entrada == 1);
        salida = length(salida);
        salida = mod(salida,2);
        if salida == 0
            salida = -1;
        end
        
        resultados(x) = salida;
        
    end

end
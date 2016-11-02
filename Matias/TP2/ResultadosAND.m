function resultados = ResultadosAND(entradas)

    cantidad_entradas = size(entradas,1);
    resultados = zeros(cantidad_entradas, 1);

    for x = 1:cantidad_entradas
       
        entrada = entradas(x,:);
        salida = entrada(entrada == 1);
        salida = length(salida);
        if salida == length(entrada)
            salida = 1;
        else
            salida = -1;
        end
        resultados(x) = salida;
        
    end    

end
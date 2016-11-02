function salidas = ResultadosFuncionEj3(entradas)

    salidas = zeros(size(entradas,1), 1);

    for i = 1:size(entradas, 1)
        entrada = entradas(i, :);
        x = entrada(1);
        y = entrada(2);
        z = entrada(3);
        salidas(i) = (1/3) * (sin(x) + cos(y) + z);
        
    end

end
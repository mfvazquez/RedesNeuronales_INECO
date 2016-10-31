function mapa_de_salidas = ObtenerMapaDeSalidas(red, entrada, Beta)

    mapa_de_salidas = cell(length(red),1);

    for i = 1:length(red)
        mapa_de_salidas{i} = zeros(length(red{i}),1);
        capa = red{i};
        
        if i == 1
            salida_anterior = entrada;
        end
        salida_capa = zeros(1,length(capa));

        for j = 1:length(capa)
            pesos = capa{j};            
            
            [salida, ~] = Perceptron(pesos, salida_anterior, Beta);
            mapa_de_salidas{i}(j) = salida;
            
            salida_capa(j) = salida;
        end
        salida_anterior = salida_capa;
    end

end
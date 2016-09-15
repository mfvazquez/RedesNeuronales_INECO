function matriz = SignoNeuronalMatriz(matriz)

    [filas, columnas] = size(matriz);
    for x = 1:filas
        for y = 1:columnas
            matriz(x,y) = SignoNeuronal(matriz(x,y));
        end
    end
end
%% EJERCICIO 4

clear all
Width = 44;
Height = 42;

patrones = ObtenerPatrones('patrones', 'bmp');
W = CrearMatrizPeso(patrones);

%% PATRONES INVERTIDOS
patrones_invertidos = patrones.*-1;
estabilidad = EsEstable(W,patrones_invertidos);

pruebas = {patrones patrones_invertidos};

for i = 1:length(pruebas)
    p = pruebas{i};
    [~, numero_patrones] = size(p);
    for j = 1:numero_patrones
        posicion = i + (j-1)*length(pruebas);
        imshow(reshape(p(:,j), Height, Width))
    end
end

if all(estabilidad) == 1
    display 'Es estable con patrones inversos';
else
    display 'No es estable con patrones inversos';
end

%% SUMA DE PATRONES

operaciones = de2bi(0:7)*2-1;
[N, ~] = size(patrones);
num_operaciones = 8;
patrones_sumados = zeros(N, num_operaciones);

for i = 1:num_operaciones

    patrones_sumados(:,i) = SumarColumnas(patrones, operaciones(i,:));
    patrones_sumados = SignoNeuronalMatriz(patrones_sumados);
    figure
    imshow(reshape(patrones_sumados(:,i), Height, Width))

end

estabilidad = EsEstable(W,patrones_sumados);

if all(estabilidad) == 1
    display 'Es estable ante suma de patrones';
else
    display 'No es estable ante suma de patrones';
end

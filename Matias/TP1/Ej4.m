%% EJERCICIO 4

clear all

patrones = ObtenerPatrones('patrones', 'bmp');
W = CrearMatrizPeso(patrones);

% PATRONES INVERTIDOS
patrones_invertidos = patrones.*-1;
estabilidad = EsEstable(W,patrones_invertidos);

figure
imshow(reshape(patrones_invertidos(:,1), 42, 44));
figure
imshow(reshape(patrones_invertidos(:,2), 42, 44));
figure
imshow(reshape(patrones_invertidos(:,3), 42, 44));


if all(estabilidad) == 1
    display 'Es estable con patrones inversos';
else
    display 'No es estable con patrones inversos';
end

% SUMA DE PATRONES

operaciones = de2bi(0:7)*2-1;

patrones_sumados = SumarColumnas(patrones);
patrones_sumados = SignoNeuronalMatriz(patrones_sumados);

estabilidad = EsEstable(W,patrones_sumados);
if all(estabilidad) == 1
    display 'Es estable';
else
    display 'No es estable';
end

figure
imshow(reshape(patrones_sumados, 42, 44));

% hacerlo con cada operacion de las filas de operaciones
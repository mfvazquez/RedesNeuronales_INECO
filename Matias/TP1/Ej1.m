%% EJERCICIO 1

clear all
Width = 44;
Height = 42;

patrones = ObtenerPatrones('patrones', 'bmp');
W = CrearMatrizPeso(patrones);
estabilidad = EsEstable(W,patrones);

if all(estabilidad) == 1
    display 'Es estable con los patrones';
else
    display 'No es estable con los patrones';
end

patrones_ruido = AgregarRuido(patrones);
resultado_ruido = MatrizHopfield82(W, patrones_ruido);
estabilidad_ruido = CompararColumnasMatriz(resultado_ruido, patrones);


if all(estabilidad_ruido) == 1
    display 'Es estable frente a ruido';
else
    display 'No es estable frente a ruido';
end

patrones_modificados = ObtenerPatrones('patrones_modificados', 'bmp');
resultado_modificados = MatrizHopfield82(W, patrones_modificados);
estabilidad_modificados = CompararColumnasMatriz(resultado_modificados, patrones);

if all(estabilidad_modificados) == 1
    display 'Es estable frente a modificaciones';
else
    display 'No es estable frente a modificaciones';
end

pruebas = {patrones patrones_ruido patrones_modificados};

for i = 1:length(pruebas)
    p = pruebas{i};
    [~, numero_patrones] = size(p);
    for j = 1:numero_patrones
        posicion = i + (j-1)*numero_patrones; 
        subplot(numero_patrones,length(pruebas),posicion), imshow(reshape(p(:,j), Height, Width))
    end
end
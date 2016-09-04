clear all

%% EJERCICIO 1

patrones = ObtenerPatrones('patrones', 'bmp');
W = CrearMatrizPeso(patrones);
estabilidad = EsEstable(W,patrones);

if all(estabilidad) == 1
    display 'Es estable';
else
    display 'No es estable';
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

%% EJERCICIO 2




% % % % Crear matriz de patrones P = sgn(randn(N,p))
% % % % ir aumentando la cantidad de patrones hasta obtener un error mayor al de la tabla.+
% % % % e ir guardando el pmax.
% % % % Despues lo mismo pero aumentando N.

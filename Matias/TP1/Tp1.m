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

errores_referencia = [0.001 0.0036 0.01 0.05 0.1];
p_max = zeros(1, length(errores_referencia));
error_obtenido = zeros(1, length(errores_referencia));
N = 100:100:1000;
for i = 1:length(errores_referencia)
    for j = 1:length(N)
        p = 1;
        continuar = true;
        while continuar
            patrones = sign(randn(N(j), p));
            W = CrearMatrizPeso(patrones);
            resultado = MatrizHopfield82(W,patrones);
            error = CalcularError(patrones, resultado);

            if error >= errores_referencia(i)
                continuar = false;
                error_obtenido(i) = error;
                p_max(i) = p;
            end
            p = p+1;
        end
    end
end
    
%%% Para dibujar imagen imshow(reshape(p(:,1), 10, 10))

% % % % Crear matriz de patrones P = sgn(randn(N,p))
% % % % ir aumentando la cantidad de patrones hasta obtener un error mayor al de la tabla.+
% % % % e ir guardando el pmax.
% % % % Despues lo mismo pero aumentando N.

%% EJERCICIO 3

p = 11;
N = 200;
patrones = sign(randn(N, p));
W_original = CrearMatrizPeso(patrones);

desconexiones = 0.1:0.05:1;
errores = zeros(length(desconexiones),1);
vec_i = zeros(length(desconexiones),1);

for i = 1:length(desconexiones)
    
    A = rand(N);
    B = A>desconexiones(i);
    W = B.*W_original;
    resultado = MatrizHopfield82(W,patrones);
    error = CalcularError(patrones, resultado);
    errores(i) = error;
    vec_i(i) = desconexiones(i);

end

stem(vec_i, errores)

%% EJERCICIO 4

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

%% elijo una cantidad X de cambios arbitraria, y cada X cambios
%  modifico la temperatura.
% Esto es analogo a empezar con un material que esta caliente y que
% va disminuyendo la temperatura, y la cantidad de pasos define la
% velocidad a la que disminuye la temperatura.

N = 100;
% UNIDIMENCIONAL 
dimension = 1;
s = SignoNeuronalMatriz(randn(N, dimension));
subindice = round(rand*N + 1);

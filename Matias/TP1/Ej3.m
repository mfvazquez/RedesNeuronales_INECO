%% EJERCICIO 3

clear all

p = 11;
N = 200;
patrones = sign(randn(N, p));
W_original = CrearMatrizPeso(patrones);

desconexiones = 0.1:0.1:1;
errores = zeros(length(desconexiones),1);

parfor i = 1:length(desconexiones)
    
    A = rand(N);
    B = A>desconexiones(i);
    W = B.*W_original;
    resultado = MatrizHopfield82(W,patrones);
    error = CalcularError(patrones, resultado);
    errores(i) = error;

end

stem(desconexiones, errores)

save('ResultadosEj3');
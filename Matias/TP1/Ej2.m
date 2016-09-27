%% EJERCICIO 2

clear all

errores_referencia = [0.001 0.0036 0.01 0.05 0.1];
N = 100:100:1000;
cantidad_pruebas = length(N);
p_max = zeros(length(errores_referencia), length(N));
error_obtenido = zeros(length(errores_referencia), length(N));
parfor i = 1:length(errores_referencia)
    for j = 1:cantidad_pruebas
        p = 1;
        continuar = true;
        while continuar
            patrones = sign(randn(N(j), p));
            W = CrearMatrizPeso(patrones);
            resultado = MatrizHopfield82(W,patrones);
            error = CalcularError(patrones, resultado);

            if error >= errores_referencia(i)
                continuar = false;
                error_obtenido(i,j) = error;
                p_max(i,j) = p;
            end
            p = p+1;
        end
    end
end

save('ResultadosEj2_asincronico');

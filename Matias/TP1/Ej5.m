%% EJERCICIO 5

clear all

% elijo una cantidad X de cambios arbitraria, y cada X cambios
%  modifico la temperatura.
% Esto es analogo a empezar con un material que esta caliente y que
% va disminuyendo la temperatura, y la cantidad de pasos define la
% velocidad a la que disminuye la temperatura.

N = 100;

%% UNIDIMENCIONAL 
dimension = 1;
cambios = 20;
Temperaturas = 5:-0.1:0;
s_original = SignoNeuronalMatriz(randn(N, dimension));
subindices_aleatorios = randperm(N);
M = zeros(length(Temperaturas), 1);

for j = 1:length(Temperaturas)
    s = s_original;
    contador_cambios = 0;
    subindice = 0;
    i = 1;
    while contador_cambios < cambios && i < length(subindices_aleatorios)-1

        H_inicial = CalcularEnergia(s);
        subindice = subindices_aleatorios(i);
        s(subindice) = s(subindice) * -1;
        H_final = CalcularEnergia(s);

        if H_final < H_inicial
            contador_cambios = contador_cambios + 1;
        else
            p = exp(-(H_final-H_inicial)/Temperaturas(j));
            if p < rand
                contador_cambios = contador_cambios + 1;
            else
                s(subindice) = s(subindice) * -1;
            end
        end

        i = i + 1;
    end

    M(j) = sum(s);
end

stem(Temperaturas, M);

%% BIDIMENCIONAL
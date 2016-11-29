%% EJERCICIO 5

clear all

% elijo una cantidad X de cambios arbitraria, y cada X cambios
%  modifico la temperatura.
% Esto es analogo a empezar con un material que esta caliente y que
% va disminuyendo la temperatura, y la cantidad de pasos define la
% velocidad a la que disminuye la temperatura.


%% UNIDIMENSIONAL 
N_uni = 100;
N = 100;
cambios = 20;
Temperaturas_uni = 5:-0.1:0;
s_original = SignoNeuronalMatriz(randn(N, 1));
subindices_aleatorios = randperm(N);
M_uni = zeros(length(Temperaturas_uni), 1);

s = s_original;

H_inicial = CalcularEnergia(s);

for j = 1:length(Temperaturas_uni)

    contador_cambios = 0;
    subindice = 0;
    i = 1;
    while contador_cambios < cambios && i <= length(subindices_aleatorios)

        
        subindice = subindices_aleatorios(i);
        s(subindice) = s(subindice) * -1;
        H_final = CalcularEnergia(s);

        if H_final < H_inicial
            contador_cambios = contador_cambios + 1;
            H_inicial = H_final;
        else
            p = exp(-(H_final-H_inicial)/Temperaturas_uni(j));
            if rand < p
                H_inicial = H_final;
                contador_cambios = contador_cambios + 1;
            else
                s(subindice) = s(subindice) * -1;
            end
        end

        i = i + 1;
    end

    M_uni(j) = sum(s);
end

figure
stem(Temperaturas_uni, M_uni);

%% BIDIMENSIONAL

N = 10;
N_bi = 10;
cambios = 400;
Temperaturas_bi = 5:-0.05:0;
s_original = SignoNeuronalMatriz(randn(N, N));
M_bi = zeros(length(Temperaturas_bi), 1);
s = s_original;
H_inicial = CalcularEnergia(s);

for j = 1:length(Temperaturas_bi)
%     subindices_aleatorios = randperm(N^2);
%     contador_cambios = 0;
%     subindice = 0;
%     i = 1;
%     while contador_cambios < cambios && i <= length(subindices_aleatorios)
    for i = 1:cambios
        
        subindice = floor(rand*(N^2)+1);
        s(subindice) = s(subindice) * -1;
        H_final = CalcularEnergia(s);

        if H_final < H_inicial
%             contador_cambios = contador_cambios + 1;
            H_inicial = H_final;
        else
            p = exp(-(H_final-H_inicial)/Temperaturas_bi(j));
            if rand < p
%                 contador_cambios = contador_cambios + 1;
                H_inicial = H_final;
            else
                s(subindice) = s(subindice) * -1;
            end
        end

%         i = i + 1;
    end

    M_bi(j) = sum(sum(s));
end

figure
stem(Temperaturas_bi, M_bi);

save('ResultadosEj5');
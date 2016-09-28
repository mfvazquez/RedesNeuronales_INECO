%% EJERCICIO 5

clear all

N = 10;

%% BIDIMENSIONAL


cambios = 20;
Temperaturas = 5:-1:0;
s_original = SignoNeuronalMatriz(randn(N, N));
M_bi = zeros(length(Temperaturas), 1);

s = s_original;

for j = 1:length(Temperaturas)
%     s = s_original;
%     subindices_aleatorios = randperm(N^2);
    contador_cambios = 0;
%     subindice = 0;
%     i = 1;
    while contador_cambios < cambios

        H_inicial = CalcularEnergia(s);
        subindice = floor(rand*(N^2)+1);
        s(subindice) = s(subindice) * -1;
        H_final = CalcularEnergia(s);

        if H_final < H_inicial
            contador_cambios = contador_cambios + 1;
        else
            p = exp(-(H_final-H_inicial)/Temperaturas(j));
            a = rand;
            if a < p
                contador_cambios = contador_cambios + 1;
            else
                s(subindice) = s(subindice) * -1;
            end
        end

%         i = i + 1;
    end

%     b = length(s);
%     for i = 1:b^2
%     
%         if s(i) < 0
%             s(i) = s(i) * -1;
%         end
%     end
        
    M_bi(j) = sum(sum(s));
end

figure
stem(Temperaturas, M_bi);

save('ResultadosEj5_V2');

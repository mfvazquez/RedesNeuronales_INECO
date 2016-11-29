clear all

%% EJERCICIO 3

load('ResultadosEj3.mat');
figure
stem(desconexiones, errores)


%% EJERCICIO 5

clear all


load('ResultadosEj5_FINALV2.mat');

figure
stem(Temperaturas_uni, M_uni);
title('Modelo de Ising en una dimensiones');
xlabel('T');
ylabel('M');

figure
stem(Temperaturas_bi, M_bi);
title('Modelo de Ising en dos dimensiones');
xlabel('T');
ylabel('M');
%% EJERCICIO 5

clear all

% elijo una cantidad X de cambios arbitraria, y cada X cambios
%  modifico la temperatura.
% Esto es analogo a empezar con un material que esta caliente y que
% va disminuyendo la temperatura, y la cantidad de pasos define la
% velocidad a la que disminuye la temperatura.

N = 100;
% UNIDIMENCIONAL 
dimension = 1;
s = SignoNeuronalMatriz(randn(N, dimension));
subindice = round(rand*N + 1);

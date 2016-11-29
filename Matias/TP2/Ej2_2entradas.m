%% EJ 2 - 2 entradas

clear all
clc

entradas = [1 1; -1 -1; 1 -1; -1 1]; % entrada
resultados = [-1; -1; 1; 1]; % resultado
aprendizaje = 0.01;
Beta = 3;
tolerancia = 0.01;

estructura = [size(entradas, 2) 10 1];

red = CrearRed(estructura);
[red, errores] = EntrenarRedECM(red, aprendizaje, Beta, entradas, resultados, tolerancia);
% iteraciones = length(errores)

figure(1)
plot(1:length(errores), errores);
xlabel('iteraciones');
ylabel('ECM');


DibujarElementos(entradas, resultados, 2);
for x = 1:length(red{1})
    DibujarPerceptron(red{1}{x}, 2);
end

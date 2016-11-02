%% Ej 2 - 4 entradas

entradas = de2bi(0:15); % entrada
entradas(entradas == 0) = -1;
resultados = ResultadosXOR(entradas); % resultado
aprendizaje = 0.01;
Beta = 3;
tolerancia = 0.01;

estructura = [size(entradas, 2) 10 1];

red = CrearRed(estructura);
[red, errores] = EntrenarRedECM(red, aprendizaje, Beta, entradas, resultados, tolerancia);
iteraciones = length(errores)

plot(1:length(errores), errores);

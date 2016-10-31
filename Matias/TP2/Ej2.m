%% EJ 2

clear all
clc

entradas = [1 1; -1 -1; 1 -1; -1 1]; % entrada
resultados = [-1; -1; 1; 1]; % resultado
aprendizaje = 0.01;
Beta = 3;

estructura = [size(entradas, 2) 7 1];

red = CrearRed(estructura);
ecm = 1;
iteraciones = 1;
while ecm > 0.01
    iteraciones = iteraciones + 1;
    red = EntrenarRed(red, aprendizaje, Beta, entradas, resultados);
    ecm = 0;
    for i = 1:size(entradas,1)
        salida = ObtenerSalida(red, entradas(i,:), Beta);
        ecm = (resultados(i) - salida)^2 + ecm;
    end
    errores(iteraciones-1) = ecm;
end
ObtenerSalida(red, [1 1], Beta)
ObtenerSalida(red, [-1 -1], Beta)
ObtenerSalida(red, [1 -1], Beta)
ObtenerSalida(red, [-1 1], Beta)
iteraciones

plot(1:length(errores), errores);

%% 4 entradas


clear all
clc

entradas = de2bi(0:15); % entrada
entradas(entradas == 0) = -1;
resultados = ResultadosXOR(entradas); % resultado
aprendizaje = 0.01;
Beta = 3;

estructura = [size(entradas, 2) 7 1];

red = CrearRed(estructura);
ecm = 1;
iteraciones = 1;
while ecm > 0.01
    iteraciones = iteraciones + 1;
    red = EntrenarRed(red, aprendizaje, Beta, entradas, resultados);
    ecm = 0;
    for i = 1:size(entradas,1)
        salida = ObtenerSalida(red, entradas(i,:), Beta);
        ecm = (resultados(i) - salida)^2 + ecm;
    end
    errores(iteraciones-1) = ecm;
end
iteraciones
plot(1:length(errores), errores);

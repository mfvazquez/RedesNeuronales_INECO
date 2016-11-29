%% EJ 3
% Probar con betas mas chicos, 0.1

clear all;

separacion = 10;

x = linspace(0, 2*pi, separacion);
y = linspace(0, 2*pi, separacion);
z = linspace(-1, 1, separacion);

entradas = combvec(x, y, z)';
resultados = ResultadosFuncionEj3(entradas);

N = 20;
aprendizaje = 0.01;
Beta = 0.5;
estructura = [size(entradas, 2) N 1];
tolerancia = 0.001;


red = CrearRed(estructura);
[red, errores] = EntrenarRedECM(red, aprendizaje, Beta, entradas, resultados, tolerancia);
iteraciones = length(errores)

save(['Ej3' '_tol=' num2str(tolerancia) '_neuronas=' num2str(N) '_Beta=' num2str(Beta) '_aprendizaje=' num2str(aprendizaje) '.mat']);

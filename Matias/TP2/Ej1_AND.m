%% AND

% ARMAR TABLA DE VERDAD DE AND, TOMAR CASO AL AZAR Y PASARSELO AL
% PERCEPTRON. SI EL RESULTADO ES INCORRECTO HAY QUE MODIFICAR LOS PESOS 
% EN BASE AL ERROR. Y LUEGO ELEGIR OTRO CASO AL AZAR, REPETIR ESTO HASTA
% QUE NO HAYA ERROR.

clear all;

x = [1 1; -1 -1; 1 -1; -1 1]; % entrada
resultados = [1 -1 -1 -1]; % resultado
aprendizaje = 0.01;
% con este aprendizaje chiquito la recta queda pegadita a los puntos -1,1 
% y 1,-1 ya que apenas los supera los resultados seran correctos

w = PesosPerceptronSimple(aprendizaje, x, resultados);

% GRAFICO LOS RESULTADOS

DibujarPerceptron(w, 1);
DibujarElementos(x, resultados, 1);


%% PARA 4 dimensiones graficar el error cuadratico medio. 
% ver en el cuaderno de aleman la formula.

aprendizaje = 0.01;

entradas = de2bi(0:15); % entrada
entradas(entradas == 0) = -1;
resultados = ResultadosAND(entradas); % resultado

[w, ecm] = PesosPerceptronSimple(aprendizaje, entradas, resultados);

% % % for x = 1:size(entradas,1)
% % %     PerceptronSimple(w, entradas(x,:))
% % % end

figure(2);
stem(1:length(ecm), ecm);
xlabel('iteracion');
ylabel('ECM');

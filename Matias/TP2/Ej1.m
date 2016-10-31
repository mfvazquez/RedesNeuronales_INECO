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

%% GRAFICO LOS RESULTADOS

figure(1)
for i = 1:length(resultados)
    salida = PerceptronSimple(w,x(i,:));

    if salida == 1
        hold on;
        plot(x(i,1),x(i,2), '.b', 'Markersize', 40)
        hold on;
        plot(x(i,1),x(i,2), '+k', 'Markersize', 5)
    else
        hold on;
        plot(x(i,1),x(i,2), '.r', 'Markersize', 40)
        hold on;
        plot(x(i,1),x(i,2), '+k', 'Markersize', 5)
    end
end


entrada = -3:0.01:3;
salida = Recta(w,entrada);
plot(entrada, salida, '--g', 'Markersize', 5);
hold on;
plot(0,0, '+k', 'Markersize', 10);
axis([-2 2 -2 2]);


%% PARA 4 dimensiones graficar el error cuadratico medio. ver en el cuaderno de aleman la formula.
function DibujarPerceptron(pesos, fig_ref)

    figure(fig_ref)

    entrada = -3:0.01:3;
    salida = Recta(pesos, entrada);
    plot(entrada, salida, '--g', 'Markersize', 5);
    hold on;
    plot(0,0, '+k', 'Markersize', 10);
    axis([-2 2 -2 2]);


end
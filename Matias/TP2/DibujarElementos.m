function DibujarElementos(entradas, salidas, fig_ref)

    figure(fig_ref)
    for i = 1:length(salidas)
        
        if salidas(i) == 1
            hold on;
            plot(entradas(i,1),entradas(i,2), '.b', 'Markersize', 40)
            hold on;
            plot(entradas(i,1),entradas(i,2), '+k', 'Markersize', 5)
        else
            hold on;
            plot(entradas(i,1),entradas(i,2), '.r', 'Markersize', 40)
            hold on;
            plot(entradas(i,1),entradas(i,2), '+k', 'Markersize', 5)
        end
    end

end
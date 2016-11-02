function [red, errores] = EntrenarRedECM(red, aprendizaje, Beta, entradas, resultados, tolerancia)

    ecm = Inf;
    iteraciones = 1;
    errores = [];
    while ecm > tolerancia
        red = EntrenarRed(red, aprendizaje, Beta, entradas, resultados);
        ecm = 0;
        for i = 1:size(entradas,1)
            salida = ObtenerSalida(red, entradas(i,:), Beta);
            ecm = (resultados(i) - salida)^2 + ecm;
        end
        ecm = ecm / (size(entradas,1));
        errores(iteraciones) = ecm
        iteraciones = iteraciones + 1
        if iteraciones > 100 && ElementosIguales(errores, length(errores)-20, length(errores))
            break;
        end
    end

end

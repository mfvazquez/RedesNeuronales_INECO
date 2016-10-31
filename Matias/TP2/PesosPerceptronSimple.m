function w = PesosPerceptronSimple(aprendizaje, entradas, resultados)

    [fil, col] = size(entradas);    
    w_cero = ones(fil,1);
    entradas = [entradas w_cero];
    w = randn(1,col+1)'/100;
    

    continuar = true;
    while continuar
        subindices = randperm(fil);
        contador_errores = 0;

        for i = 1:length(subindices)

            sub_actual = subindices(i);
            salida_real = entradas(sub_actual,:)*w;
            salida_real = SignoNeuronal(salida_real);

            salida_deseada = resultados(sub_actual);

            error = salida_deseada - salida_real;
            if error ~= 0
                contador_errores = contador_errores + 1;
            end
            DeltaW = aprendizaje*entradas(sub_actual,:)'*error;

            w = w + DeltaW;

        end
        if contador_errores == 0
            continuar = false;
        end

    end

end

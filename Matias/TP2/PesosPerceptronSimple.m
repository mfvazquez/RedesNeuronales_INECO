function [w, ecm_iteraciones] = PesosPerceptronSimple(aprendizaje, entradas, resultados)

    [fil, col] = size(entradas);    
    w_cero = ones(fil,1);
    entradas = [entradas w_cero];
    w = randn(1,col+1)'/100;
    
    n = 1;
    continuar = true;
    while continuar
        subindices = randperm(fil);
        contador_errores = 0;

        ecm = 0;
        for i = 1:length(subindices)

            sub_actual = subindices(i);
            salida_real = entradas(sub_actual,:)*w;
            salida_real = SignoNeuronal(salida_real);

            salida_deseada = resultados(sub_actual);

            error = salida_deseada - salida_real;
            ecm = ecm + error^2;
            if error ~= 0
                contador_errores = contador_errores + 1;
            end
            DeltaW = aprendizaje*entradas(sub_actual,:)'*error;

            w = w + DeltaW;

        end
        if contador_errores == 0
            continuar = false;
        end
        
        
        ecm_iteraciones(n) = ecm;
        n = n + 1;
    end

end

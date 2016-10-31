function [mapa_salidas, mapa_errores] = ObtenerErrores(red, Beta, entrada, resultados)


    mapa_salidas = ObtenerMapaDeSalidas(red, entrada, Beta);
    mapa_errores = cell(length(red),1);
    
    for x = length(red):-1:1
        mapa_errores{x} = zeros(length(red{x}),1);
       
        for y = 1:length(red{x});

            salida = mapa_salidas{x}(y);
            
            if x == length(red)
                error = (resultados(y) - salida) * tanhDerivada(salida, Beta);
            else
                error = 0;
                for z = 1:length(red{x+1})
                    error_posterior = mapa_errores{x+1}(z);
                    peso = red{x+1}{z}(y);
                    error = error + error_posterior * peso;
                end
                error = error * tanhDerivada(salida, Beta);
                
            end
            mapa_errores{x}(y) = error;
        end
    end
    
end
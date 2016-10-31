function red = CorregirRed(red, aprendizaje, mapa_salidas, mapa_errores, entrada)
    
    for x = 1:length(red)
        for y = 1:length(red{x})
            
            if x == 1
                incremento = aprendizaje * mapa_errores{x}(y) * [entrada 1]';
            else
                incremento = aprendizaje * mapa_errores{x}(y) * [mapa_salidas{x-1}; 1];
            end
            red{x}{y} = red{x}{y} + incremento;
        end
    end

end
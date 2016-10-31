function salida = ObtenerSalida(red, entrada, Beta, num_salida)
    
    mapa = ObtenerMapaDeSalidas(red, entrada, Beta);
        
    if nargin < 4
        num_salida = 1;
    end

    salida = mapa{end}(num_salida);
    
end
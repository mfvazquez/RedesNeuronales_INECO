function suma = SumarAdyacentes(s, pos_fil, pos_col, adyacentes)

    suma = 0;
    for i = 1:length(adyacentes.fil)
        fila = adyacentes.fil(i);
        suma = suma + s(fila, pos_col);
    end
    
    for i = 1:length(adyacentes.col)
        col = adyacentes.col(i);
        suma = suma + s(pos_fil, col);
    end

end
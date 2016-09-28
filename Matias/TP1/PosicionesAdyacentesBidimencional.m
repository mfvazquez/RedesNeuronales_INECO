function adyacentes = PosicionesAdyacentesBidimencional(matriz, pos_fil, pos_col)

    [fil, col] = size(matriz);

    adyacentes.fil = [];
    adyacentes.col = [];
    
    if fil > 1   
        adyacentes.fil = PosicionesAdyacentesTruncadas(fil, pos_fil);
    end
    
    if col > 1
        adyacentes.col = PosicionesAdyacentesTruncadas(col, pos_col);
    end

end
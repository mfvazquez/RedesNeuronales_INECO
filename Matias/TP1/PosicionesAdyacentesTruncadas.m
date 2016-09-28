function adyacentes = PosicionesAdyacentesTruncadas(largo, pos)

    if pos == 1
        adyacentes = 2;
    elseif pos == largo
        adyacentes = largo-1;
    else
        adyacentes = [pos-1 pos+1];
    end
end
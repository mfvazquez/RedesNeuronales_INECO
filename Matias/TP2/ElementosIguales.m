function resultado = ElementosIguales(vector, inicio, fin)
    
    contador = 1;
    elemento = vector(inicio);
    for x = inicio+1:fin
        if vector(x) == elemento
            contador = contador + 1;
        end
    end
    resultado = false;
    if contador == (fin-inicio+1)
        resultado = true;
    end
    
end
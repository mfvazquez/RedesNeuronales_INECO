function salida = PerceptronSimple(pesos, entradas)

    entradas = [entradas 1];

    salida = entradas*pesos;
    salida = SignoNeuronal(salida);

end
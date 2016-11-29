function matriz_ruidosa = AgregarRuido(matriz)
    % Agrega ruido a la matriz ingresada.
    % Postcondiciones: La matriz resultante solo tendr� -1 o 1.
    
    matriz_ruidosa = matriz + randn(size(matriz))*100;
    matriz_ruidosa = sign(matriz_ruidosa);

end
function salida = Hopfield82Sincronico(W, entrada)
    % Procesa la entrada ingresada utilizando la matriz de pesos
    % de la red Hopfield'82 ingresada.
    
    salida = sign(W*entrada);
    
end
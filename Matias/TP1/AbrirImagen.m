function patron = AbrirImagen(direccion, formato)
    % Abre la imagen del formato indicado en la direccion indicada.
    % Luego le aplica la funcion de signo de la red Hopfield'82
    % a cada elemento del patron resultante.
    % Si la imagen es de ancho M y largo N, el patron será un vector
    % de largo N*M con valores -1 o 1.
    % Precondiciones: El archivo de la imagen debe existir.

    p = imread(direccion, formato);
    patron = p(:)*1; 
    
    patron(patron == 0) = -1;
        
end
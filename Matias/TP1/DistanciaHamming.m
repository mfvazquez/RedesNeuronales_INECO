function distancia = DistanciaHamming(primero, segundo)
    % Devuelve la distancia de Hamming entre las/los dos matrices/vectores
    % ingresados. Las matrices deben contener solo valores iguales a -1 o
    % 1.
    
    A = primero + segundo % los valores que den 0 son las diferencias
    distancia = sum(A(:)==0); % la distancia es la cantidad de 0 en la suma de todos sus valores.
end
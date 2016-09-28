function resultado = SumarColumnas(matriz, operaciones)
    % Realiza una adición de las columnas de la matriz, cada columna
    % sera multiplicada por el escalar del vector operaciones al
    % subindice correspondiente.
    % Precondiciones: La cantidad de columnas de matriz debe ser igual
    %                 al largo del vector operaciones

    
   [filas, columnas] = size(matriz);
   resultado = zeros(filas, 1);
   for i = 1:columnas
       resultado = resultado + matriz(:,i) * operaciones(i);
   end
   
end
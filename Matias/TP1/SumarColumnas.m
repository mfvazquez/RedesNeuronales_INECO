function resultado = SumarColumnas(matriz)
    
   [filas, columnas] = size(matriz);
   resultado = zeros(filas, 1);
   for i = 1:columnas
       resultado = resultado + matriz(:,i);
   end
   
end
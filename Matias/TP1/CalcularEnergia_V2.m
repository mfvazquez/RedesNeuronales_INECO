function energia = CalcularEnergia_V2(s)

    energia = 0;
    [fil, col] = size(s);
    
    for i = 1:fil
        for j = 1:col

            
            suma = 0;
            if i == 1
               
                if j == 1
                    suma = suma + s(2,1) + s(1,2);
                elseif j == col
                    suma = suma + s(2,j) + s(1,j-1);
                else
                    suma = suma + s(1,j-1) + s(1,j+1) + s(2,j);
                end
                
            elseif i == fil
            
                if j == 1
                    suma = suma + s(i-1,1) + s(i,2);
                elseif j == col
                    suma = suma + s(i-1,j) + s(i,j-1);
                else
                    suma = suma + s(i,j-1) + s(i,j+1) + s(i-1,j);
                end
                
            else
                    
                            
                if j == 1
                    suma = suma + s(i-1,j) + s(i+1,j) + s(i,2);
                elseif j == col
                    suma = suma + s(i-1,j) + s(i+1,j) + s(i,j-1);
                else
                    suma = suma + s(i,j-1) + s(i,j+1) + s(i-1,j) + s(i+1,j);
                end
                
                
            end
                
           energia = energia + s(i,j) * suma;
            
        end
    
    end
        
    energia = energia * -1;
    
end
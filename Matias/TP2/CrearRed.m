% red = {capa 1, capa 2}
% capa = {perceptron 1, perceptron 2, ...}
% perceptron = [peso 1, peso 2, ...]

function red = CrearRed(estructura)
    
    red = cell(length(estructura)-1,1);

    for i = 2:length(estructura)
        entradas = estructura(i-1)+1;
        capa = cell(length(estructura(i)),1);
        for j = 1:estructura(i)
            capa{j} = (rand(entradas,1)-0.5)/2;
        end
        red{i-1} = capa;
    end
    
end
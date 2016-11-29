function pos = SubindiceMinimoResta(w,actual)

    min = Inf;
    pos = 0;
    
    for i = 1:size(w,1)
        aux = w(i,:);
        aux = norm(aux-actual);
        if aux < min
            min = aux;
            pos = i;
        end
    end

end
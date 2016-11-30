% en el del viajante poner mas neuronas qe ciudades, pero que no supere
% 2 veces la cantidad de ciudades


% Hay que unir con lineas los pesos de las neuronas adyacentes
clear all;
clc;
M = 10; % cantidad de puntos
N = M*2; % numero de neuronas
aprendizaje = 0.01;
sigma = 5;
limite = 1e-3;

puntos = rand(M,2)*2 -1;

w = zeros(N,2);
for i = 1:N
    alfa = 2*pi*i/N;
    w(i,:) = [cos(alfa) sin(alfa)];
end

figure;
plot([w(:,1)' w(1,1)], [w(:,2)' w(1,2)], '.-b');
hold on;
plot(puntos(:,1), puntos(:,2), '.r');
title('w inicial');
saveas( gcf, fullfile('ej3','0'), 'jpg' );


iteracion = 1;
while sigma > limite
    
    for k=1:size(puntos,1)
        
        min = Inf;
        for j = 1:size(w,2)
            aux = norm(w(j,:) - puntos(k,:));
            if aux < min
                min = aux;
                pos = j
            end
        end 
        
        % en base al minimo modifico la red
        for i = 1:size(w,1)
            vecindad = exp(-(norm(i-pos)^2)/(2*sigma^2));
            incremento = aprendizaje * vecindad * (puntos(k,:)-w(i,:));
            w(i,:) = w(i,:) + incremento;
        end
        
    end
    
    figure;
    plot([w(:,1)' ], [w(:,2)' ], '.-b');
    hold on;
    plot(puntos(:,1), puntos(:,2), '.r');
    title(['sigma = ' num2str(sigma) ' k = ' num2str(k)]);
    saveas( gcf, fullfile('ej3',num2str(iteracion)), 'jpg' );
    iteracion = iteracion + 1;
    
    sigma = sigma*0.95;
end

if ~exist('data','dir')
    mkdir('data');
end

contador = 1;
continuar = true;

while continuar
    archivo = fullfile('data',['ej3_v' num2str(contador) '.mat']);
    if ~exist(archivo, 'file')
        continuar = false;        
    end
    contador = contador + 1;
end
save(archivo);
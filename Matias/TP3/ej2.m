
% Hay que unir con lineas los pesos de las neuronas adyacentes
clear all;
clc;
N = 15; % numero de fias de neuronas
M = N*500; % cantidad de puntos
aprendizaje = 0.01;
sigma = N/2;
limite = 1e-3;
% limite = sigma - 1;

w = rand(N,N, 2);

% for i = 1:N
%     for j = 1:N
%         w(i,j,1) = ((i-1)/N)-0.4; 
%         w(i,j,2) = ((j-1)/N)-0.4;
%     end
% end

figure;
plot(w(:,:,1),w(:,:,2));
hold on;
plot(w(:,:,1)',w(:,:,2)');
title('w inicial aleatorio');
saveas( gcf, fullfile('ej2','inicial'), 'jpg' );

iteracion = 1;
while sigma > limite
    
    for k=1:M
        
        r = sqrt(rand);
        alfa = rand.*2*pi;
        x = r*cos(alfa);
        y = r*sin(alfa);
        actual = [x y];
        
%         figure(2);
%         plot(x,y, '.');
%         hold on;
        % obtengo el minimo
        min = Inf;
        for i = 1:size(w,1)
            for j = 1:size(w,2)
                peso_actual = [w(i,j,1) w(i,j,2)];
                aux = norm(peso_actual - actual);
                if aux < min
                    min = aux;
                    pos = [i j];
                end
            end 
        end
        
        % en base al minimo modifico la red
        for i = 1:size(w,1)
            for j = 1:size(w,2)
                peso_actual = [w(i,j,1) w(i,j,2)];
                pos_actual = [i j];
                vecindad = exp(-(norm(pos_actual-pos)^2)/(2*sigma^2));
                incremento = aprendizaje * vecindad * (actual-peso_actual);
                w(i,j,:) = peso_actual + incremento;
            end 
        end
        
    end
    
    figure;
    plot(w(:,:,1),w(:,:,2));
    hold on;
    plot(w(:,:,1)',w(:,:,2)');
    title(['sigma = ' num2str(sigma)]);
    saveas(gcf , fullfile('ej2',num2str(iteracion)), 'jpg');
    iteracion = iteracion + 1;
    
    sigma = sigma*0.9;
end

figure;
plot(w(:,:,1),w(:,:,2));
hold on;
plot(w(:,:,1)',w(:,:,2)');


if ~exist('data','dir')
    mkdir('data');
end

contador = 1;
continuar = true;

while continuar
    archivo = fullfile('data',['ej2_v' num2str(contador) '.mat']);
    if ~exist(archivo, 'file')
        continuar = false;        
    end
    contador = contador + 1;
end
save(archivo);
% en el del viajante poner mas neuronas qe ciudades, pero que no supere
% 2 veces la cantidad de ciudades


% Hay que unir con lineas los pesos de las neuronas adyacentes
clear all;
clc;
M = 50; % cantidad de puntos
N = M*2; % numero de neuronas
aprendizaje = 0.01;
sigma = 0.5;
k = sigma/10;
limite = 5e-3;

iteraciones = 100;

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
   
    for n = 1:iteraciones
    
        for i = 1:size(w,1)

            incremento = 0;

            for mu = 1:size(puntos,1);

                divisor = 0;
                for j = 1:size(w,1)
                    aux = exp(-( norm(puntos(mu,:) - w(j,:)) )^2/(2*sigma^2));
                    divisor = divisor + aux;
                end

                vecindad = exp(-(( norm(puntos(mu,:) - w(i,:)) )^2)/(2*sigma^2)) / divisor;
                incremento = incremento + vecindad * (puntos(mu,:) - w(i,:));

            end

            if i == 1
                fuerza_elastica =  k * (w(i+1,:) - 2*w(i,:) + w(end,:));
            elseif i == size(w,1)
                fuerza_elastica =  k * (w(1,:) - 2*w(i,:) + w(i-1,:));
            else
                fuerza_elastica =  k * (w(i+1,:) - 2*w(i,:) + w(i-1,:));
            end

            incremento = aprendizaje * (incremento + fuerza_elastica);

            w(i,:) = w(i,:) + incremento;

        end

    end
    
    figure;
    plot([w(:,1)' w(1,1)], [w(:,2)' w(1,2)], '.-b');
    hold on;
    plot(puntos(:,1), puntos(:,2), '.r');
    title(['sigma = ' num2str(sigma) ' k = ' num2str(k)]);
    saveas( gcf, fullfile('ej3',num2str(iteracion)), 'jpg' );
    iteracion = iteracion + 1;
    sigma = sigma*0.9;
    k = sigma/10;
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
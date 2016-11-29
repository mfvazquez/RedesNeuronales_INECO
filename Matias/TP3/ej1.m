
M = 1000; % cantidad de puntos
N = 50; % numero de neuronas
alpha = 5;
beta = 1/(1+(2*alpha/3));
aprendizaje = 0.5;
sigma = 10;
limite = 1e-12;

w = rand(N,1);
x = rand(M,1).^(1/(alpha+1));

while sigma > limite

    for j=1:length(x)
        actual = x(j);

        [~, pos] = min(abs(actual-w));
        for i=1:length(w)
            incremento = aprendizaje * exp((-((i-pos)^2)/(2*sigma^2)))*(actual-w(i));
            w(i) = w(i) + incremento;
        end

    end
    sigma = sigma*0.9;
end

if w(end) < w(1)
    w = w(end:-1:1);
end

figure
plot(w, 'b');
hold on;


y = (0:1/N:1).^(beta);
plot(y, 'g');
legend('pesos de la red', 'curva teorica', 'Location','NorthOutside');

if ~exist('data','dir')
    mkdir('data');
end

contador = 1;
continuar = true;

while continuar
    archivo = fullfile('data',['ej1_v' num2str(contador) '.mat']);
    if ~exist(archivo, 'file')
        continuar = false;        
    end
    contador = contador + 1;
end
save(archivo);
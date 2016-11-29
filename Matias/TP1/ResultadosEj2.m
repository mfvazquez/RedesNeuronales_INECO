%% MOSTRAR RESULTADOS DEL EJ 2

%% SINCRONICO

clear all
load('ResultadosEj2_sincronico.mat');

fprintf('SINCRONICO\n\n');

[filas, ~] = size(p_max);

for i = 1:filas
    relacion = p_max(i,:)./N;
    string_relacion = '[ ';
    for j = 1:length(relacion)
        string_relacion = [string_relacion ' ' num2str(relacion(j))];
    end
    string_relacion = [string_relacion ']'];
    fprintf('Error de referencia %f\n',errores_referencia(i));
    fprintf([string_relacion '\n\n']);
    
    figure
    plot(N, p_max(i,:))
    xlabel('N');
    ylabel('Pmax');
    title(sprintf('SINCRONICO, Error de referencia %f',errores_referencia(i)));
end


%% ASINCRONICO

clear all
load('ResultadosEj2_asincronico.mat');

fprintf('ASINCRONICO\n\n');

[filas, ~] = size(p_max);

for i = 1:filas
    relacion = p_max(i,:)./N;
    string_relacion = '[ ';
    for j = 1:length(relacion)
        string_relacion = [string_relacion ' ' num2str(relacion(j))];
    end
    string_relacion = [string_relacion ']'];
    fprintf('Error de referencia %f\n',errores_referencia(i));
    fprintf([string_relacion '\n\n']);
    
    figure
    plot(N, p_max(i,:))
    xlabel('N');
    ylabel('Pmax');
    title(sprintf('ASINCRONICO, Error de referencia %f',errores_referencia(i)));
end
%% EJ 3 Resultados Se debe cargar el .mat antes de correr este script

salidas = zeros(length(resultados),1);
for x = 1:size(entradas, 1)
    salidas(x) = ObtenerSalida(red, entradas(x,:), Beta);
end

figure(1)
plot(1:length(resultados), resultados, 'r');
xlabel('subindice');
ylabel('f(x,y,z)');
hold on

plot(1:length(salidas), salidas, 'b');
legend('Salida deseada', 'Salida obtenida', 'Location', 'NorthOutside');

figure(2)
plot(1:length(errores), errores);
xlabel('iteraciones');
ylabel('ECM');

divisiones = 1000;

base = 0:(2*pi)/divisiones:2*pi;
salida = zeros(length(base),1);
for x = 1:length(base)
   
    salida(x) = ObtenerSalida(red, [base(x) pi/2 0], Beta);
    
end

salida_deseada = sin(base);

figure(3)
plot(base, salida, 'b');
plot(base, salida_deseada, 'r');
legend('Salida obtenida', 'Salida deseada', 'Location', 'NorthOutside');

base = 0:(2*pi)/divisiones:2*pi;
salida = zeros(length(base),1);
for x = 1:length(base)
   
    salida(x) = ObtenerSalida(red, [0 base(x) 0], Beta);
    
end

salida_deseada = cos(base);

figure(4)
plot(base, salida, 'b');
plot(base, salida_deseada, 'r');
legend('Salida obtenida', 'Salida deseada', 'Location', 'NorthOutside');

base = -1:2/divisiones:1;
salida = zeros(length(base),1);
for x = 1:length(base)
   
    salida(x) = ObtenerSalida(red, [0 pi/2 base(x)], Beta);
    
end

salida_deseada = base;

figure(5)
plot(base, salida, 'b');
plot(base, salida_deseada, 'r');
legend('Salida obtenida', 'Salida deseada', 'Location', 'NorthOutside');

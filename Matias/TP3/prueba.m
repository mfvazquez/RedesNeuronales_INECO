n = 10000;

r = sqrt(rand(n,1));
alfa = rand(n,1).*2*pi;

x = r.*cos(alfa);
y = r.*sin(alfa);

figure
plot(x,y, '.');

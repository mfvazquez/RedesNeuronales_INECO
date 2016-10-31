function [salida, h] = Perceptron(pesos, entradas, Beta)
   
    entradas = [entradas 1];
    h = entradas*pesos;
    salida = tanh(Beta*h);

end
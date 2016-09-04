function patrones = ObtenerPatrones(carpeta, formato)
    % Obtiene todos los patrones de la carpeta indicada, los guarda
    % en una matriz en la que cada columna es un patron.
    % Precondiciones: Los archivos de la carpeta deben tener todos
    %                 el mismo formato y dimensiones. Y deben ser
    %                 imagenes monocromaticas.
    % Postcondiciones: Los valores 0 de las imagenes monocromáticas
    %                  serán -1 en la matriz de patrones.

    archivos = dir(carpeta);
    archivos(1) = []; % Elimino el archivo '..'
    archivos(1) = []; % Elimino el archivo '.'
    
    info = imfinfo(fullfile(carpeta, archivos(1).name));
    
    tamanio_patron = info.Width*info.Height;
    patrones = zeros(tamanio_patron, length(archivos)); % Cada columna es un patron
    for i = 1:length(archivos)
       
        archivo = fullfile(carpeta, archivos(i).name);
        patrones(:,i) = AbrirImagen(archivo, formato);
        
    end

end
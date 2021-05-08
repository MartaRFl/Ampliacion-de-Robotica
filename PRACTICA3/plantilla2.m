%% Configuraci�n inicial
factorescala=1;
mapa=imread('mapa1.png'); % Mapa de obst�culos
mapa_show=imread('mapa1.png');         % Mapa para mostrar en pantalla
mapa=imresize(mapa,factorescala);
mapa=imbinarize(mapa)*255;
i = [137 15];                  % Coordenadas de inicio
d = [15 137];                  % Coordenadas de destino
v = 0.1;                     % Velocidad del robot
alfa = 1;                    % Coeficiente de la componente de atracci�n
beta = 100;                  % Coeficiente de la componente de repulsi�n
D = 1.5;                     % Rango del efecto del campo de repulsi�n de los obst�culos

%% Inicializaci�n

figure                                        % Crea un nuevo dibujo
imshow(mapa_show,'InitialMagnification','fit')% Muestra el mapa de obst�culos
hold on;                                      % Para dibujar encima del mapa de obst�culos

r = i;                                        % El robot empieza en la posici�n de inicio

plot(i(1), i(2), 'go');                       % Dibuja el inicio
plot(d(1), d(2), 'ro');                       % Dibuja el destino

path = [];                                    % Almacena la trayectoria (inicialmente vac�a)
path = [path;r];                              % A�ade la posici�n actual del robot

%% C�lculo de la trayectoria

while norm(d-r) > v                  % Mientras la distancia del robot (r) al destino (d) sea m�s grande de lo que se puede mover en una iteraci�n
    
    % Incrementa la posici�n del robot 'r' con la velocidad 'v'
    % de acuerdo con la direcci�n del vector del campo de fuerzas.
    %
    % NO calcules la aceleraci�n. Solo la direcci�n del movimiento.

    
    % �� ESCRIBE TU C�DIGO AQU� !! Y modifica el resto de las secciones seg�n necesites.
    
    path = [path; r];                % A�ade la posici�n actual del robot
    plot(path(:,1),path(:,2),'r');   % Dibuja la posici�n del robot encima del mapa de obst�culos
    drawnow                          % Fuerza a que se redibuje en tiempo real
end

factorescala=1; 

mapa=imread('mapa1.png'); % Mapa de obstáculos
mapa_show=imread('mapa1.png');         % Mapa para mostrar en pantalla
mapa=imresize(mapa,factorescala);
mapa=imbinarize(mapa)*255;

%%% Coordenadas para indicar el punto de inicio y de final en apartado 1.
i = [69 86];                  % Coordenadas de inicio
d = [127 113];                  % Coordenadas de destino


v = 0.1;                     % Velocidad del robot
alfa = 1;                    % Coeficiente de la componente de atracciï¿½n
beta = 100;                  % Coeficiente de la componente de repulsiï¿½n
D = 1.5;                     % Rango del efecto del campo de repulsiï¿½n de los obstï¿½culos
%% Inicialización

figure                                        % Crea un nuevo dibujo
imshow(mapa_show,'InitialMagnification','fit')% Muestra el mapa de obstï¿½culos
hold on;                                      % Para dibujar encima del mapa de obstï¿½culos

% Introducimos las coordenadas sobre el mapa
r = i;                                        % El robot empieza en la posiciï¿½n de inicio
plot(i(1), i(2), 'go');  
plot(d(1), d(2), 'ro'); 
path = [];                                    % Almacena la trayectoria (inicialmente vacï¿½a)
path = [path;r];                              % Aï¿½ade la posiciï¿½n actual del robot

n_iter = 0;                                   % Cuenta el número de iteraciones

%% Detección de obstáculos
[x,y]=find(mapa==255); 
obs=[y, x]
plot(obs(:,1),obs(:,2),'g.');
n=length(obs);
% Buscamos y señalamos los obstáculos sobre el mapa

%% Cálculo de la trayectoria

while norm(d-r) > v && n_iter<5000


    % Mientras la distancia del robot (r) al destino (d) sea mï¿½s grande de lo que se puede mover en una iteraciï¿½n
    % También fijamos un máximo de iteraciones por si se queda pillado
                                                     
    % Incrementa la posiciï¿½n del robot 'r' con la velocidad 'v'
    % de acuerdo con la direcciï¿½n del vector del campo de fuerzas.
    % NO calcules la aceleraciï¿½n. Solo la direcciï¿½n del movimiento. 
    % ï¿½ï¿½ ESCRIBE TU Cï¿½DIGO AQUï¿½ !! Y modifica el resto de las secciones segï¿½n necesites.
    
    % Definimos las fuerzas de atracción y repulsión, inicializada a 0
    F_atr=alfa*(d-r);
    F_rep=0;
    
   
    for a=1:n
        rho_obs=norm(r-obs(a,:));
        if(rho_obs<=D)
            F_rep=F_rep+beta*(1/rho_obs-1/D)*(r-obs(a,:))/rho_obs^3;
        end
    end
    
    % Calculamos la fuerza resultante
    F_res=F_atr+F_rep;  
    
    % Y la dirección del movimiento
    dir_res=F_res/norm(F_res);
    
    % Actualizamos la posición 
    r=r+dir_res*v; 
    
    path = [path; r];                % Añade la posiciï¿½n actual del robot
    plot(path(:,1),path(:,2),'r');   % Dibuja la posiciï¿½n del robot encima del mapa de obstï¿½culos
    drawnow                          % Fuerza a que se redibuje en tiempo real
    n_iter=n_iter+1;                 % Aumentamos el contador que nos asegura finalizar el programa en caso de que no se consiga llegar a la posición destino.
end

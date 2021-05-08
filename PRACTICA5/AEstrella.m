function [coste,ruta] = aestrella(G,H,I,F)
%% Código
% Comprobación si el nodo inicial y final coincide
if I == F
 coste = 0;
 ruta = I;
else
 %% Calculo numeros de nodos
 nnodos = length(G);
 %% Se crea la matriz pila con los datos
 % Columna 1 posicion del nodo
 % Columna 2 coste de la matriz G
 % Columna 3 coste de la matriz H
 % Columna 4 numero del nodo anterior
 
 pila = zeros (nnodos,4);
 pila(:,1) = 1:nnodos;
 pila(:,2) = inf;
 pila(I,2) = 0; % Se pone a 0 el coste del origen
 pila(:,3) = inf;
 pila(I,3) = 0; % Se pone a 0 el coste del origen
 
 pila(:,4) = 1:nnodos;
 
 % Se ordena la pila según el coste
 costG = pila(:,2);
 costH = pila(:,3);
 padre = pila(:,4);
 pila = sortrows(pila,2);
 %% Se crea la pila de descartes
 pila_desc = [];
 %% Busqueda de camino 
 while pila(1,1) ~= F
 
 % Se coge los valores de coste la matriz G para el nodo
 costesG = G(pila(1,1),:);
 costeGn = pila(1,2); % Coste del primer nodo de la pila
 costeHn = Hest(F,:)'; % Costes heurísticos para ir hasta el punto H
 
 % Se eligen los nodos que cumplen que el coste de la pila actual es que la suma del coste de la matriz G y el coste del nodo actual
 
 nodos = costesG' ~= 0 & costG > (costesG' + costeGn);
 
 % Se actualiza el nodo padre de los nodos por el nodo actual
 padre(nodos) = pila(1,1); 
 
 % Se actualizan los valores de costes
 costG(nodos) = costesG(nodos)' + costeGn;
 costH(nodos) = costesG(nodos)' + costeHn(nodos) + costeGn;
 
 % Se guarda la primera primera fila en la fila de descarte
 pila_desc = [pila_desc;pila(1,:)];
 
 % Se borra la primera fila
 pila(1,:) = [];
 pila = sortrows(pila,1);
 
 % Se guardan los nuevos valores de coste en su posición
 pos1 = ismember((1:nnodos)', pila(:,1));
 pila(:,2:4) = [costG(pos1), costH(pos1), padre(pos1)];
 
 
 % Se ordena la pila y se guarda el dato de la primera fila
 pila = sortrows(pila,3);
 end
 
 %% Procesamiento de datos
 % Se guarda los datos del nodo final en la pila del descarte
 pila_desc = [pila_desc;pila(1,:)];
 
 % Se borran las filas de 0 de la pila de descarte
 ind = find(sum(pila_desc,2)==0) ;
 pila_desc(ind,:) = [] ;
 
 % Se calcula 
 tam_pila = size(pila_desc);
 coste = pila_desc(tam_pila(1),2);
 
 % Se crea el vector de la ruta, dando valor al primer nodo
 ruta = zeros(1,tam_pila(1)); 
 ruta (1) = I;
 
 % Se eligen el nodo destino, que equivale al ultimo que quedo en la
 % busqueda de camino
 unodo = pila(1,1); 
 i = tam_pila(1);
 
 % Se crea el vector de la ruta
 while unodo ~= I
 ruta(i) = unodo
 unodo = pila_desc(find(pila_desc(:,1) == unodo),4);
 i = i - 1;
 end
 % Se eliminan los 0 de la ruta
 ruta = ruta(ruta~=0);
end
end


 
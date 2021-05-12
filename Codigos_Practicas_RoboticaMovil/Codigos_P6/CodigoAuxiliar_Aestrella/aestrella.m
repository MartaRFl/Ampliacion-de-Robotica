function [coste,ruta] = aestrella(G,H,I,F)
if I == F
 coste = 0;
 ruta = I;
else
 nnodos = length(G);

 
 matriz = zeros (nnodos,4);
 matriz(:,1) = 1:nnodos;
 matriz(:,2) = inf;
 matriz(I,2) = 0; 
 matriz(:,3) = inf;
 matriz(I,3) = 0; 
 
 matriz(:,4) = 1:nnodos;
 

 costG = matriz(:,2);
 costH = matriz(:,3);
 llegada = matriz(:,4);
 matriz = sortrows(matriz,2);
 
 descartes = [];

 while matriz(1,1) ~= F
 costesG = G(matriz(1,1),:);
 costeGn = matriz(1,2); 
 Hest = H;
 
for fil=1:length(G)
 for col=1:length(G)
 coste = dijkstra(G,fil,col);
 if coste < Hest(fil,col)
 Hest(fil,col) = coste;
 end
 end
end

 costeHn = Hest(F,:)'; 
 
 nodos = costesG' ~= 0 & costG > (costesG' + costeGn);
 
 llegada(nodos) = matriz(1,1); 
 
 costG(nodos) = costesG(nodos)' + costeGn;
 costH(nodos) = costesG(nodos)' + costeHn(nodos) + costeGn;
 

 descartes = [descartes;matriz(1,:)];
 

 matriz(1,:) = [];
 matriz = sortrows(matriz,1);
 

 pos1 = ismember((1:nnodos)', matriz(:,1));
 matriz(:,2:4) = [costG(pos1), costH(pos1), llegada(pos1)];
 
 

 matriz = sortrows(matriz,3);
 end
 


 descartes = [descartes;matriz(1,:)];
 

 ind = find(sum(descartes,2)==0) ;
 descartes(ind,:) = [] ;
 

 tam_pila = size(descartes);
 coste = descartes(tam_pila(1),2);
 
 ruta = zeros(1,tam_pila(1)); 
 ruta (1) = I;
 

 unodo = matriz(1,1); 
 i = tam_pila(1);
 

 while unodo ~= I
 ruta(i) = unodo
 unodo = descartes(find(descartes(:,1) == unodo),4);
 i = i - 1;
 end
 
 ruta = ruta(ruta~=0);
end
end
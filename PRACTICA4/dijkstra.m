function [Coste,Ruta] = dijkstra(G,origen,destino )
%Calcula el camino utilizando el algoritmo de dijkstra
% Va evaluando los posibles caminos según el coste total calculado
% mediante los costes de cada lazo (G) desde el origen al destino
% seleccionado, acaba proporcionando el camino óptimo y su coste total.
Ruta=[origen,0,0];
[f,c]=size(Ruta);
Camino=VectorInfinito(G);
Camino=Actualizar(Camino,origen,1,0,0); %Situamos el origen
%Antes de entrar en el algoritmo vamos a comprobar que ninguno de los
%puntos dados es un punto aislado, para ello comprobaremos que todos los
%valores de la matriz G dada para los puntos origen y destino no sean 0.
counterO=0;
counterD=0;
for(k=[1:length(G)])
 if(G(origen,k)==0)
 counterO=counterO+1;
 end
 if(G(destino,k)==0)
 counterD=counterD+1;
 end
end
if(counterO>=length(G)||counterD>=length(G))
 noaislado=0;
else
 noaislado=1;
end
%COMIENZA EL BUCLE (si ninguno está aislado)
while((Ruta(f,1)~=destino) && noaislado)
 
%Exploramos los puntos cercanos al actual y actualizamos la pila
Camino=ExplorarPtoCercanos(G,Camino(1,1),Camino);
%Tenemos que eliminar los puntos cercanos que ya estén en el vector de ruta
%final, por ejemplo, si hemos elegido el punto 2 como punto de ruta, cuando
%exploremos los cercanos al 3 no podemos tener el 2 como posibilidad, por
%eso lo eliminamos.
Camino=EliminarCamino(Camino,Ruta);
%Añadimos el punto de menor coste, el actual, a la ruta final.
Ruta=[Ruta;Camino(1,:)];
[f,c]=size(Ruta);
end
Coste=Ruta(f,2);
debug=Ruta;
Ruta=OptimizarRuta(Ruta,origen,destino);
Ruta=Ruta(:,1);
if(noaislado==0)
 Ruta=[];
 Coste=inf;
end
end

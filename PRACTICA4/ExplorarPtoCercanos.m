function [ Ptoexplorados ] = ExplorarPtoCercanos( G,punto,VectorPila)
%Explorar cercanos encuentra los puntos accesibles desde un punto y los
P=[];
costebase=VectorPila(1,2);
[f,c]=size(G);
%Vamos buscando aquellos puntos con coste no nulo y los vamos añadiendo al
%vector P con su coste y el punto desde el que se calcula.
for(i=[1:c])
 if(G(punto,i)~=0)
 P=[P;i,costebase+G(punto,i),punto];
 end
end
[r,C]=size(P);
Ptoexplorados =VectorPila;
VectorPila=sortrows(VectorPila,1);
%Seguidamente los añadimos a la pila y la devolvemos ordenada por costes
for(j=[1:r])
 if(P(j,2)<=VectorPila(P(j,1),2))
 
Ptoexplorados =Actualizar(Ptoexplorados,P(j,1),j,P(j,2),P(j,3));
 end
end
Ptoexplorados =sortrows(Ptoexplorados,2); %Ordenamos por coste
end

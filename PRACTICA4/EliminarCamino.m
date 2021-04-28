function [ Caminolimpio ] = EliminarCamino( VectorPila,Ruta )
%Elimina de la pila puntos ya usados pero cercanos al actual
[f,c]=size(Ruta);
%Ordenamos la pila por puntos
VectorPila=sortrows(VectorPila,1);
%Vamos eliminando aquellos puntos que ya están en la ruta poniéndoles coste
%infinito
for(i=[1:f])
 VectorPila(Ruta(i,1),2:3)=inf;
end
%Reordenamos el resultado basándonos en el coste
Caminolimpio=sortrows(VectorPila,2);
end
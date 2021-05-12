function [ Caminolimpio ] = EliminarCamino( VectorPila,Ruta )

[f,c]=size(Ruta);

VectorPila=sortrows(VectorPila,1);

for(i=[1:f])
 VectorPila(Ruta(i,1),2:3)=inf;
end
Caminolimpio=sortrows(VectorPila,2);
end
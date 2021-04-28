function [ Actualizado ] = Actualizar( VectorPila,punto,posicion,coste,ref )
%Actualizar modifica el orden de puntos y actualizar los costes
[f,c]=size(VectorPila);
Ordenada=sortrows(VectorPila,1); %Ordenación según valor del punto
Ordenada(punto,:)=[]; %Eliminación de punto de la pila
Ordenada(posicion+1:f,:)=Ordenada(posicion:f-1,:); %Estiramiento de la pila
Ordenada(posicion,:)=[punto,coste,ref];
Actualizado=Ordenada;
end
function [ VecInfinito ] = VectorInfinito( G )
%INFINITEVECTOR Genera un vector a partir de un grafo de costes
% Esta función genera un vector de infinitos adecuado a un grafo
% particular proporcionado para ejecutar algoritmos de búsqueda de
% caminos.
[f,c]=size(G);
if(f==c)
 tam=f;
 VecInfinito=ones(f,3); %Generación del vector
 for(i=[1:f])
 VecInfinito(i,1)=i; %Adición de puntos
 end
 VecInfinito(:,2:3)=VecInfinito(:,2:3)*inf; %Adición de costes iniciales
else
 fprintf('Error, el grafo no especifica el coste de todas las posibles conexiones\n');
end
end

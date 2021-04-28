function [ RutaOptimizada ] = OptimizarRuta( Ruta,origen,destino )
%OptimizarRuta genera la ruta óptima con menor coste
[f,c]=size(Ruta);
i=Ruta(f,3);
%Almacenamos el valor del destino en RutaOptimizada para que no esté vacío.
RutaOptimizada=Ruta(f,:);
[last,c]=size(RutaOptimizada);
%Iremos llenando RutaOptimizada hasta que hayamos llegado al punto de
%partida desde el destino, obteniendo el camino óptimo.
while(RutaOptimizada(last,1)~=origen)
 
 %Tenemos que encontrar la fila que contiene el valor i que es el
 %objetivo
 for(j=[1:f])
 if(Ruta(j,1)==i)
 hilera=j;
 end
 end
 RutaOptimizada=[RutaOptimizada;Ruta(hilera,:)];
 
 [f,c]=size(Ruta);
 [last,c]=size(RutaOptimizada);
 i=Ruta(hilera,3);
end
RutaOptimizada=sortrows(RutaOptimizada,2);
end

function [RutaOptimizada] = OptimizarRuta(Ruta,origen,destino)
[f,c]=size(Ruta);
i=Ruta(f,3);
RutaOptimizada=Ruta(f,:);
[ultima,c]=size(RutaOptimizada);

while(RutaOptimizada(ultima,1)~=origen)

 for(j=[1:f])
 if(Ruta(j,1)==i)
 columna=j;
 end
 end
 RutaOptimizada=[RutaOptimizada;Ruta(columna,:)];
 
 [f,c]=size(Ruta);
 [ultima,c]=size(RutaOptimizada);
 i=Ruta(columna,3);
end
RutaOptimizada=sortrows(RutaOptimizada,2);
end

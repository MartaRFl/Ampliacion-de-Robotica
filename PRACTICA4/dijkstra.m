function [Coste,Ruta] = dijkstra(G,origen,destino )
Ruta=[origen,0,0];
[f,c]=size(Ruta);
Path=Default(G);
Path=ReorganizarMatriz(Path,origen,1,0,0); %Situamos el origen
cOrigen=0;
cDestino=0;
for(k=[1:length(G)])
 if(G(origen,k)==0)
 cOrigen=cOrigen+1;
 end
 if(G(destino,k)==0)
 cDestino=cDestino+1;
 end
end
if(cOrigen>=length(G)||cDestino>=length(G))
 inalcanzable=0;
else
 inalcanzable=1;
end

while((Ruta(f,1)~=destino) && inalcanzable)
Path=Alrededores(G,Path(1,1),Path);
Path=EliminarCamino(Path,Ruta);
Ruta=[Ruta;Path(1,:)];
[f,c]=size(Ruta);
end
Coste=Ruta(f,2);
debug=Ruta;
Ruta=OptimizarRuta(Ruta,origen,destino);
Ruta=Ruta(:,1);
if(inalcanzable==0)
 Ruta=[];
 Coste=inf;
end
end

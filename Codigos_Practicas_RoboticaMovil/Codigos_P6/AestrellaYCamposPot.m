function AestrellaYCamposPot(S, X)

mapa2;
f0 = figure('units','normalized','outerposition', [0 0 1 1]);
mapa = imread('mapa2.pgm');
imshow(mapa,'InitialMagnification','fit');
hold on;

for i = 1:length(nodos)
    
    plot(nodos(i,2),nodos(i,3),'bo','MarkerSize',11)
    
    if nodos(i,1) > 9
        centrar = 2;
    else
        centrar = 1;
    end
    text(nodos(i,2) - centrar, nodos(i,3), int2str(nodos(i,1)));
    
end

[G, H] = costes_heuristica(nodos, costes);
[coste, ruta]=aestrella(G,H,S,X);

%% Campo Potencial
for actual = 1:(length(ruta)-1)
    
    %Coordenadas
    ini = [nodos(ruta(actual),2),nodos(ruta(actual),3)];      
    dest = [nodos(ruta(actual+1),2),nodos(ruta(actual+1),3)];
    
    A = CamposPotenciales(ini,dest,mapa); 
    
     if  A == 0
         break;
     end
end
if A==0
    disp('Destino no alcanzado');
else
    disp('Destino alcanzado');
end
end

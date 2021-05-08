function [ Actualizado ] = ReorganizarMatriz(MatrizInfinitos,PuntoDePartida,PosicionActual,coste,sig )
[f,c]=size(MatrizInfinitos);
ReorganizarMatriz=sortrows(MatrizInfinitos,1);
ReorganizarMatriz(PuntoDePartida,:)=[];
ReorganizarMatriz(PosicionActual+1:f,:)=ReorganizarMatriz(PosicionActual:f-1,:);
ReorganizarMatriz(PosicionActual,:)=[PuntoDePartida,coste,sig];
Actualizado=ReorganizarMatriz;
end
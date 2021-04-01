function [PosObs] = Obstaculos(mapa) 
%El mapa tiene 150x150 pixeles
PosObs=[];
[Y,X]=size(mapa);
for (i=[1:X])
for (j=[1:Y])
if(mapa(j,i)==0) %Si en esta posicion del barrido tenemos un pixel negro, hay obstaculo y lo guardamos
 PosObs=[PosObs;j,i];
                              
                    end
          end
end

plot(PosObs(:,2),PosObs(:,1), '+g');
end
                        
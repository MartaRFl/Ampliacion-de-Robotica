function [rep] = Frepulsion(PosObs, pos, beta, D)

Total=0; %El total
inc=0; %El incremento

[A,B]=size(PosObs);
if(lenght(PosObs~=0)) %Estando cerca
          for (i=[1:A])
             Pobs=Distancia(pos,PosObs(i,:));
             if (Pobs <=D && Pobs ~=0)
                       inc=(beta*((1/Pobs)-(1/D))*(pos-(obs(i,:)))/(Pobs^3));
             elseif(Pobs<D)
                       inc=0;
                    
             end
             Total=Total+inc
          end
end
end

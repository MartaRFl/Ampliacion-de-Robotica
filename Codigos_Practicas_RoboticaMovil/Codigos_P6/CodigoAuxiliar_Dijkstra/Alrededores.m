function [examinados] = Alrededores(G,MatrizInfinitosPP,MatrizInfinitos)
P=[];
costebase=MatrizInfinitos(1,2);
[f,c]=size(G);

for(i=[1:c])
 if(G(MatrizInfinitosPP,i)~=0)
 P=[P;i,costebase+G(MatrizInfinitosPP,i),MatrizInfinitosPP];
 end
end

[r,C]=size(P);
examinados =MatrizInfinitos;
MatrizInfinitos=sortrows(MatrizInfinitos,1);

for(j=[1:r])
 if(P(j,2)<=MatrizInfinitos(P(j,1),2))
 
examinados =ReorganizarMatriz(examinados,P(j,1),j,P(j,2),P(j,3));
 end
end
examinados =sortrows(examinados,2);
end

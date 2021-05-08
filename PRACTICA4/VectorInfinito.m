function [ predeterminado ] = Default(G)
[f,c]=size(G);
if(f==c)
 predeterminado=ones(f,3);
 for(i=[1:f])
 predeterminado(i,1)=i;
 end
 predeterminado(:,2:3)=predeterminado(:,2:3)*inf;

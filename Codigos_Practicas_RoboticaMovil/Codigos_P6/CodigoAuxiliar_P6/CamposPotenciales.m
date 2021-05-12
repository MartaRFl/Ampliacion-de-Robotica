function A = CamposPotenciales(ini,dest,mapa)

factorescala=1;

v = 0.1;                     
alfa = 1;                    
beta = 100*factorescala;     
D = 1.5;                     

r = ini;                                      

path = [];                                    
path = [path;r];                              

n_iter = 0;                                   

[i,j]=find(mapa==0);
obs=[j i];
plot(obs(:,1),obs(:,2),'b.');
n=length(obs);

A = 1;

% Calculo de la trayectoria
while norm(dest-r)>v && n_iter<5000                
    
    
    F_atr=alfa*(dest-r);
    F_rep=0;
    
    for jj=1:n
        rho_obs=norm(r-obs(jj,:));
        if(rho_obs<=D)
            F_rep=F_rep+beta*(1/rho_obs-1/D)*(r-obs(jj,:))/rho_obs^3;
        end
    end

    F_res=F_atr+F_rep;
    dir_res=F_res/norm(F_res);
    
    r=r+dir_res*v; 
    n_iter=n_iter+1;
    
    if n_iter == 1000
        A = 0; 
        break;
    end
    
    path = [path; r];            
    plot(path(:,1),path(:,2),'r');  
    drawnow                          
end
end
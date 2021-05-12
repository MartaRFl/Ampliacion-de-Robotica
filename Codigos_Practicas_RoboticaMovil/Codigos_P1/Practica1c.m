x=[0 0 10 10 0]';   
y=[0 30 30 0 0]';  
L=10;               

x0=3;               
y0=1;               
phi0=pi/2;          

xgoal=L/2;          
ygoal=y0+1;         

figure;

while(ygoal < 25)

 rangos=laser2D(x,y,x0,y0,phi0);
 dibujaBarrido(x,y,x0,y0,phi0,rangos);
 plot(x0,y0,'g.');hold on;

 xgoal=L/2;   ygoal=y0+1;
 plot(xgoal,ygoal,'r.');hold on;

 d=rangos(1)+rangos(36); 

 theta=real(acos(L/d));

 dv=(x0-xgoal);d=ygoal-y0;
 dx=-dv*cos(theta)+d*sin(theta);
 dy=dv*sin(theta)+d*cos(theta);
 mov=[dx dy]; mov=mov/norm(mov)*0.3;

 x0=x0+mov(1);
 y0=y0+mov(2);
 phi0=theta;
end
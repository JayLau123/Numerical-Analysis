%Tegning af sdof oscillator 

clear all; 

%System data 
m=1.0; zeta=0.01; omega0=1.0; Dt=1.0; f0=1.0; 
x0=0.0; dotx0=0.0; 
xmax=sqrt(x0^2+(dotx0/omega0)^2)+min([0.5*abs(f0)*Dt/(m*omega0) f0/omega0^2]); 
omegad=omega0*sqrt(1-zeta^2); 
dt0=0.1*pi/omega0; nstep=500; 

a=0.70; b=0.70; r=0.35*a; fact=0.50/xmax; 

xf0=0.5*[0 -a   0   a     0]'; 
yf0=[0  -b/4 -b/2 -3*b/4 -b]'; 
xd1=0.5*[-a   -a   a     a]'; 
yd1=[-6*b    0   0    -6*b]'; 
xd2=0.5*[-0.8*a 0.8*a]'; 
yd2=[-3*b   -3*b]'; 
xf0=[xf0 
    xf0 
    xf0 
    xf0 
    xf0 
    xf0]; 
yf0=[yf0 
   -b+yf0 
   -2*b+yf0 
   -3*b+yf0 
   -4*b+yf0 
   -5*b+yf0]; 
xf=[0 
   xf0 
   0]; 
xSQ=[-a 5*a 5*a -a -a]'; 
ySQ=[0       0      -2*r   -2*r 0]'; 
xH=[-2000 2000]'; yH=[0 0]'; 

xx=x0; 
tt=0; 

set(gcf,'DoubleBuffer','on'); 

i=1; 
t=i*dt0; 
t0=min([t Dt]); 
t1=t-t0; 
h=exp(-zeta*omega0*t)*sin(omegad*t)/(m*omegad); 
doth=exp(-zeta*omega0*t)*(cos(omegad*t)-zeta*omega0/omegad*sin(omegad*t))/m; 
H=(1/m-doth-2*zeta*omega0*h)/omega0^2; 
h1=exp(-zeta*omega0*t1)*sin(omegad*t1)/(m*omegad); 
doth1=exp(-zeta*omega0*t1)*(cos(omegad*t1)-zeta*omega0/omegad*sin(omegad*t1))/m; 
H1=(1/m-doth1-2*zeta*omega0*h1)/omega0^2; 
if t>Dt 
  t2=t-Dt; 
  h2=exp(-zeta*omega0*t2)*sin(omegad*t2)/(m*omegad); 
  doth2=exp(-zeta*omega0*t2)*(cos(omegad*t2)-zeta*omega0/omegad*sin(omegad*t2))/m; 
  H2=(1/m-doth2-2*zeta*omega0*h2)/omega0^2; 
else 
  H2=0; 
end 
x=-f0*H2+f0*(t0/m+h1-h+2*zeta*omega0*(H1-H))/(Dt*omega0^2); 
x=x+exp(-zeta*omega0*t)*(x0*cos(omegad*t)+(dotx0+zeta*omega0*x0)*sin(omegad*t)/omegad); 
tt=[tt 
  t]; 
xx=[xx 
  x]; 
x=fact*x; 
yf=[0 
   -2*b+(1+x)*yf0 
   -6*b+(1+x)*yf0(size(yf0,1))]; 
clf; 
figure(1); 
subplot(2,1,1) 
h1=plot(xH,yH,'r'); 
hold on 
h2=plot(xH,yH-6*b+yf0(size(yf0,1))-r,'k'); 
h3=plot(xf,yf,'r'); 
h4=plot(4*a+xd1,-3*b+yd1,'r'); 
h5=plot(4*a*[1 1]',-3*b*[0 1]','r'); 
hej=yf(size(yf,1)); 
h6=plot(4*a+xd2,(-7*b+yf(size(yf,1))-hej)*ones(2,1),'r'); 
h7=plot(4*a*[1 1]',[-7*b+yf(size(yf,1))-hej yf(size(yf,1))]','r'); 
h8=plot(xSQ,yf(size(yf,1))+ySQ,'r'); 
hold off 
axis([-2 5 -10*b+(1+fact*x0)*yf0(size(yf0,1))-2*r r]); 
subplot(2,1,2) 
h9=plot(xH,yH,'k'); 
hold on; 
h10=plot(tt,-xx,'r'); 
hold off; 
axis([ 0 nstep*dt0  -xmax xmax]) 

% start loop 
for i=1:nstep 

t=i*dt0; 
t0=min([t Dt]); 
t1=t-t0; 
h=exp(-zeta*omega0*t)*sin(omegad*t)/(m*omegad); 
doth=exp(-zeta*omega0*t)*(cos(omegad*t)-zeta*omega0/omegad*sin(omegad*t))/m; 
H=(1/m-doth-2*zeta*omega0*h)/omega0^2; 
h1=exp(-zeta*omega0*t1)*sin(omegad*t1)/(m*omegad); 
doth1=exp(-zeta*omega0*t1)*(cos(omegad*t1)-zeta*omega0/omegad*sin(omegad*t1))/m; 
H1=(1/m-doth1-2*zeta*omega0*h1)/omega0^2; 
if t>Dt 
  t2=t-Dt; 
  h2=exp(-zeta*omega0*t2)*sin(omegad*t2)/(m*omegad); 
  doth2=exp(-zeta*omega0*t2)*(cos(omegad*t2)-zeta*omega0/omegad*sin(omegad*t2))/m; 
  H2=(1/m-doth2-2*zeta*omega0*h2)/omega0^2; 
else 
  H2=0; 
end 
x=-f0*H2+f0*(t0/m+h1-h+2*zeta*omega0*(H1-H))/(Dt*omega0^2); 
x=x+exp(-zeta*omega0*t)*(x0*cos(omegad*t)+(dotx0+zeta*omega0*x0)*sin(omegad*t)/omegad); 

tt=[tt 
  t]; 
xx=[xx 
  x]; 
x=fact*x; 
yf=[0 
   -2*b+(1+x)*yf0 
   -6*b+(1+x)*yf0(size(yf0,1))]; 
set(h3,'Xdata',xf); 
set(h3,'Ydata',yf); 
set(h4,'Xdata',4*a+xd1); 
set(h4,'Ydata',-3*b+yd1); 
set(h5,'Xdata',4*a*[1 1]'); 
set(h5,'Ydata',-3*b*[0 1]'); 
set(h6,'Xdata',4*a+xd2); 
set(h6,'Ydata',(-7*b+yf(size(yf,1))-hej)*ones(2,1)); 
set(h7,'Xdata',4*a*[1 1]'); 
set(h7,'Ydata',[-7*b+yf(size(yf,1))-hej yf(size(yf,1))]'); 


set(h8,'Xdata',xSQ); 
set(h8,'Ydata',yf(size(yf,1))+ySQ); 
set(h10,'Xdata',tt); 
set(h10,'Ydata',-xx); 

pause(0.1) 
end;

%% query points: x=2*pi(0:10)/10 

x=0:0.01:2*pi;
y=cos(5*cos(5*x));
xx1=2*pi*(0:10)/10;
yy1=spline(x,y,xx1);
plot(x,y,xx1,yy1);

xlabel('[0,2*Pi]','interpreter','latex','FontSize',15)
ylabel('Value','interpreter','latex','FontSize',15)
title('Cubic Spline Method','interpreter','latex','FontSize',15)
legend('Original function','Polynomial interpolation','interpreter','latex','FontSize',10)

%% query points: x=2*pi(0:100)/100
x=0:0.01:2*pi;
y=cos(5*cos(5*x));
xx2=2*pi*(0:100)/100;
yy2=spline(x,y,xx2);
plot(x,y,xx2,yy2);

xlabel('[0,2*Pi]','interpreter','latex','FontSize',15)
ylabel('Value','interpreter','latex','FontSize',15)
title('Cubic Spline Method','interpreter','latex','FontSize',15)
legend('Original function','Polynomial interpolation','interpreter','latex','FontSize',10)





A=[0 1;-5  0]; 
w1=[0;1];            % initial value of y(t)=[x(t);p(t)]
w2=[0;1];            % initial value of y(t)=[x(t);p(t)]

h1=0.01;
x1=zeros(1,500); 
p1=zeros(1,500);
t1=zeros(1,500);

h2=0.001;            % true solution
x2=zeros(1,5000);
p2=zeros(1,5000);
t2=zeros(1,5000);

error1=zeros(1,500); % store the value of abs(x1(t)-x2(t*10))
error2=zeros(1,500); % store the value of abs(p1(t)-p2(t*10))

for i=1:500
    t1(i)=1+i*h1;
    w1=w1+h1*(A*w1);
    x1(i)=w1(1,1);
    p1(i)=w1(2,1);
end

for i=1:5000         % true solution
    t2(i)=1+i*h2;
    w2=w2+h2*(A*w2);
    x2(i)=w2(1,1);
    p2(i)=w2(2,1);
end

for i=1:500
    error1(i)=abs(x1(i)-x2(i*10));
    error2(i)=abs(p1(i)-p2(i*10));
end 

plot(t1,error1);
hold on
plot(t1,error2);
hold off
grid on

xlabel('t','interpreter','latex','FontSize',15)
ylabel('error','interpreter','latex','FontSize',15)
title('Euler method','interpreter','latex','FontSize',15)
legend('error1(x)','error2(p)','Error decay(Newton method)','interpreter','latex','FontSize',15)

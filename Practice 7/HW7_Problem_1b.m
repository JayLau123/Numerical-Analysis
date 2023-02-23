a=0;
b=8;
h=0.05;
N=160;
t=0;
i=1;

% initial condition
x=[0.5;2;3;4;5;6;7;8;9;10];
p=zeros(10,1);
w0=[x;p]

w=zeros(20,N);
w(:,1)=w0;


% 10 by 10 matrix
B=[-10,10,0,0,0,0,0,0,0,0;10,-20,10,0,0,0,0,0,0,0;0,10,-20,10,0,0,0,0,0,0;0,0,10,-20,10,0,0,0,0,0;0,0,0,10,-20,10,0,0,0,0;0,0,0,0,10,-20,10,0,0,0;0,0,0,0,0,10,-20,10,0,0;0,0,0,0,0,0,10,-20,10,0;0,0,0,0,0,0,0,10,-20,10;0,0,0,0,0,0,0,0,10,-10];

% 10 by 10 matrix, zeros
A1=zeros(10,10);

% 10 by 10 matrix, identity matrix
A2=eye(10);

% 20 by 20 matrix
A=[A1,A2;B,A1];

% additional coefficients
a1=zeros(10,1);
a2=[-10;0;0;0;0;0;0;0;0;10];
b=[a1;a2];

fun=@(y) A*y+b;

for i=2:N
    K1=h*fun(w(:,i-1));
    K2=h*fun(w(:,i-1)+K1/2);
    K3=h*fun(w(:,i-1)+K2/2);
    K4=h*fun(w(:,i-1)+K3);

    w(:,i)=w(:,i-1)+(K1+2*K2+2*K3+K4)/6;
end

% Horizontal line of particle motion
line([0,11],[0,0],'linestyle','-');
hold on

for i=1:10
    plot(i) = scatter(w(i,1),0,100,'filled','b')
    hold on
end

hold off
grid on

xlim([0,11]);
ylim([-1,1]);
xlabel('10 particle position','interpreter','latex','FontSize',15)
title('10 particles motion (Corresponding to 9 springs attached together in 1D)','interpreter','latex','FontSize',15)

for i=2:N
    for j=1:10
        plot(j).XData =w(j,i);
        plot(j).YData =0;
        pause(0.00001)
    end
end


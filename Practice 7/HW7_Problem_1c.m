
N=160;

% initial condition
x=[0.5;2;3;4;5;6;7;8;9;10];
p=zeros(10,1);
w0=[x;p];

w=zeros(20,N);
ww=zeros(20,10);
wtrue=zeros(20,1);
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

h=zeros(1,10);
s=[4,5,6,7,8,9,10,11,12,13];

for j=1:10
    h(j)=2^(-s(j));
end

for j=1:10
    for i=2:N
        K1=h(j)*fun(w(:,i-1));
        K2=h(j)*fun(w(:,i-1)+K1/2);
        K3=h(j)*fun(w(:,i-1)+K2/2);
        K4=h(j)*fun(w(:,i-1)+K3);
        w(:,i)=w(:,i-1)+(K1+2*K2+2*K3+K4)/6;
    end
    ww(:,j)=w(:,N);
end

% Treat the last as the true solution y(t), h=2^(-s(10)), s(10)=13, 
wtrue=ww(:,10)

% ∥ · ∥
% find the absolute error at each column 
sum=zeros(20,10); % store the summation

for k=1:10
    sum(:,k)=sum(:,k)+abs(wtrue-ww(:,k));
end

% for a certain column(1-10),add each element together 
sum2=zeros(1,10) % store the summation  

for m1=1:10
    for m2=1:20
        sum2(m1)=sum2(m1)+sum(m2,m1);
        % sum2 is a matrix (1 by 10)
        % sum is a matrix (20 by 10) 
    end
end


% loglog plot of h vs ∥wtrue − ω)∥
for m3=1:10
   loglog(h(m3),sum2(m3),'b')
end
hold off
grid on

%xlabel('10 particle position','interpreter','latex','FontSize',15)
%title('10 particles motion corresponds to springs attached together in 1D','interpreter','latex','FontSize',15)


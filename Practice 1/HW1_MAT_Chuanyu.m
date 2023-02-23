%%%%% Problem 10.a: sum(1/n!)(n=0:5)

x=exp(1);

y1=1/factorial(3);
y2=1/factorial(4);
y3=1/factorial(5);
z1=1+1+1/2+y1+y2+y3;

fprintf('n=5:\n'); 
fprintf('approximation=%.16f\n',z1);
% approximation is 2.7166666666666663
fprintf('absolute error=%e\n',abs(x-z1));
% absolute error is 1.615162e-03
fprintf('relative error=%e\n',abs((x-z1)/x));
% relative error is 5.941848e-04


%%%%% Problem 10.b: sum(1/n!)(n=0:10)


y4=1/factorial(6);
y5=1/factorial(7);
y6=1/factorial(8);
y7=1/factorial(9);
y8=1/factorial(10);
z2=1+1+1/2+y1+y2+y3+y4+y5+y6+y7+y8;

fprintf('n=10:\n'); 
fprintf('approximation=%.16f\n',z2);
% approximation is 2.7182818011463845
fprintf('absolute error=%e\n',abs(x-z2));
% absolute error is 2.731266e-08
fprintf('relative error=%e\n',abs((x-z2)/x));
% relative error is 1.004777e-08


%%%%% Problem 15.a

s=0; % the number is positive
c=10000001010;
f=1001001100000000000000000000000000000000000000000000;

c=1*2^10+1*2^3+1*2;
f=1*(1/2)+1*(1/2)^4+1*(1/2)^7+1*(1/2)^8;
% c=1034, f=0.5742

a=(-1)^0*2^(1034-1023)*(1+0.5742);
% the decimal number is 3.2240e+03

%%%%% Problem 15.b

s=1; % the number is negative
c=10000001010;
f=1001001100000000000000000000000000000000000000000000;

c=1*2^10+1*2^3+1*2;
f=1*(1/2)+1*(1/2)^4+1*(1/2)^7+1*(1/2)^8;
% c=1034, f=0.5742

a=(-1)^1*2^(1034-1023)*(1+0.5742);
% the decimal number is -3.2240e+03


%%%%%: Problem 9
% P(x) = a0 + a1*x + a2*x^2 + a3*x^3 + . . . an*x^n 

x0 =0.1; % changable
n = 5; % changable
a=0:n; % (n+1) elements

Px = a(n+1) * x0 +a(n);  % the most inner layer

% starting value of loop
for i = 1:n-1          
    Px = Px * x0 + a(n-i);
end

fprintf('For n = %d\n P(x) = %d\n',n,Px)

% the out put of P(0.1)=0.12345






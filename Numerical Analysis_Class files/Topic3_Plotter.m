%% Part 1: Basis polynomials, the L_nk functions

a = 0;          % [a,b] is the interval we plot L_nk over
b = 7;
xi = 0:7;       % interpolation points
k = 3;          % which basis polynomial

x = a:.01:b;
Lx = zeros(size(x));

for i = 1:size(x,2)
    p = x(i);
    Lx(i) = Topic3_Lnk(p,xi,k);

end

plot(x,Lx)
line([0 7],[ 0 0],'color','r')
%% Part 2: Polynomial Evaluation
% this code evaluates the Lagrange polynomial directly

 f1 = @(x) exp(-x).*sin(5*x); % nice function
 f2 = @(x) exp(-x).*sin(5*x).*abs(x-1.5); % function with bad point
f = f1;

a = 1;                  % [a,b] is the range we plot over
dx = .002;
b = 3;
dxi = .035;               % .035 step size shows the beginning Runge's Phenomena for f1
xi = 1:dxi:3;           % query points 
f_xi = f(xi);           % evaluate function at query points

n = max(size(xi));      % number of query points. Polynomial order is then n-1.
x = a:dx:b;             % points to evaluate polynomial at
P_x = zeros(size(x));

for i = 1:size(x,2)     % note direct evaluation requires a double for-loop
    for k = 0:(n-1)     % this is not as efficient as Divided Difference
        P_x(i) = P_x(i) + Topic3_Lnk(x(i),xi,k)*f_xi(k+1);
    end
end

plot(x,P_x,'b')
hold on
plot(x,f(x),'r')
hold off

xlabel('$x$','interpreter','latex','FontSize',15)
ylabel('$y$','interpreter','latex','FontSize',15)
title('Lagrange Interpolation','interpreter','latex','FontSize',15)
legend('$P(x)$','$f(x)$','interpreter','latex','FontSize',15)

%% Part 3: Divided Difference: Topic3_DD(xi,f_xi)
% using divided difference, for a select set of query points, this
% code computes the polynomial coefficients, and plots the polynomial
% over a given interval [a,b].

f = @(x) exp(-x/10).*sin(20*x);

a = 1.5;
dx = .005;
b = 4;
dz = .05;
xi = 1:dz:4;                % interpolation points.
f_xi = f(xi);               % evaluate the function
n = size(xi,2);             % number of interpolation points.
                            
div_diff = Topic3_DD(xi,f_xi); % divided difference coeffs

x = a:dx:b;
P_x = Topic3_DD_Eval(div_diff,x,xi);

plot(x,P_x)
hold on
plot(x,f(x))
hold off
legend('Polynomial Approx','f(x)','interpreter','latex','FontSize',15)

xlabel('x','interpreter','latex','FontSize',15)
ylabel('y','interpreter','latex','FontSize',15)


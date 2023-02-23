Fun = @(x) exp(-x).*sin(3*x); 
dFun = @(x) -exp(-x).*sin(3*x)+ 3*exp(-x).*cos(3*x);

expon = 1:20;            % exponent values. 
h = 10.^(-expon.*0.5); 
x=0.5;

F=Fun(x);

h=x(2)-x(1);
xForward=x(1:end-1);
dFForward=(F(2:end)-F(1:end-1))/h;

h = 10.^(-expon);           % distance between points to be compared in differentiation approximation.
x = .1;                     % where we are approximating the derivative
fp_actual = -sin(x);        % this gives the true derivative of cos(x)

f = @(z) cos(z);            % define our function f(x). Data type is func_handle.
fp = (f(x+h)-f(x))./h;      % our numerical approximation of f'(x0).

relative_error = abs(fp - fp_actual)/abs(fp_actual);    % this is the relative error for different values of h.

semilogy(expon,relative_error)  % this plots the relative error as a function of the exponent value (x-axis).
                                % semilogy(x,y) plots x vs log(y), and
                                % hence the y-axis is written in powers of
                                % 10.

xlabel('$-log_{10}(h)$','interpreter','latex','FontSize',15)    % these three lines label the x-axis, y-axis, and title.
ylabel('relative error','interpreter','latex','FontSize',15)
title('$Df(x) = \frac{f(x_0+h)-f(x_0)}{h}$','interpreter','latex','FontSize',15)


plot(x,dFun(x));
hold on

plot(xForward,dFForward,'k');

legend('Analytic','Forward')
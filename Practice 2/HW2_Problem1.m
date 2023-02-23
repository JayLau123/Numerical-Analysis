
expon = 0:.1:15;            % exponent values. 
                            % [0, .1, .2, . . ., 14.9, 15].

h = 10.^(-expon);           % distance between points to be compared in differentiation approximation.
x = .1;                     % where we are approximating the derivative
fp_actual = -sin(x).*exp(-x)-cos(x).*exp(-x);        % this gives the true derivative of cos(x)exp(x)

f = @(z) cos(z).*exp(-z);            % define our function f(x). Data type is func_handle.
fp = (f(x+h)-2.*f(x)+f(x-h))./(h.^2);      % our numerical approximation of f'(x0)

relative_error = abs(fp - fp_actual)/abs(fp_actual);    % this is the relative error for different values of h.

semilogy(expon,relative_error)  % this plots the relative error as a function of the exponent value (x-axis).
                                % semilogy(x,y) plots x vs log(y), and
                                % hence the y-axis is written in powers of
                                % 10.

xlabel('$-log_{10}(h)$','interpreter','latex','FontSize',15)    % these three lines label the x-axis, y-axis, and title.
ylabel('relative error','interpreter','latex','FontSize',15)
title('$D^2f(x) = \frac{f(x_0+h)-2f(x_0)+f(x_0-h)}{h^2}$','interpreter','latex','FontSize',15)
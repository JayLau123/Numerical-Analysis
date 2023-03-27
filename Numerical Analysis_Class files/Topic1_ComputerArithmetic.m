%% Part 1: Observing computer arithmetic limits

fprintf('(%e, %e, %e, %e, %e)\n',2^(1023),2^(1024),2^(-1022), 2^(-1074),2^(-1075)) 
% Note: \n is the newline character.

% exponent cannot go beyond c = 2046.
% denormal numbers are when we go below 2^(-1022).
% denormal numbers are maxed out at 2^(-1022) * 2^(-52)
%% Part 2: Floating point errors
x = sqrt(2)*10^15;
y = sqrt(3);                    % sqrt() is a built-in MATLAB function for the square root operation.
sqrt_3 = (x+y)-x;
fprintf('x = %.16f\n',x);       % .16f says to display 16 values to the right of the decimal point.
fprintf('x + y = %.16f\n\n\n',x+y);

fprintf('sqrt(3) approx = %f\n',sqrt_3);
fprintf('sqrt(3) actual = %f\n',sqrt(3));

%% Part 3: Taylor polynomial
% the function here is assumed to be f(x) = cos(x)
% expansion will be around the point x0 = 0

n = 4;              % order of the taylor polynomial
a = -pi;            % [a,b] range that will be displayed
b = pi;
dx = .01;           % step size of data to print
x = a:dx:b;         % build array of x-values
N_x = size(x,2);    % counts number of elements in x. x is an 1 x N_x array. N_x is in the second dimension.
P = @(z) sum( z.^(0:2:n) .* (-1).^(0:1:(n/2)) ./ factorial(0:2:n)); % for given value of x, compute Taylor sum.
                    % The '.' notation makes an operation array-compatible.
                    % It's used only in conjunction with *, /, or ^.
                    % It transforms the data into an array. For example,
                    % 2.^(1:3) = [2, 4, 8]. 2^(1:3) is invalid syntax. 
                    % 2^3 is valid syntax.
                    % The function sum( ) takes input of an array, and it
                    % sums the elements in the array.
y_data = zeros(1,N_x);  % storage space for us to store P(x)
for i = 1:N_x       % loop over indices corresponding to the x-range
    y_data(i) = P(x(i));    % x(i) is the ith entry of the array x.
                            % P(x(i)) then applies the function P to x(i).
end

plot(x,y_data)      % plot Taylor polynomial
hold on             % allow for graphs on same plot
plot(x,cos(x))      % display true cosine function
hold off
xlabel('$x$','interpreter','latex','FontSize',15)       % label x-axis, y-axis, and title.
ylabel('$y$','interpreter','latex','FontSize',15)
title('Taylor approximation','interpreter','latex','FontSize',15)
legend('Taylor polynomial','cos(x)','interpreter','latex','FontSize',15) % this labels the individual curves on a single plot
%% Part 4: Example nested sum
% Here we compute P(x) = 1 - 2*x + 3*x^2  + . . . (N+1)*(-1)^N x^N evaluated at
% x0. FIX

N = 7;
x0 = .2;

Px = (N+1)*(-1)^N * x0 + N*(-1)^(N-1);  % starting value of loop
for i = 2:N                             % nested loop
    Px = Px * x0 + (N+1-i)*(-1)^(N-i);
end

fprintf('For N = %d, P(x) = %d\n',N,Px)

% To consider: what happens if x0 > 1? x0 = 1?

%% Part 5: Simple derivative convergence
% Here we study how [f(x+h)-f(x)]/h --> f'(x).
expon = 0:.1:15;            % exponent values. 
                            % This creates an array starting at 0,
                            % incrementing with step size .1 and ending at
                            % value 15. In other words, 
                            % [0, .1, .2, . . ., 14.9, 15].
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

%% Part 6: Function convergence
% Here we do the same as above, except we're seeing how f(x+h) --> f(x).
expon = 0:.1:15;            % exponent values
h = 10.^(-expon);           % step size
x = 0.1;                    % evaluation point
fp_actual = cos(x);         % true derivative

f = @(z) cos(z);
difference = f(x+h)-f(x);

absolute_error = abs(difference);

semilogy(expon,absolute_error,'b')
hold on   % this means more than one curve will be plotted on the same graph
semilogy(expon,10.^(-expon),'r')
hold off

xlabel('$-log_{10}(h)$','interpreter','latex','FontSize',15)
ylabel('absolute error','interpreter','latex','FontSize',15)
title('$|f(x+h)-f(x)|$','interpreter','latex','FontSize',15)
legend('absolute error','slope -1 line','interpreter','latex','FontSize',15) % this labels the individual curves on a single plot


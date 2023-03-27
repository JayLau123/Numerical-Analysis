%% Fixed Point Iteration
% this code, in a given interval [a,b], looks for a zero of
% f(x) = x^3+4x^2-10 using several candidate fixed point algorithms.
% This is example 4.3 from the textbook Numerical Analysis, Burden & Faires, 9th edition.

TOL = 10^(-6);  % desired accuracy (or tolerance)
Iter_Max = 50;  % maximum number of iterations

g1 = @(x) x - x.^3 - 4*x.^2 + 10;   % listed here is a list of potential functions to analyze
g2 = @(x) sqrt(10./x-4*x);
g3 = @(x) .5*sqrt(10-x.^3);
g4 = @(x) sqrt(10./(4+x));
g5 = @(x) x - (x.^3+4*x.^2-10)./(3*x.^2+8*x);

g3p = @(x) .25*3*x.^2./sqrt(10-x.^3);   % derivative of g3

g = @(x) g5(x);             % decide which function to use by setting g equal to g1, g2, g3, g4, or g5

a = 1;                      % interval of interest
b = 2;                      % for convergence (defines box).
A = 0;                      % sets the axis size for plotting
B = 3;

error_terms = zeros(1,Iter_Max);    % storage location for error as a function of iteration number

xn_p_1 = 1.5;   % x_{n+1}
                % xn will be x_n, but it is defined later
FP_error = 1;   % Fixed point error
Iter = 0;
while FP_error > TOL && Iter < Iter_Max     % keep running loop until stopping criteria is met
    Iter = Iter+1;                          % increment the iteration
    xn = xn_p_1;                            % move x-value to current step
    xn_p_1 = g(xn);                         % evaluate subsequent step using choice of function g
    
    fprintf('Iteration %d: %6.8f\n',Iter, xn);
    
    FP_error = abs(xn-xn_p_1);              % absolute error between steps
    error_terms(Iter) = FP_error;
    if FP_error > 10^2                      % Here we add an additional stopping criteria if error explodes.
        break
    end
end

semilogy(1:Iter,error_terms(1:Iter))        % plot error as a function of iteration in semilogy plot

xlabel('Iteration','interpreter','latex','FontSize',15)
ylabel('Absolute error','interpreter','latex','FontSize',15)
title('Error Convergence','interpreter','latex','FontSize',15)
legend('Error decay','interpreter','latex','FontSize',15)

figure(2)                                   % this figure illustrates how g satisfies or doesn't satisfy convergence criteria
plot(A:.001:B, A:.001:B)                    % plot diagonal line
hold on
plot(a:.001:b, g(a:.001:b))                 % plot the function g
line([a b b a a],[a a b b a])               % plot the box [a,b]x[a,b]
axis([A B A B])                             % define display region of interest, [x-min x-max y-min y-max]

hold off
%axis equal



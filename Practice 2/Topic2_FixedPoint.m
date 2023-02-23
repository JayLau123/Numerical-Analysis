%% Fixed Point Iteration
% this code, in a given interval [a,b], looks for a fixed point of f
% using the fixed point algorithm.

TOL = 10^(-6);
Iter_Max = 1000;
alpha = .9;     % adjust the slope, and see the convergence rate difference
                % code is designed for alpha < 1, though you can use higher
                % alpha.

f = @(x) sin(alpha*x);

a = -pi/2;          % window of interest
b = pi/2;

error_terms = zeros(1,Iter_Max);    % store error terms

xn_p_1 = pi/4;  % x_{n+1}
                % xn will be x_n, but it is defined later
FP_error = 1;   % Fixed point error
Iter = 0;
while FP_error > TOL && Iter < Iter_Max % loop completion criteria
    Iter = Iter+1;
    xn = xn_p_1;
    xn_p_1 = f(xn);
    
    fprintf('Iteration %d: %.8f\n',Iter, xn);
    
    FP_error = abs(xn-xn_p_1);
    error_terms(Iter) = FP_error;
end

semilogy(1:Iter,error_terms(1:Iter))    % error plot
hold on
plot(1:Iter, alpha.^(1:Iter))           % plot comparison line
hold off

xlabel('Iteration','interpreter','latex','FontSize',15)
ylabel('Absolute error','interpreter','latex','FontSize',15)
title('Error Convergence','interpreter','latex','FontSize',15)
legend('Error decay','line with slope $\log(\alpha)$','interpreter','latex','FontSize',15)

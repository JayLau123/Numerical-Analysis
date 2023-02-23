%% Fixed Point Iteration
% this code, in a given interval [a,b], looks for a fixed point of f
% using the fixed point algorithm.

TOL = 10^(-2);  % accuracy
Iter_Max = 4;   % from Corollary 2.5, N>=4

f = @(x) pi+0.5*sin(x/2);

a = 0;          % interval [0,2*pi], which meets the Theorem 2.3
b = 2*pi;

error_terms = zeros(1,Iter_Max);    
                % store error terms

p = pi;         % x_{n+1} guess the initial p_0 in the interval [0,2*pi]
                
FP_error = 1;   % initialization for fixed point error
Iter = 0;
while FP_error > TOL && Iter < Iter_Max % loop completion criteria
   
    Iter = Iter+1;
    p0 = p;
    p = f(p0);
    FP_error = abs(p-p0);
    error_terms(Iter) = FP_error;

    fprintf('Iteration %d: %.8f  abs error: %.8f\n',Iter, p, FP_error);
    
    % Iteration 1: 3.64159265  abs error: 0.50000000
    % Iteration 2: 3.62604886  abs error: -0.01554379
    % Iteration 3: 3.62699562  abs error: 0.00094676    
end

semilogy(1:Iter,error_terms(1:Iter))    % error plot

xlabel('Iteration','interpreter','latex','FontSize',15)
ylabel('Absolute error','interpreter','latex','FontSize',15)
title('Error Convergence','interpreter','latex','FontSize',15)
legend('Error decay','interpreter','latex','FontSize',15)


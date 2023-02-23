%% Modified Newton's Method
% For large m, system becomes less stable because of strong rounding error.

TOL = 10^(-10);
Iter_Max = 50;

% f(x) = e^x - 1 - x - x^2/2 - . . . x^m/m!.

m = 2;  % the mulitplicity of the root of f(x) = 0.
f = @(x) exp(x) - Topic2_exp(m,x);        % no derivative
fp = @(x) exp(x) - Topic2_exp(m-1,x);     % 1st derivative
fpp = @(x) exp(x) - Topic2_exp(m-2,x);    % 2nd derivative

g = @(x) x - f(x)*fp(x)/(fp(x)^2 - f(x)*fpp(x));    %   
%g = @(x) x - f(x)/fp(x);                           % Newton's Method
%g = @(x) x - f(x);                                 % standard fixed-point method

error_terms = zeros(1,Iter_Max);

xn_p_1 = 1;  % x_{n+1}, and assigning initial guess.
                % xn will be x_n, but it is defined later
FP_error = 1;   % Fixed point error
Iter = 0;
while FP_error > TOL && Iter < Iter_Max
    Iter = Iter+1;
    xn = xn_p_1;    
    xn_p_1 = g(xn);
    
    fprintf('Iteration %d: %e\n',Iter, xn);
    
    FP_error = abs(xn);
    error_terms(Iter) = FP_error;
end

semilogy(1:Iter,error_terms(1:Iter))

xlabel('Iteration','interpreter','latex','FontSize',15)
ylabel('Absolute error','interpreter','latex','FontSize',15)
title('Error Convergence','interpreter','latex','FontSize',15)
legend('Error decay','interpreter','latex','FontSize',15)

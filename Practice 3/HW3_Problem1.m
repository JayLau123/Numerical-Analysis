%% Cubic method

f2 =@(x) (x^3-3)/10;
fp =@(x) (3*x^2)/10;
fpp=@(x) (3*x)/5;


p03 = 1.5; % initial guess in the given interval:[1,2]
iter_Max = 20; 

error_terms3 = zeros(1,iter_Max);    % store error terms
FP_error3 = 1;
iter = 0;

p_n3 = p03+1;             
p3   = p03;              

fprintf('Cubic method\n');

while iter_Max > iter

    iter = iter+1;
    p_n3 = p3;
    p3   = p_n3 - f2(p_n3)/fp(p_n3)-(fpp(p_n3)/(2*fp(p_n3)))*(f2(p_n3)/fp(p_n3))^2; % implementing Newton's Method

    FP_error3 = abs(p_n3-p3);
    error_terms3(iter) = FP_error3;

    fprintf('Iteration %d: %.8f  abs error: %.8f\n',iter, p3, FP_error3);
   
end
fprintf('\n');

% after 20 iteration, the true solutionn is 1.44224957


%% Fixed Point Iteration

f1 = @(x) x-(x^3-3)/10;

a = 1;         
b = 2;
iter_Max = 20; 

error_terms1 = zeros(1,iter_Max);    % store error terms

p1 = 1.5;   % initial guess in the given interval:[1,2]     
                
FP_error1 = 1;   
iter = 0;

fprintf('Fixed Point Iteration\n');
while iter < iter_Max 
   
    iter = iter+1;
    p01 = p1;  % p01 = 1.5;
    p1 = f1(p01); 
    FP_error1 = abs(p1-1.44224957);
    error_terms1(iter) = FP_error1;

    fprintf('Iteration %d: %.8f  abs error: %.8f\n',iter, p1,FP_error1);
end

fprintf('\n');

%% NM
f2 =@(x) (x^3-3)/10;
fp=@(x) (3*x^2)/10;

p02 = 1.5; % initial guess in the given interval:[1,2]
iter_Max = 20; 

error_terms2 = zeros(1,iter_Max);    % store error terms
FP_error2 = 1;
iter = 0;

p_n     = p02+1;            
p2       = p02;              

fprintf('NM\n');

while iter_Max > iter

    iter = iter+1;
    p_n = p2;
    p2   = p_n - f2(p_n)/fp(p_n); 
    FP_error2 = abs(p2-1.44224957);
    error_terms2(iter) = FP_error2;

    fprintf('Iteration %d: %.8f  abs error: %.8f\n',iter, p2, FP_error2);

   
end
fprintf('\n');

semilogy(1:iter,error_terms3(1:iter),'g')    % error plot
hold on
semilogy(1:iter,error_terms1(1:iter),'r')    % error plot
hold on
semilogy(1:iter,error_terms2(1:iter),'b')    % error plot
hold off

xlabel('Iteration','interpreter','latex','FontSize',15)
ylabel('Absolute error','interpreter','latex','FontSize',15)
title('Error Convergence','interpreter','latex','FontSize',15)
legend('Error decay(Cubic method)','Error decay(Fixed point iterations)','Error decay(Newton method)','interpreter','latex','FontSize',15)

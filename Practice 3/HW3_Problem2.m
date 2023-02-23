%% NM-first positive root
f =@(x) (cos(x)+sin(sqrt(2)*x))*exp(-x);
fp=@(x) (-exp(-x))*(sin(x)+cos(x))+(exp(-x))*(sqrt(2)*cos(sqrt(2)*x)-sin(sqrt(2)*x));

p01= 2; % initial guess in the given interval:[1.5,2.5]
TOL = 1e-10; % desired accuracy tolerance
MAX_ITER = 1000; 

error_terms3 = zeros(1,MAX_ITER);    % store error terms
FP_error3 = 1;
iter = 0;

p_n     = p01+1;            
p3= p01;               
fprintf('first positive root:\n');

while abs(p_n-p3) > TOL && MAX_ITER > iter

    iter = iter+1;
    p_n = p3;
    p3   = p_n - f(p_n)/fp(p_n); % implementing Newton's Method
    FP_error3 = abs(p_n-p3);
    error_terms3(iter) = FP_error3;

    fprintf('Iteration %d: %.16f  abs error: %.16f\n',iter, p3, FP_error3);   
end

fprintf('\n');

%% NM2-second positive root
f =@(x) (cos(x)+sin(sqrt(2)*x))*exp(-x);
fp=@(x) (-exp(-x))*(sin(x)+cos(x))+(exp(-x))*(sqrt(2)*cos(sqrt(2)*x)-sin(sqrt(2)*x));

p03= 4.5; % initial guess in the given interval:[4,5]
TOL = 1e-10; % desired accuracy tolerance
MAX_ITER = 1000; 

error_terms3 = zeros(1,MAX_ITER);    % store error terms
FP_error3 = 1;
iter = 0;

p_n     = p03+1;            
p3= p03;              
fprintf('second positive root:\n');

while abs(p_n-p3) > TOL && MAX_ITER > iter

    iter = iter+1;
    p_n = p3;
    p3   = p_n - f(p_n)/fp(p_n); % implementing Newton's Method
    FP_error3 = abs(p_n-p3);
    error_terms3(iter) = FP_error3;

    fprintf('Iteration %d: %.16f  abs error: %.16f\n',iter, p3, FP_error3);   
end

fprintf('\n');

%% NM3-third positive root
f =@(x) (cos(x)+sin(sqrt(2)*x))*exp(-x);
fp=@(x) (-exp(-x))*(sin(x)+cos(x))+(exp(-x))*(sqrt(2)*cos(sqrt(2)*x)-sin(sqrt(2)*x));

p03= 7; % initial guess in the given interval:[6.5,7.5]
TOL = 1e-10; % desired accuracy tolerance
MAX_ITER = 1000; 

error_terms3 = zeros(1,MAX_ITER);    % store error terms
FP_error3 = 1;
iter = 0;

p_n     = p03+1;            
p3= p03;               
fprintf('third positive root:\n');                 

while abs(p_n-p3) > TOL && MAX_ITER > iter

    iter = iter+1;
    p_n = p3;
    p3   = p_n - f(p_n)/fp(p_n); % implementing Newton's Method
    FP_error3 = abs(p_n-p3);
    error_terms3(iter) = FP_error3;

    fprintf('Iteration %d: %.16f  abs error: %.16f\n',iter, p3, FP_error3);   
end



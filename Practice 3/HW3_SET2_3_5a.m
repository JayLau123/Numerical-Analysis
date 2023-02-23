
f =@(x) x^3-2*x^2-5;
fp=@(x) 3*x^2-4*x;

p0 = 3; % initial guess in the given interval:[1,4]
TOL = 1e-4; % desired accuracy tolerance
MAX_ITER = 100; 

iter = 0;
p_n     = p0+1;             % p & p_n will be the iterating values.
p       = p0;               % for the first time, abs(p_n-p)>TOL
                            
while abs(p_n-p) > TOL && MAX_ITER > iter
    p_n = p;
    p   = p_n - f(p_n)/fp(p_n); % implementing Newton's Method

    iter = iter+1;
end

fprintf('Iterations performed = %d\nThe final converged value p= %.8f\n',iter, p);
% Iterations performed = 4
% The final converged value p= 2.69064745

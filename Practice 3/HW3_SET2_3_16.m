
f =@(x) 0.5+0.25*x^2-x*sin(x)-0.5*cos(2*x);
fp=@(x) 0.5*x-sin(x)-x*cos(x)+sin(2*x);


TOL = 1e-5; % desired accuracy tolerance
MAX_ITER = 1000; 
iter = 0;

for i=1:3
    p0 = [pi/2, 5*pi, 10*pi];  % initial guess
    p_n     = p0(:,i)+1;             % p & p_n will be the iterating values.
    p       = p0(:,i);               % for the first time, abs(p_n-p)>TOL
    while abs(p_n-p) > TOL && MAX_ITER > iter
        p_n = p;
        p   = p_n - f(p_n)/fp(p_n); % implementing Newton's Method
        iter = iter+1;
    end
    fprintf('p0= %.8f\nIterations performed = %d\nThe final converged value p= %.8f\n',p0(:,i),iter, p);

end

% p0= 1.57079633
% Iterations performed = 15
% The final converged value p= 1.89548842
% p0= 15.70796327
% Iterations performed = 34
% The final converged value p= 1.89548900
% p0= 31.41592654
% Iterations performed = 1000
% The final converged value p= 968094030776597.00000000

% it's clear that when p0=10*pi, The sequence will not converge even
% reaches the maximum iterations. Perhaps the initial value of p0 is so far
% away from the true zero point so that it finds a unique point with this 
% method where f is nearly parallel to the x-axis, and derivative at this 
% point approaches 0, so the sequence won't converge.



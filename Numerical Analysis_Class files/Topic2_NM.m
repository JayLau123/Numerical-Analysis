function [p,iter] = Topic2_NM(f,fp,p0,TOL, MAX_ITER)

% This code runs the Newton's Method to a desired tolerance to find a zero.

% f  = function,         fp = function derivative, 
% both f and fp are functions.
% p0 = initial guess,   TOL = error tolerance.
% TOL = desired accuracy tolerance
% MAX_ITER is the maximum number of iterations before the code ends.

% p  = converged value, iter = iterations performed

if ~exist('TOL','var')      % if the tolerance is not given, set a default
    TOL = 1e-8;
end
if ~exist('MAX_ITER','var') % if the maximum iterations is not given, set a default.
    MAX_ITER = 1000;
end

iter = 0;
p_n     = p0+1;             % p & p_n will be the iterating values.
p       = p0;

while abs(p_n-p) > TOL && MAX_ITER > iter
    p_n = p;
    p   = p_n - f(p_n)/fp(p_n); % implementing Newton's Method

    iter = iter+1;
end

end
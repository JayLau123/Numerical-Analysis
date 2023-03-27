function value = Topic3_Lnk(x, xi, k)
% Lagandre Polynomial of (n,k) parameter
% x is the test input, and xi's are the interpolation points
% note n isn't an input value as n is given by the size of xi.

% 0 <= k <= n.

n = max(size(xi)) - 1;  % polynomial max order
xk = xi(k+1);

value = prod( (x-xi(1:k)) ) * prod( (x-xi((k+2):(n+1))) ) / (prod( (xk-xi(1:k)) ) * prod( (xk-xi((k+2):(n+1)))) );

end
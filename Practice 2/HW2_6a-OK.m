%% Bisection Method
% Here we use the bisection method to find x such that f(x) = 0
% we search the interval [1,2]

N = 17;                         % Max Iterations, comes from the Theorem 2.1 
f = @(x) 3*x-exp(x);            % the function we are searching for a zero         

a = 1;                          % [a,b] is the interval we are searching
b = 2;

values = zeros(1,N);            % These are the values of the midpoint of the selected interval in each step.
                              
for i = 1:N                     % loop over the iterations 从1到N共N次
    p = (a+b)/2;                % we let p be the midpoint
    values(i) = p;              % for plotting purposes, we store the value
    if f(p)*f(a) > 0            % check whether we should select [a,p] or [p,b]
        a = p;                  % update a if we select [a,p]
    else
        b = p;                  % update b if we select [p,b]
    end                         % note that a,b, and p are changing through the iterative process.
end

fprintf('After %d iterations, p = %.16f\n',N,p); % print to 16 decimal places the approximate solution
% After 17 iterations, p = 1.5121383666992188
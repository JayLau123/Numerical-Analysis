%% Bisection Method
% Here we use the bisection method to find x such that f(x) = 0
                       
f = @(x) x^2-4*x+4-log(x);      % the function we are searching for a zero         

a = 1;                          % [a,b]=[1,2]
b = 2;
N = 17;                         % Max Iterations, comes from the Theorem 2.1 

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

fprintf('[a,b]=[1,2], after %d iterations, p = %.16f\n',N,p); % print to 16 decimal places the approximate solution
%  After 17 iterations, p = 1.4123916625976562

a = 2;                          % [a,b]=[2,4]
b = 4;    
N = 18;                         % Max Iterations, comes from the Theorem 2.1      

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

fprintf('[a,b]=[2,4], after %d iterations, p = %.16f\n',N,p); % print to 16 decimal places the approximate solution
% After 18 iterations, p = 3.0571060180664062

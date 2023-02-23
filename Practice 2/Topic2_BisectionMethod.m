%% Bisection Method
% Here we use the bisection method to find x such that f(x) = 0
% we search the interval [a,b]

N = 40;                         % Max Iterations. Error is then on the order of 2^(-N).

f = @(x) x.^2-1/5;              % the function we are searching for a zero
true_zero = sqrt(1/5);          % the "true" value of the zero of f.
                                % if the user changes f, they should change
                                % true_zero as well.

a = -.1;                        % [a,b] is the interval we are searching
b = .9;

values = zeros(1,N);            % These are the values of the midpoint of the selected interval in each step.
                                % 初始化：创建1行，N列的数组，每个元素都是0，用来储存每次迭代的p的值

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
fprintf('For comparison, actual = %.16f\n',true_zero);

semilogy(1:N,abs(values - true_zero)/abs(true_zero))       % plot the convergence rate of our approximation to the "true" value
hold on  
% semilogy：半对数图，在x 轴上使用线性刻度，在y 轴上使用以10 为底的对数刻度来绘制x和y坐标
semilogy(1:N, .5.^(1:N) *10)                % we add a comparative line to show slope of our approximation
hold off
xlabel('n','interpreter','latex','FontSize',15)
ylabel('relative error','interpreter','latex','FontSize',15)
title('Bisection method','interpreter','latex','FontSize',15)
legend('relative error','slope $-log(2)$ line','interpreter','latex','FontSize',15)
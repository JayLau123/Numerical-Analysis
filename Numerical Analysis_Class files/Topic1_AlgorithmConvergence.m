%% Series convergence
% this code studies the convergence of the series sum((1/n)^p).

p = 7;                              % define choice of p
N = 500;                            % This defines the number of summation entries to be counted.
N_true = 1000;                      % N_true should be much larger than N. For numeric purposes we consider
                                    % the summing the first N_true entries as the "true"
                                    % solution.

S_N = zeros(1,N);                   % Storage space for summation value
S_true = sum((1:N_true).^(-p));     % "true" value of sum

S_N(1) = 1;                         % first entry

for i = 2:N                         % this for loop repeats itself, incrementing i through the values 2:N.
    S_N(i) = S_N(i-1) + i^(-p);     % sum through all entries recursively.
end

relative_error = abs(S_N - S_true)/abs(S_true);

loglog(1:N,relative_error)          % loglog(x,y) plots log(x) vs log(y).
hold on                             % allows for multiple functions to be plotted on the same graph
loglog(1:N,(1:N).^(1-p))
hold off

fprintf('truth = %f\n',S_true);
xlabel('n','interpreter','latex','FontSize',15)
ylabel('relative error','interpreter','latex','FontSize',15)
title('$\sum_{n=1}^N n^{-p}$','interpreter','latex','FontSize',15)
legend('relative error','slope 1-p line','interpreter','latex','FontSize',15)
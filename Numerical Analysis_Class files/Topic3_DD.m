function [div_diff,full_div] = Topic3_DD(xi,f_xi)
% this is computing the divided difference term f[x_0, . . . x_n], where
% x_0, . . . x_n is stored in xi, f(x_0), . . . f(x_n) in f_xi.
n = max(size(xi));

full_div = zeros(n,n);

full_div(:,1) = f_xi(:);        % first divided difference.

for i = 2:n                     % use a loop to generate 2-n divided difference terms.
   full_div(i:n,i) = (full_div( i:n,i-1) - full_div((i-1):(n-1),i-1)) ./ (xi(i:n)'-xi(1:(n-i+1))');
end
    
    div_diff = diag(full_div); % takes the diagonal of full_div as a vector.
    
end

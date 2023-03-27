function grad_V = Topic5_grad_LJ(q)
N = size(q,1);
% This computes the gradient Nx2 array of the potential evaluated at
% configuration q, which is number of particles x 2 sized array
% corresponding to particle positions in 2D.

LJp = @(r) -12*r.^(-13) + 6*r.^(-7); % LJ potential, derivative
grad_V = zeros(N,2);
for i = 1:N
    for j = 1:2
        q_norm = sqrt((q(:,1)-q(i,1)).^2 + (q(:,2)-q(i,2)).^2);     % distance of particles to particle of interest
        norm_less = [q_norm(1:(i-1));q_norm((i+1):N)];              % norms except of particle with itself
        index_less = [1:(i-1),(i+1):N];                             % all indices except the particle of interest
        grad_V(i,j) =  sum( (q(i,j)*ones(N-1,1)-q(index_less,j)).*norm_less.^(-1) .* LJp(norm_less)); % compute gradient elements
    end
end

end
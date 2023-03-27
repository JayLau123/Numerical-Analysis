function [energy,energy_kinetic] = Topic5_energy_LJ(w,v)

% for positions and velocities (w & v), this function computes total energy
% including kinetic and potential.

LJ2 = @(r) r.^(-6) - r.^(-3);

N = size(w,1);
energy = 0;
energy_kinetic = 0;

for i = 1:N
    energy_kinetic = energy_kinetic + .5*(v(i,1)^2+v(i,2)^2);
    Index= [1:(i-1),(i+1):N];
    r2 = (w(i,1)-w(Index,1)).^2+(w(i,2)-w(Index,2)).^2;
    energy = energy + sum(LJ2(r2));
end
energy = energy/2; % avoid double-counting

end
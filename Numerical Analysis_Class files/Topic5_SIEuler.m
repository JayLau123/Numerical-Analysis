% 1st order semi-implicit Euler's, Euler B
% This algorithm is symplectic
scale = 1.2;            % scale of atomic distances
config = 2;             % This sets two separate options for intitial data
                        % config = 1 corresponds to a line of points
                        % config = 2 corresponds to a 2D-array of points

T       = 20;           % Total time
steps   = 1000;         % how many time steps
dt      = T/steps;      % time interval length

A = 1;                  % potential strength of LJ
velocity = .25;
pin = 0;
                        % two alternative starting initial conditions
if config == 1
    N = 20;
    perturb_index = N/2;    % which index will have a perturbing initial condition
    q = scale*(1:N)'*[1,0];

    w0 = [0,0];             % position differential for perturbed index
    v0 = [.1,.3];           % velocity differential for perturbed index
    pin = 0;
else
    N = 36;
    perturb_index = 1;
    [X,Y] = meshgrid(1:sqrt(N));
    R = [1 cos(pi/3);0 sin(pi/3)];
    q = scale*R*[X(:)';Y(:)'];
    q = q';
    w0 = [0,0];             % position differential for perturbed index
    v0 = [.1,0];            % velocity differential for perturbed index
end

w = zeros(N,2,steps);
v = w;
w(:,:,1) = q;           % initial positions
v(:,:,1) = zeros(N,2);  % initial velocities

v(perturb_index,:,1) = v(perturb_index,:,1) + v0;   % perturb a site initial data
w(perturb_index,:,1) = w(perturb_index,:,1) + w0;

for i = 2:steps         % run the algorithm
    v(:,:,i) = v(:,:,i-1) - dt*Topic5_grad_LJ(w(:,:,i-1));
    w(:,:,i) = w(:,:,i-1)+dt*v(:,:,i);
    
    
    
    if pin                              % optional pin left-right atom feature
        w(N,:,i) = w(N,:,i-1);          % right fixed endpoint
        w(1,:,i) = w(1,:,i-1);          % left fixed endpoint
    end
    %v(:,:,i) = v_temp - A*(dt/2)*Topic13_grad_LJ(w(:,:,i));
end
%%
figure(1);                              % data plotting
plot1 = scatter(w(:,1,1),w(:,2,1),30,'fill');
if config == 1
xlim([-5 (N*scale+5)]);
temp = w(:,2,:);
YMAX = max(abs(temp(:)));
YMAX = max(YMAX,.1);
ylim([-YMAX*3 3*YMAX]);
xlabel('x')
ylabel('y')
title('semi-implicit Euler')

else
    xlim([-5 (sqrt(N)*scale+5)]);
    ylim([-5 (sqrt(N)*scale+5)]);
end

for k = 2:steps 
     plot1.XData = w(:,1,k); 
     plot1.YData = w(:,2,k); 
     %plot1.CData = concentration(k); 
     % pause 2/10 second: 
     pause(velocity*dt)
end
%% Energy
energy = zeros(1,steps);
energy2 = energy;
for i = 1:steps
    [energy(i),energy2(i)] = Topic5_energy_LJ(w(:,:,i),v(:,:,i));
end
%plot(dt*(0:(steps-1)),energy)
%hold on
%plot(dt*(0:(steps-1)),energy2)
plot(dt*(0:(steps-1)),energy+energy2)
hold off
%% Angular Momentum
momentum = zeros(1,steps);
for k = 1:steps
for i = 1:N
    momentum(k) = momentum(k) + w(i,1,k).*v(i,2,k)-w(i,2,k).*v(i,1,k);
end
end

plot(dt*(0:(steps-1)),momentum)




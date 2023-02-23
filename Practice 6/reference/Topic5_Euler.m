% 1st order Euler's

scale = 1.3;            % scale of atomic distances
config = 2;             % This sets two separate options for intitial data
                        % config = 1 corresponds to a line of points
                        % config = 2 corresponds to a 2D-array of points


T       = 10;           % Total time, simulation time
steps   = 1000;         % how many time steps
dt      = T/steps;      % time interval length


A = 1;                  % potential strength of LJ
velocity = .25;%
pin = 0;%
                
% 2个初始条件
% two alternative starting initial conditions 
if config == 1
    N = 20;
    perturb_index = N/2;    % which index will have a perturbing initial condition
    q = scale*(1:N)'*[1,0]; 

    %scale *(1:N)=1行，20列矩阵，转置之后变成20行，1列矩阵
    % 再与[1，0](1行，2列矩阵)相乘，得到20行2列矩阵 
    % q= 1.3 0;  2.6 0;  3.9 0; 5.2 0; q(1)=q(1,1)=1.3, q(1,2)=0, q(2,2)=0;
    % 20行，2列矩阵
 

    w0 = [0,0];             % position differential for perturbed index
    v0 = [.1,.3];           % velocity differential for perturbed index
    pin = 0;
else
    N = 36;
    perturb_index = 1;
    [X,Y] = meshgrid(1:sqrt(N));

    %{

X =

     1     2     3     4     5     6
     1     2     3     4     5     6
     1     2     3     4     5     6
     1     2     3     4     5     6
     1     2     3     4     5     6
     1     2     3     4     5     6

Y =

     1     1     1     1     1     1
     2     2     2     2     2     2
     3     3     3     3     3     3
     4     4     4     4     4     4
     5     5     5     5     5     5
     6     6     6     6     6     6

     %}

    R = [1 cos(pi/3);0 sin(pi/3)];

%{

R =

    1.0000    0.5000
         0    0.8660

2行2列矩阵

%}

    q = scale*R*[X(:)';Y(:)'];

    %{
[X(:)';Y(:)']=

 1     1     1     1     1     1     2     2     2     2     2     2     3     3     3     3
 1     2     3     4     5     6     1     2     3     4     5     6     1     2     3     4
.....

6   6   6   6   6   6
1   2   3   4   5   6

2行，36列

    %}


    q = q';                 % q为2行，36列，q'为36行，2列

    w0 = [0,0];             % position differential for perturbed index
    v0 = [.1,0];            % velocity differential for perturbed index
end


w = zeros(N,2,steps);

%{

zeros(N,2,steps)

相当于三维数据，
记录每一步的数据：（N，2）比如36行，2列

eg: 
w = zeros(2,2,3);

w(:,:,1) =

     0     0
     0     0

w(:,:,2) =

     0     0
     0     0

w(:,:,3) =

     0     0
     0     0

%}


v = w;                  % v和w有着一样的数据结构

w(:,:,1) = q;           % initial positions
v(:,:,1) = zeros(N,2);  % initial velocities


v(perturb_index,:,1) = v(perturb_index,:,1) + v0;   % perturb a site initial data
w(perturb_index,:,1) = w(perturb_index,:,1) + w0;



for i = 2:steps         % run the algorithm 从第二步开始算起
    w(:,:,i) = w(:,:,i-1)+dt*v(:,:,i-1); 
    % 下一步的位置取决于上一步的位置和速度
    v(:,:,i) = v(:,:,i-1) - dt*Topic5_grad_LJ(w(:,:,i-1)); 
    % 下一步的速度取决于上一步的速度和加速度，调用函数Topic5_grad_LJ
    
    
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
title('Euler')

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
energy = zeros(1,steps); % 存储每一步之后的energy
energy2 = energy;
for i = 1:steps
    [energy(i),energy2(i)] = Topic5_energy_LJ(w(:,:,i),v(:,:,i));
end
%plot(dt*(0:(steps-1)),energy)
%hold on
%plot(dt*(0:(steps-1)),energy2)
plot(dt*(0:(steps-1)),energy+energy2)
hold on

%% Angular Momentum
momentum = zeros(1,steps);
for k = 1:steps
for i = 1:N
    momentum(k) = momentum(k) + w(i,1,k).*v(i,2,k)-w(i,2,k).*v(i,1,k);
end
end

plot(dt*(0:(steps-1)),momentum)

%% LJ

function grad_V = Topic5_grad_LJ(q)

N = size(q,1);
% This computes the gradient Nx2 array of the potential evaluated at
% configuration q, which is number of particles x 2 sized array
% corresponding to particle positions in 2D.

LJp = @(r) -12*r.^(-13) + 6*r.^(-7); % LJ potential, derivative 勒纳德琼斯势的一阶导数

grad_V = zeros(N,2);
% 最后的输出结果：N行，2列，每个粒子的能量

for i = 1:N
    for j = 1:2
        q_norm = sqrt((q(:,1)-q(i,1)).^2 + (q(:,2)-q(i,2)).^2);   
        
        % distance of particles to particle of interest
        norm_less = [q_norm(1:(i-1));q_norm((i+1):N)]; 

        % norms except of particle with itself
        index_less = [1:(i-1),(i+1):N];   

        % all indices except the particle of interest
        grad_V(i,j) =  sum( (q(i,j)*ones(N-1,1)-q(index_less,j)).*norm_less.^(-1) .* LJp(norm_less)); 
        % compute gradient elements
    end
end

end

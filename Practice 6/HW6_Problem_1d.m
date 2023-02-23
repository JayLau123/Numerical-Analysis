%% Problem 1d
%% y(t)=[x(t);p(t)]

A=[0 1; -5 0];       % matrix from part a
h1=0.01;             % step size
N1=500;              % steps
w= zeros(2,N1);      % store x(t),p(t) in each step
w(:,1)=[0;1];        % initial value w(0)=[x(0);p(0)]

for i =2:N1
    w(:,i)=w(:,i-1)+h1.*(A*w(:,i-1));    % Euler's method with h=0.01
end

h2=0.001;            % more accurate: w~
N2=5000;             % steps
w2=zeros(2,N2);      % store x(t),p(t) in each step
wtrue(:,1)=[0;1];    % initial value, the same with w
w2(:,1)=[0;1];

wtrue =zeros(2,N1);  

for i=2:N2
    w2(:,i)=w2(:,i-1)+h2.*(A*w2(:,i-1));  % Euler's method with h=0.001
end

for j =1:N1  % 500 steps, and compare different h at each same step
    wtrue(:,j)=w2(:,10*j-9);  % each step of w2 corresponding to each step of wtrue
end

%t = 0:0.01:(2*pi);
%plot(cos(t)./sqrt(5),sin(t)); 
%hold on

%xlim=get(gca,'Xlim'); % gca代表此时的绘图区，'Xlim'代表X轴的范围'
%hold on

%hold on
line([-3,3],[0,0],'linestyle','-');
hold on
%line([500,2500],[1.05,1.05],'linestyle',':');

% E=1/2, p^2+5*x^2=1, p=sin(t), x=cos(t)/sqrt(5), ellipse curve
% in the coordinate diagram, the simple harmonic motion 
% both in x-direction and y-direction are finally synthesized into elliptical motion

plot1 = scatter(w(1,1),w(2,1),100,'filled','b');
%hold on
%plot2 = scatter(wtrue(1,1),wtrue(2,1),100,'filled','r');
hold off
grid on

xlim([-3,3]);
ylim([-3,3]);
xlabel('x(t) particle position','interpreter','latex','FontSize',15)
ylabel('p(t) particle velocity','interpreter','latex','FontSize',15)
title('particle motion with Euler method','interpreter','latex','FontSize',15)

for i=2:N1
    plot1.XData =w(1,i);
    plot1.YData =w(2,i);
    %plot2.XData =wtrue(1,i);
    %plot2.YData =wtrue(2,i);
    pause(0.5)
end





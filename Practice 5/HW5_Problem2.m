n=20;
interval=5; %[0,5]
j=0:20;
x1=j.*interval./n;

y=zeros(1,21); % store each error_func(m,n)
for j=0:20
    y(j+1)=error_func(x1(j+1),n);
end

subplot(2,1,1)
plot(x1,y)
xlabel('$[0,5],n=20$','interpreter','latex','FontSize',15)      
ylabel('$erf0$','interpreter','latex','FontSize',15)


Erf0=abs(y-erf(x1));
subplot(2,1,2)
plot(x1,Erf0)
xlabel('$[0,5],n=20$','interpreter','latex','FontSize',15)      
ylabel('$abs(erf0-erf)$','interpreter','latex','FontSize',15)

function value = error_func(m,n)
         sum=0;
         fun=@(t) exp(-t^2);    
         h=m/n;
         i=0:n;
         x2=i.*m/n;
         for k=2:n
             sum=sum+fun(x2(k)); 
         end

         value=(h./2)*(fun(0)+fun(x2(n+1))+2*sum);
         value=value*2./(sqrt(pi));
end

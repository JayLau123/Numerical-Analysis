expon = 1:20;                          
h = 10.^(-expon.*0.5);     
x = .5;                    
fp_actual = 10*cos(5*x)-3*sin(3*x);       

f = @(z) 2*sin(5*z)+cos(3*z);   

abs_error1 = abs(derivFD(f, h, x) - fp_actual);    
abs_error2 = abs(deriv3PM(f, h, x) - fp_actual);   
abs_error3 = abs(deriv5PM(f, h, x) - fp_actual);   

subplot(2,1,1)
loglog(h,abs_error1,'b') 
hold on
loglog(h,abs_error2,'r')  
hold on
loglog(h,abs_error3,'g')  
hold off

xlabel('$h$','interpreter','latex','FontSize',15)    
ylabel('absolute error','interpreter','latex','FontSize',15)
title('error as a function of h','interpreter','latex','FontSize',15)
legend('forward difference formula','three-point midpoint formula','five-point midpoint formula') 

subplot(2,1,2)
loglog(h,abs_error1,'-',h,abs_error2,':')

function deriv = derivFD(f, h, x)
        deriv = (f(x+h)-f(x))./h; 
end


function deriv = deriv3PM( f, h, x)
        deriv = (f(x+h)-f(x-h))./(2*h);
end

function deriv = deriv5PM( f, h, x)
        deriv = (f(x-2*h)-8*f(x-h)+8*f(x+h)-f(x+2*h))./(12*h);
end

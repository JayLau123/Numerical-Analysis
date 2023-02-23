% Define a function in a script file 

z=1:10;
a=sum(z(:))
b=numel(z)
c=myaverage(z)

error1 = abs(myaverage(z)- a);
error1

function ave = myaverage(x)
    ave = sum(x(:))/numel(x);     
end


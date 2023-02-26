program main 
    implicit none
    real,parameter::g=9.8,pi=3.1415926
    
    write(*,*)'please enter these numbers as initial angle,intervals,the length of string:'
    read(*,*)angle0,N,length
    write(*,*) myfun1(angle0,N,length) 
    
    contains
    
    function myfun1(angle0,N,length)
        implicit none
        integer N,i
        real,dimension(:),allocate::y,y_1,y_2
        real myfun1,dx,k1,k2,k3,k4,angle0,length,
    dx=1E-3
    angle=angle*(pi/180)
    
    allocate(y(N))
    allocate(y_1(N))
    allocate(y_2(N))
    y(1)=angle0
    y_1(1)=0
    y_2(1)=-g*sin(angle0)/length
    
    do i=2,N
        k1=dx*(y_1(i-1))
        k2=dx*(y_1(i-1)+0.5*k1)
        k3=dx*(y_1(i-1)+0.5*k2)
        k4=dx*(y_1(i-1)+k3)
        y(i)=y(i-1)+(k1+2.0*k2+2.0*k3+k4)/6.0
        
        y_1(i)=y_1(i-1)+dx*y_2(i-1)
        y_2(i)=-g*sin(y(i))/length
        
        if (y(i)<0)then
            write(*,*) 4*i*dx
            exit
        end if
    end do
    
    deallocate(y)
    deallocate(y_1)
    deallocate(y_2)
    
    end function
    
end 
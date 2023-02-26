program main
    implicit none
    real(4),parameter :: eps=1.0E-5
    real(4) :: a,b,c,d,answer
    a=0.0
    b=1.7
    do while ( abs(a-b)>eps)
        c=b-(b-a)*0.618
        d=a+(b-a)*0.618
        if(func(c)>func(d)) then
            a=c
        else
            b=d
        end if
        write(*,*) 'c=',c,'d=',d
    end do
    answer=(c+d)/2.0
    write(*,*) 'x min =',answer
contains
    real function func(x)
        implicit none
        real :: x
        func=cos(exp(x))
    end function func
end program main

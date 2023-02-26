program main
    implicit none
    real :: x
    read(*,*) x
    write(*,*) fun(x)
CONTAINS
    FUNCTION fun(y)
        real :: y, fun
        if (y > 0) then
            fun=x**2 + SQRT(SQRT(1+x))
        elseif (y == 0)  then
            fun=0
        else
            fun=x**2 - SQRT(SQRT(1-x))
        end if
    END FUNCTION fun
end

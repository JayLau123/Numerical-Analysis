program my_int
    implicit none
    real, external :: fun
    integer :: i, N
    real :: x1=0.0, x2=1.0, dx, fsum, xnow
    !real,dimension(0:N) :: xpt, ypt
    
    N = 100
    read(*,*) N
    dx = (x2-x1)/N
    fsum = 0.0
    xnow = x1
    do i= 0, N-1
        fsum = fsum + 0.5*dx*(fun(xnow)+fun(xnow+dx))
        xnow = xnow +dx
    end do
    write (*,*) 'Integrate   f(x) = ', fsum
    write (*,*) '          should be', exp(1.0)
end
function fun(x)
     implicit none
     real x, fun
     fun=1.0 + exp(x)
end function

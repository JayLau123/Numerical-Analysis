program main
  implicit none
  integer n
  real y
  real,external :: f, myintegr
  
  write(*,'(A$)') 'Please input number of interval: '
  read(*,*) n
  y=myintegr(n,f)
  write(*,*) 'y=', y, '   Exact Value', exp(1.0)
end program  

function f(x)
    implicit none
    real f, x
    f = 1.0 + exp(x)
    !write(*,*) 'f=', f
end function f

function myintegr(n, f)
    implicit none
    real myintegr
    integer n
    real,external :: f
    ! Local Var
    integer i
    real x1, x2, mysum, step

    mysum = 0.0
    ! n is number of interval
    ! 0.0 - 1/n - 2/n - ... - n/n
    step = 1.0/n
    do i= 1, n
      x1 = (i-1)*step
      x2 = x1 + step
      !write(*,*) i, x1, x2

      mysum = mysum + 0.5*(f(x1)+f(x2))*step
    end do
    myintegr= mysum
end function myintegr


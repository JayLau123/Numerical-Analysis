program main
  implicit none
  external mysub
  real, external :: fun
  real :: x, y
  
  x = 2.0
  y = 5.0
  call mysub(x, y, fun)
  ! mysub is f(x) + f(y)
  end
  subroutine mysub (x, y, f)
     implicit none
	 real x, y
	 real, external :: f
         write(*,*) f(x)+f(y)
  end subroutine
  
  function fun(x)
    implicit none
	real x, fun
        fun= sin(x) + exp(-0.5*x)
  end function
  



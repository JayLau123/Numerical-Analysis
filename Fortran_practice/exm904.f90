module MyRoot
  implicit none
  real,parameter :: epsilon =1.0E-5
contains
  real function secant(a,b,func)
    implicit none
    real :: a,b,c,fa,fb,fc
    real,external :: func
    fa = func(a)
    fb = func(b)
    c = a - fa*(b-a)/(fb-fa)
    fc = func(c)
    do while ( abs(fc) > epsilon )
      a = b
      b = c
      fa = func(a)
      fb = func(b)
      c = a-fa*(b-a)/(fb-fa)
      fc = func(c)
      write(*,*) 'Secant was called !', c, fc
    end do
    secant = c
  end function
end module MyRoot

real function f1(x)
  implicit none
  real x
  f1= sin(x)
end function

program main
  use MyRoot
  implicit none
  real :: a,b,answer
  real,external :: f1
  
  write(*,*) "请输入两个猜测点"
  read (*,*) a, b
  answer= secant(a,b,f1)
  write(*,'("x=",F9.6)') answer 
end

module MyRoot
  implicit none
  real,parameter :: epsilon =1.0E-5
contains
  real function newton(a,func,dfunc)
    implicit none
    real a,c,fa,fc
    real,external :: func,dfunc
    !func为输入的函数，dfunc为函数的导数
    c=a-func(a)/dfunc(a)
    fc=func(c)
    do while ( abs(fc) > epsilon )
      a=c
      c=a-func(a)/dfunc(a)
      fc=func(c)
      write(*,*) 'Newton was called !', c, fc
    enddo
    newton = c
  end function
end module MyRoot

real function f1(x)
  implicit none
  real x
  f1 = x*x + sin(x) -7
end function f1

real function f1d(x)
   implicit none
   real x
   f1d = 2*x + cos(x)
end function f1d

program main
  use MyRoot
  implicit none
  real :: a, answer
  real,external :: f1, f1d
  
  write(*,*) "请输入初始猜测点"
  read (*,*) a
  answer= newton(a, f1, f1d)
  write(*,'("x=",F9.6)') answer 
end

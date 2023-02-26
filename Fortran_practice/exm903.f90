module MyRoot
  implicit none
  real,parameter :: epsilon =1.0E-5
contains
  real function bisect(a,b,func)
    implicit none
    real :: a,b,c,fa,fb,fc
    real,external :: func
    c = (a+b)/2.0
    fc = func(c)
    do while ( abs(fc) > epsilon )
      fa = func(a)
      fb = func(b)
      if(fa*fc<0) then 
        b = c
      else
        a = c
      end if
      c = (a+b)/2.0
      fc = func(c)
      write(*,*) 'Bisect was called !'
    enddo
    bisect = c
  end function
end module MyRoot

real function f1(x)
  implicit none
  real x
  f1=(x+4.1082)*(x-5.3571)
end function

program main
  use MyRoot
  implicit none
  real :: a,b,answer
  real,external :: f1
  do
      write(*,*) "请输入两个猜测点"
      read (*,*) a,b
      ! f1(a)*f1(b)<0的猜测值有效
      if(f1(a)*f1(b)<0) exit
      write(*,*) "不正确的猜测值"
  enddo
  answer= bisect(a,b,f1)
  write(*,'("x=",F9.6)') answer 
end

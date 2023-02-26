program main
  implicit none
  external test,add,multiply
  real::a=12.0,b=48.0
  call test(a,b,add)
  call test(a,b,multiply)
end

subroutine test(x,y,sub)
  implicit none
  external sub
  real  x,y
  call sub(x,y)
end subroutine
subroutine add(x,y)
  implicit none
  real x, y,temp
  temp=x+y
  write(*,'("x+y=",f10.5)') temp
end subroutine
subroutine multiply(x,y)
  implicit none
  real x, y,temp
  temp=x*y
  write(*,'("x*y=",f10.5)') temp
end subroutine

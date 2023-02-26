subroutine my_sub(x,y)
  implicit none
  real x,y
  write (*,'(A,F10.6)') ' Parmeter 1 =', x
  write (*,'(A,F10.6)') ' Parmeter 2 =', y
  x = x + 1
  y = y + 1
  write (*,'(A,F10.6)') ' Now Parmeter 1 =', x
end subroutine

program exam705
  implicit none
  real:: a=1.0,b=2.0,c=3.0,d=4.0
  external my_sub
  call my_sub(a+b*c,d) 
end

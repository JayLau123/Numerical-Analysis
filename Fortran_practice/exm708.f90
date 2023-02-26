program main
  implicit none
  external my_sub5,my_sub6
  integer i,j
  real array(3,2)
  data array /1.0,2.0,3.0,4.0,5.0,6.0/
  do i=1,2
     do j=1,3
       write (*,'("array(",i2,",",i2,")=",f10.5)') j,i,array(j,i)
     end do
  end do
  call my_sub5(array)
  call my_sub6(array(3,1))
end
subroutine my_sub5(ar)
  implicit none
  integer i
  real ar(5)
  do i=1,5
     write (*,'("sub array(",i2,")=",f10.5)') i, ar(i)
end do
end subroutine
subroutine my_sub6(ar)
  implicit none
  integer i
  real ar(3)
  do i=1,3
     write (*,'("sub array(",i2,")=",f10.5)') i, ar(i)
end do
end subroutine

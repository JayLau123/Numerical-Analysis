subroutine prt_element( ar )
  implicit none
  integer ii
  real,dimension(3) :: ar
  do ii = 1, 3
    write (*,*) '第', ii, '数组元素=', ar(ii)
  end do
  write (*,*)

  !ar(1) = 9.0

end subroutine

program exam707
  implicit none
  real,dimension(8) :: mydata
  external prt_element
  
  mydata = (/ 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0 /)
  call prt_element( mydata )
  call prt_element( mydata(3) )
  call prt_element( mydata(5) )
  call prt_element( mydata(1:5:2) )
  
  write (*,*) 'mydata = ', mydata
end

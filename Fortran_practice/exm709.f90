program exam709
  implicit none
  external my_sub7
  integer i,j
  real,dimension(3,2) :: mydata

  mydata = reshape( (/1.0,2.0,3.0,4.0,5.0,6.0/), (/3,2/) )
  do i =1,3
    write (*,*) mydata(i,:)
  end do
  call prt_array( mydata )
end

subroutine prt_array(ar)
  implicit none
  integer i,j
  real,dimension(2,2) :: ar
  do i=1,2
     do j=1,2
        write (*, '(A,I2,A,I2,A,F8.4)') 'Matrix[', i, '][', j, ']=', ar(i,j)
     end do
 end do
end subroutine

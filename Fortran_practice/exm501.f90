program example501
  implicit none
  integer :: i, j, k, m, n

  do i = 1,5
    write(*,*) 'i=', i
  end do
  write(*,*)
  do j = 1, 10, 2
    write(*,*) 'j=', j
  end do
  write(*,*)
  do k = -1, -10, -2
    write(*,*) 'k=', k
  end do
  write(*,*)
  n = 5
  do  m = 1, n*n, n
    write(*,*) 'm=', m
  end do
  write(*,*) 'm final=', m

end program

program example66
  implicit none
  integer x, n
  integer, parameter :: SizeMax = 200
  integer, dimension(SizeMax) :: arr
  integer, dimension(:), allocatable :: old_arr, new_arr
  
  write(*,*) 'Input positive integer (-1 to exit)'
  ! Static Array Implementation
  write (*,*) 'Static Array'
  read (*,*) x
  n = 0
  do while (x /= -1)
    n = n + 1 
    arr(n) = x
    read (*,*) x
  end do
  write (*,*) 'data_number=', n
  write (*,*) (arr(x), x = n, 1, -1)

  ! Dynamic Array Implementation
  write(*,*) 'Dynamic Array'
  ALLOCATE(new_arr(0))
  read (*,*) x
  n = 0
  do while ( x /= -1)
    n = n + 1
    ALLOCATE(old_arr(n-1))
    old_arr = new_arr
    DEALLOCATE(new_arr)
    ALLOCATE(new_arr(n))
    new_arr(1:n-1) = old_arr 
    new_arr(n) = x
    DEALLOCATE(old_arr)
    read (*,*) x
  end do
  write (*,*) 'data_number=', n
  write (*,*) (new_arr(x), x = n, 1, -1)
end
                   

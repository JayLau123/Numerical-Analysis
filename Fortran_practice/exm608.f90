program example68
    implicit none
    integer, parameter :: xsize = 8
    integer i, j, temp, A(xsize)

    A = (/51, 34, 37, 54, 72, 12, 58, 40/)
    write(*,*) '排序前数据：'
    write(*,100) (A(i), i = 1, xsize)
    do i = 1, xsize-1
      do j = i+1, xsize
        if ( A(i) > A(j) ) then
          temp = A(j)
          A(j) = A(i)
          A(i) = temp
        endif
      end do
    end do
    write (*,*) '排序后数据:'
    write (*,100) (A(i), i = 1, xsize)
100 format(8I4)
END 

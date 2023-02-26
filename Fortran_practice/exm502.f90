! Be careful about kind
! you can use real or real(8)
program example502
    implicit none
    integer :: i, factorial = 1
    real :: xfact = 1.0

    write(*,*) '1µ½15µÄ½×³ËÎª: '
    do i = 1, 15
      factorial=factorial * i
      xfact = xfact * i
      write (*,*) i, '! = ', factorial,  xfact
    end do
end program

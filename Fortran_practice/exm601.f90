program example601
    implicit none
    integer :: i, x=70
    integer, parameter :: ind_min = -2
    integer,dimension(-2:2) :: num
    real :: ysum=0.0, avg

    num(ind_min) = 100    ! 下标为整型常量
    num(-1) = 200
    num(0) = 300 + x / 2
    num(1) = num(0) * num(-1)     ! 下标为整型常数
    do i= -2,1
      ysum = ysum + num(i)          ! 下标为整型变量
   end do
   avg = ysum / 4.0
   write(*,*) 'avg=', avg
end

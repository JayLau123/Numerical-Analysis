program example601
    implicit none
    integer :: i, x=70
    integer, parameter :: ind_min = -2
    integer,dimension(-2:2) :: num
    real :: ysum=0.0, avg

    num(ind_min) = 100    ! �±�Ϊ���ͳ���
    num(-1) = 200
    num(0) = 300 + x / 2
    num(1) = num(0) * num(-1)     ! �±�Ϊ���ͳ���
    do i= -2,1
      ysum = ysum + num(i)          ! �±�Ϊ���ͱ���
   end do
   avg = ysum / 4.0
   write(*,*) 'avg=', avg
end

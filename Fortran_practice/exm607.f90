program example67
  implicit none
  integer :: i, n, io
  real :: value, xsum, ex, dx
  real, dimension(50) :: x
  !从键盘输入数据
  write(*,*) 'Input data'
  xsum = 0.0
  n = 0
  do
    read (*,*,IOSTAT = io) value
    if (io /= 0) exit
    n = n + 1
    x(n) = value
    xsum = xsum + value
  end do
  ex = xsum / n
  xsum = 0.0
  do i = 1, n
    xsum = xsum + (x(i) - ex)**2
  end do
  dx=sqrt(xsum/(n-1))
  WRITE (*,"(1X,'数据[',I3,'] = ',F10.2)") (i,x(i),i=1,n)
  WRITE (*,"(1X,'平均值：  ',F10.2)") ex
  WRITE (*,"(1X,'标准偏差：',F10.2)") dx
end 

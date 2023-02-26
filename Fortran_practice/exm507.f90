program example15
  implicit none
  integer :: m, n, r1, r2, r3, gcd, lcm
  write(*,*) '输入两个自然数：'
  read(*,*) m, n
  r1 = m
  r2 = n
  do while(r2 /= 0)
      r3 = mod(r1,r2)  !求r1除以r2的余数
      r1 = r2
      r2 = r3
  end do
  gcd = r1
  lcm = m * n / gcd
  write(*,'(2X,I3,A,I3,A,I3)') m, '和', n, '的最大公约数为：', gcd
  write(*,'(2X,I3,A,I3,A,I3)') m, '和', n, '的最小公倍数为：', lcm
end

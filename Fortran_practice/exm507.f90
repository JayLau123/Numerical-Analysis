program example15
  implicit none
  integer :: m, n, r1, r2, r3, gcd, lcm
  write(*,*) '����������Ȼ����'
  read(*,*) m, n
  r1 = m
  r2 = n
  do while(r2 /= 0)
      r3 = mod(r1,r2)  !��r1����r2������
      r1 = r2
      r2 = r3
  end do
  gcd = r1
  lcm = m * n / gcd
  write(*,'(2X,I3,A,I3,A,I3)') m, '��', n, '�����Լ��Ϊ��', gcd
  write(*,'(2X,I3,A,I3,A,I3)') m, '��', n, '����С������Ϊ��', lcm
end

program  sinvalue
  implicit none
  integer :: n=1,maxterms=10
  real(8),parameter::pi=3.1415926,eps=1e-7
  real(8) ::x, t, sinx
  write(*,'(a$)') '������һ������ֵ:'
  read(*,*) x
  x=x*pi/180.0   !ת��Ϊ����ֵ
  t=x
  sinx=t
  do while((abs(t)>eps).and.(n<=maxterms))
        n=n+1
        t=-t*x*x/((2*n-2)*(2*n-1))
        sinx=sinx+t
  end do
  if(abs(t)>eps) then
    write(*,*) '��ɢ���������ܵõ������'
  else
    write(*,*) '�������õ�������ֵ��',sinx
    write(*,*) 'fortran 90�ڲ�����ֵ��',sin(x)
  end if
end

program  sinvalue
  implicit none
  integer :: n=1,maxterms=10
  real(8),parameter::pi=3.1415926,eps=1e-7
  real(8) ::x, t, sinx
  write(*,'(a$)') '请输入一个度数值:'
  read(*,*) x
  x=x*pi/180.0   !转换为弧度值
  t=x
  sinx=t
  do while((abs(t)>eps).and.(n<=maxterms))
        n=n+1
        t=-t*x*x/((2*n-2)*(2*n-1))
        sinx=sinx+t
  end do
  if(abs(t)>eps) then
    write(*,*) '发散级数，不能得到结果。'
  else
    write(*,*) '程序计算得到的正弦值：',sinx
    write(*,*) 'fortran 90内部函数值：',sin(x)
  end if
end

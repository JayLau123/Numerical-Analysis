function my_exp(x,n)
    implicit none
    integer :: n,i
    real :: x,temp,my_exp
    temp=1.0
    my_exp=1.0
    do i=1,n
        temp=temp*x/(1.0*i)
        my_exp=my_exp+temp
    end do
    !x = 7
    !n = n + 1
end function

program exam704
  implicit none
  integer :: n
  real, external :: my_exp
  write (*,*) '请输入截断处多项式的次数'
  read (*,*) n
  write (*,*) '计算结果为：'
  write (*,'("exp(1.0)=",f10.6)') my_exp(1.0,n)
  write (*,'("exp(3.0)=",f10.6)') my_exp(3.0,n)
  write (*,*) 'n = ', n
end

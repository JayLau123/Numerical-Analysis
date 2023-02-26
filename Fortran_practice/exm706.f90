function my_sum(n)
  implicit none
  integer n,i,temp
  integer my_sum
  temp=0
  do i=1,n
     temp=temp+i
  end do
  my_sum=temp
end function

program exam706
    implicit none
    external my_sum
    integer n,my_sum
    write (*,'(A$)') '请输入N: '
    read (*,*) n
    write (*,'(A,I6)') '计算结果  SUM=',my_sum(n)
end

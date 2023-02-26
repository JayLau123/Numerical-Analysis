program example503
    implicit none
    real :: limit, x, term=1.0, tsum=1.0
    integer :: n,i
    !用Taylor展开求指数函数的数值exp(x)=?
    write(*,'(A$)') '请输入x＝'
    read (*,*) x
    write(*,'(A$)') '请输入n＝'
    read (*,*) n
    do i=1,n
        term = (term * x)/(1.0*i)
        tsum = tsum + term
    end do
    write(*,*) 'e的',x,'次方=',tsum,'(Taylor级数展开到',n,'项)'
    write(*,*) '精确值=',exp(x)
    write(*,*) '误差', abs(exp(x) - tsum)
    write(*,*) '相对误差', abs(exp(x) -tsum )/exp(x)*100.0 , '%'
end

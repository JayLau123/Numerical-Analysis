program example503
    implicit none
    real :: limit, x, term=1.0, tsum=1.0
    integer :: n,i
    !��Taylorչ����ָ����������ֵexp(x)=?
    write(*,'(A$)') '������x��'
    read (*,*) x
    write(*,'(A$)') '������n��'
    read (*,*) n
    do i=1,n
        term = (term * x)/(1.0*i)
        tsum = tsum + term
    end do
    write(*,*) 'e��',x,'�η�=',tsum,'(Taylor����չ����',n,'��)'
    write(*,*) '��ȷֵ=',exp(x)
    write(*,*) '���', abs(exp(x) - tsum)
    write(*,*) '������', abs(exp(x) -tsum )/exp(x)*100.0 , '%'
end

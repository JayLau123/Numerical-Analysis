program example41
    implicit none
    Integer :: n, m = 2, k = 0
    
    write(*,'(A$)') 'Please Input An Integer Number: '
    read (*,*) n
    do while ((m <= int(sqrt(1.0*n))).AND.(k==0))
        if (mod(n,m)==0) then
            k=1
        else
            m = m + 1
        end if
    end do
    if (k==0) then
        write (*,*)  '������'
    else
        write (*,*)  '��������'
    end if
end program

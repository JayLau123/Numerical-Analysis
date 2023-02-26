program  narcissus
    implicit none
    integer :: i,n1,n2,n3,num=0,temp
    write(*,*) '三位数的水仙花数有：'
    do i=100,999
        n3=i/100          !求百位数字
        n2=(i-n3*100)/10  !求十位数字
        n1=i-n3*100-n2*10 !求个位数字
        temp=n3*n3*n3+n2*n2*n2+n1*n1*n1
        if (temp ==i )  then
            write(*,*)i,'是一个水仙花数。'
            num=num+1
        end if
    end do
    write(*,*) '三位数的水仙花数有',num,' 个。'
end

program  narcissus
    implicit none
    integer :: i,n1,n2,n3,num=0,temp
    write(*,*) '��λ����ˮ�ɻ����У�'
    do i=100,999
        n3=i/100          !���λ����
        n2=(i-n3*100)/10  !��ʮλ����
        n1=i-n3*100-n2*10 !���λ����
        temp=n3*n3*n3+n2*n2*n2+n1*n1*n1
        if (temp ==i )  then
            write(*,*)i,'��һ��ˮ�ɻ�����'
            num=num+1
        end if
    end do
    write(*,*) '��λ����ˮ�ɻ�����',num,' ����'
end

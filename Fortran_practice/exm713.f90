program main
    implicit none
    integer(4) :: n=0
    character (len=1) :: a='A', b='B', c='C' 
    do while (n<=0)
        write(*,*) '�����̵ĸ���'
        read (*,*)  n
    end do
    write(*,*) '������Ҫ��',n,'�����Ӵ�',a,'�ƶ���',b
    call hanoi(n,a,b,c)
contains
    RECURSIVE SUBROUTINE hanoi (i,x,y,z)
    integer, intent(in) :: I
    character (len=1) :: x, y, z
        if(i > 0) then
            call hanoi(i-1,x,z,y)
            write (*,10) "��",i,"�����ӣ���",x,"������",y,"��"
            call hanoi(i-1,z,y,x)
        end if
10 format(A,I3,5A)
    end subroutine hanoi
end

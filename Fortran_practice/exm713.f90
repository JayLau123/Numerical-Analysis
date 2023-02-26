program main
    implicit none
    integer(4) :: n=0
    character (len=1) :: a='A', b='B', c='C' 
    do while (n<=0)
        write(*,*) '输入盘的个数'
        read (*,*)  n
    end do
    write(*,*) '我们需要把',n,'个盘子从',a,'移动到',b
    call hanoi(n,a,b,c)
contains
    RECURSIVE SUBROUTINE hanoi (i,x,y,z)
    integer, intent(in) :: I
    character (len=1) :: x, y, z
        if(i > 0) then
            call hanoi(i-1,x,z,y)
            write (*,10) "第",i,"个盘子：从",x,"柱移向",y,"柱"
            call hanoi(i-1,z,y,x)
        end if
10 format(A,I3,5A)
    end subroutine hanoi
end

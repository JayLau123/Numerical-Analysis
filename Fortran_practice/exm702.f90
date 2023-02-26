!  Equations
!      x + y = 3
!      2x + y = 4
!  Exact solve
!      x = 1 y = 2

PROGRAM example72
    implicit none
    integer :: I, J
    real,dimension(2,3) ::A
    real x, y
    read(*,*) ((A(I,J), J=1,3), I=1,2)
    x = del(A,1)/del(A,3)
    y = del(A,2)/del(A,3)
    WRITE(*,*) ((A(I,J), J=1,3), I=1,2)
    WRITE(*,*) 'x= ', x, 'y= ', y
100  FORMAT(3X,3F6.0)
  CONTAINS
    FUNCTION del(coff, flag)
      real,dimension(2,3) :: coff
      integer flag
      real del
    
      if (flag ==1) then
            del = coff(1,3)*coff(2,2) - coff(2,3)*coff(1,2)
      else if(flag ==2) then
            del = coff(1,1)*coff(2,3) - coff(2,1)*coff(1,3)
      else
            del = coff(1,1)*coff(2,2) - coff(2,1)*coff(1,2)
      end if
    end function
END

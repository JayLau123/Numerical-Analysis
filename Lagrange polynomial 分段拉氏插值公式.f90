program main 
    implicit none 
    real(8)::x0(10),y0(10),mx(5),my(5)
    integer i
    real x
    real,external ::lagN
    mx=(/5.0,13.0,55.0,72.0,103.0/)
    
    open(unit=10,file='exp9_input.txt')
    do i=0,10
        write(10,'(2F8.3)') x0(i),y0(i)
    end do
    close(10)
    
    write(*,*)' ‰»Îx'
    read(*,*)x
    write(*,*) lagN(x,x0,y0,N)
    end

function lagN(x,x0,y0,N)
    implicit none
    real lagN,x
    integer N
    real,dimension(0:N)::x0,y0
    real ycoff
    integer i,j
    
    lagN = 0.0
    do i=0,N
        ycoff=1.0
        do j=0,N
            if(i/=j) then 
                ycoff = ycoff*(x-x0(j))/(x0(i)-x0(j))
            end if
        end do
        lagN=lagN+ycoff*y0(i)
    end do
    end function
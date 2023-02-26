function f(x,y,z,w)
    implicit none
    real f,x,y,z,w

    f=x+y**3+z**5+w**7
    end function
    
program main
    implicit none 
    integer i,N
    real x,y,z,w,vtotal,sumf,iavg,siavg
    real,external::f

    siavg=(1.0/2)+(1.0/4)+(1.0/6)+(1.0/8)
    write(*,*)'input the number as N'
    read(*,*) N
    sumf=0.0
    vtotal=1.0
    
    do i=1,N
        call random_number(x)
        call random_number(y)
        call random_number(z)
        call random_number(w)
        
        sumf=sumf+f(x,y,z,w)
    end do 
    
    iavg=1.0*vtotal*(sumf/N)
    write(*,*) 'the calculate and accuracy'
    write(*,*)''
    write(*,*) iavg,siavg
    end 

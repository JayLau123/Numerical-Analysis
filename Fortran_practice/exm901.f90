! 想想如果分为两个独立的文件，如何编译

module module1
    implicit none
    real, parameter :: pi=3.1415926
contains
    function f1(y)
        real :: y,f1
        f1 = y*pi/180.0
    end function f1
    function f2(z)
        real :: z,f2
        f2 = 180.0*z/pi
    end function f2
end module module1

program exm1
    use module1
    implicit none
    real :: x=30.0,y,z
    y=f1(x)
    z=f2(y) 
    write(*,*) 'y=',y
    write(*,*) 'z=',z
end

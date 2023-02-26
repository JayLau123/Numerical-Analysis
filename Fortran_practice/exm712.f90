program main   !调用FACTORIAL函数的主程序
    implicit none
    integer(4):: n
    write(*,'(A,$)') 'Input N = '
    read (*,*) n
    write(*,'(I2,A,I10)') n,'!=',factorial(n)
contains
    RECURSIVE FUNCTION factorial(m) RESULT(F_RES)
        integer(4)::  m, F_RES
    if(m == 1) then
        F_RES = 1
    else
        F_RES=m*factorial(m-1)
    end if
    end function factorial
end

!无格式顺序存取文件
program  example85
    implicit none
    real, dimension(4) :: score=(/1.0,2.0,3.0,4.0/)
    real(8) :: num = 1.0D0
    open(unit=10,file='exm85.out',form='unformatted',access='sequential')
    write(10) score(1:2)
    write(10) score(3:4)
    write(10) num
    close(10)
end

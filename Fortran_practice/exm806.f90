!无格式直接存取文件
program  example86
    implicit none
    real, dimension(4) :: score=(/1.0,2.0,3.0,4.0/)
    real(8) :: num = 1.0D0
    open(unit=10,file='exm86.out',form='unformatted',&
         access='direct', recl = 8)
    write(10, rec = 2) score(1:2)
    write(10, rec = 3) score(3:4)
    write(10, rec = 1) num
    close(10)
end

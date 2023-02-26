!有格式顺序存取文件
program  example83
    implicit none
    integer :: num = 6,fileid = 10
    real :: score = 123.456
    character(len=10) :: str1 = 'A string :',str2
    write(*,'(A,$)') 'Input your string:'
    read(*,*) str2
    open(unit = fileid, file = 'exm83.out', form = 'formatted')
    write(fileid, '(I3)') num
    write(fileid, '(F10.5)') score
    write(fileid, '(2A)') str1, str2
    write(fileid, *)
    !name是10个字符长，可以在文件中查对
    close(fileid)
end

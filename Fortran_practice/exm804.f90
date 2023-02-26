!有格式直接存取文件
program  example84
    implicit none
    integer :: num = 6, fileid = 10
    real :: score = 123.456
    character(len=10) :: str1='A string :', str2
    write(*,'(A,$)') 'Input your string:'
    read(*,*) str2
    open(unit = fileid, file = 'exm84.out', form = 'formatted', &
         access = 'direct', recl = 20)
    write(fileid, '(I3)', rec = 1) num
    write(fileid, '(F10.5)', rec = 2) score
    write(fileid, '(2A)', rec = 3) str1, str2
    write(fileid, '(A)', rec = 4)
    close(fileid)
end

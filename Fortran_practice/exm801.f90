!ʹ�ü�����Ļ��֯����
program example81
    implicit none
    integer, parameter :: n = 5
    integer i
    real xsum, xave
    real,dimension(n) :: score
    ! Standard IO 
    read(*,*) score
    xsum = 0.0
    do i = 1, n
        xsum = xsum + score(i)
    end do
    xave = xsum / n
    write(*,*) 'ѧ���ɼ���'
    write(*,'(2X,5F5.1)') score
    write(*,*) 'ƽ��������'
    write(*,'(F5.1)') xave
    ! File IO
    OPEN(UNIT=10,FILE='exm81.in')
    OPEN(UNIT=20,FILE='exm81.out')
    read(10,*) score
    xsum =0.0
    do i = 1, n
        xsum = xsum + score(i)
    end do
    xave = xsum / n
    write(20,*) 'ѧ���ɼ���'
    write(20,'(2X,5F5.1)') score
    write(20,*) 'ƽ��������'
    write(20,'(F5.1)') xave
    close(10)
    close(20)
end

program example404
    ! ͳ��ѧ�����Ժϸ�����
    implicit none
    integer :: score, s = 0, k = 0

10  write (*,*) ' ������� ����ʱ�˳���'
    read (*,*) score
    if (score < 0) goto 90
    s = s + 1
    if (score >= 60) k = k + 1
    goto 10
90  write(*,*)  k,' ��ѧ���ϸ���������', s
end program

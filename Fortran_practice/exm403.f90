program  example42
  implicit none
  integer :: score, n1=0, n2=0, n3=0, n4=0
  do
    write(*,*) '������һ��ѧ���ɼ�����Ч�ɼ��˳�����'
    read (*,*) score
    if(score< 0 .OR. score >100) then
      write (*,*) '��=', n1, ' ��=', n2,' ��=', n3, ' ������=', n4
      exit
    else
      select case(score)
        case(85:100)
          write (*,*)  '��  '; n1=n1+1
        case(70:84)
          write (*,*)  '��  '; n2=n2+1
        case(60:69)
          write (*,*)  '����'; n3=n3+1
        case default
          write (*,*)  '������'; n4=n4+1
      end select
    end if
  end do
end program

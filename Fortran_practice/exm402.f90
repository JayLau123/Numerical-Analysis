program example41
  implicit none
  real :: a, b, c, p1, p2, s

  write(*,*) '����3��ϵ��'
  read (*,*) a, b, c
  if (abs(a) <= 1.E-6 ) then
    write(*,*)  'a��ֵС���������Сʵ������Ϊ����'
    if (abs(b)<=1.E-6) then
      write(*,*)  'b��ֵС���������Сʵ������Ϊ����'
      if (abs(c)<=1.E-6) then
        write(*,*)  'c��ֵС���������Сʵ������Ϊ����'
        write(*,*)  '���ʽ0=0�������'
      else
        write(*,*)  '�޽�'
      end if
    else
      write(*,*)  'һ���⣺x=', -c/b
    end if
  else
     p1=-b/(2*a)
     s=b**2-4*a*c
     p2=sqrt(abs(s))/(2*a)
     if (s < 0.0) then
       write(*,*)  '���������⣺x=', p1, ' ����', p2, 'i'
     else if (abs(s).le.tiny(s)) then
       write(*,*)  '�ظ�      ��x=', p1
     else
       write (*,*) '����ʵ���⣺x=', p1, ' ����', p2
     end if   
  end if
end program

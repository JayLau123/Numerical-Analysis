program example41
  implicit none
  real :: a, b, c, p1, p2, s

  write(*,*) '输入3个系数'
  read (*,*) a, b, c
  if (abs(a) <= 1.E-6 ) then
    write(*,*)  'a的值小于允许的最小实数，认为是零'
    if (abs(b)<=1.E-6) then
      write(*,*)  'b的值小于允许的最小实数，认为是零'
      if (abs(c)<=1.E-6) then
        write(*,*)  'c的值小于允许的最小实数，认为是零'
        write(*,*)  '恒等式0=0，无需解'
      else
        write(*,*)  '无解'
      end if
    else
      write(*,*)  '一个解：x=', -c/b
    end if
  else
     p1=-b/(2*a)
     s=b**2-4*a*c
     p2=sqrt(abs(s))/(2*a)
     if (s < 0.0) then
       write(*,*)  '两个复数解：x=', p1, ' ＋—', p2, 'i'
     else if (abs(s).le.tiny(s)) then
       write(*,*)  '重根      ：x=', p1
     else
       write (*,*) '两个实数解：x=', p1, ' ＋－', p2
     end if   
  end if
end program

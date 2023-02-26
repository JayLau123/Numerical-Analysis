program  example42
  implicit none
  integer :: score, n1=0, n2=0, n3=0, n4=0
  do
    write(*,*) '请输入一个学生成绩：无效成绩退出输入'
    read (*,*) score
    if(score< 0 .OR. score >100) then
      write (*,*) '优=', n1, ' 良=', n2,' 中=', n3, ' 不及格=', n4
      exit
    else
      select case(score)
        case(85:100)
          write (*,*)  '优  '; n1=n1+1
        case(70:84)
          write (*,*)  '良  '; n2=n2+1
        case(60:69)
          write (*,*)  '及格'; n3=n3+1
        case default
          write (*,*)  '不及格'; n4=n4+1
      end select
    end if
  end do
end program

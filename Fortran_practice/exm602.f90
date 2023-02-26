program example62
  implicit none
  integer id, add_score
  integer, dimension(101:105) :: score     !下标为学号
  score = (/82,75, 35, 90, 74/)
  write (*,*) '输入学号和成绩浮动分数:'
  read (*,*) id, add_score
  if (id > UBOUND(score,1) .OR. id < LBOUND(score,1)) then
      write(*,*)  '学号错误！！！！拒绝修改分数！！！！'
  else
      score(id)= score(id) + add_score
      write(*, *)  '学号为', id, '的学生修改后成绩:' ,score(id)
  end if
end

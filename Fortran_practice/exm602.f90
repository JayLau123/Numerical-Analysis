program example62
  implicit none
  integer id, add_score
  integer, dimension(101:105) :: score     !�±�Ϊѧ��
  score = (/82,75, 35, 90, 74/)
  write (*,*) '����ѧ�źͳɼ���������:'
  read (*,*) id, add_score
  if (id > UBOUND(score,1) .OR. id < LBOUND(score,1)) then
      write(*,*)  'ѧ�Ŵ��󣡣������ܾ��޸ķ�����������'
  else
      score(id)= score(id) + add_score
      write(*, *)  'ѧ��Ϊ', id, '��ѧ���޸ĺ�ɼ�:' ,score(id)
  end if
end

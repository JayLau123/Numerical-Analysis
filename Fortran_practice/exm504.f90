program example504  !�������
  implicit none
  integer  :: i, j, k, num, value
  ! num �����λ���ĸ���   value�����ɵ���λ������ֵ
  num = 0
  write (*,*) '������ɵ���λ����:'
  do i = 1, 5                      ! ѭ��Ƕ�ף���ѭ�����ư�λ��
     do j = 1, 5                   ! �м�ѭ������ʮλ��
      do k = 1, 5                  ! ��ѭ�����Ƹ�λ��
        value = i*100 + j*10 + k   ! ������ֵ
        num = num + 1              ! �ۻ���λ���ĸ���
        write (*,*) value
      end do
    end do
  end do
  write (*,'(A,I5,A)') '����ɵ���λ����', num, '��'
end program

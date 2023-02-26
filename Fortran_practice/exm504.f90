program example504  !组合问题
  implicit none
  integer  :: i, j, k, num, value
  ! num 存放三位数的个数   value存放组成的三位数的数值
  num = 0
  write (*,*) '可以组成的三位数是:'
  do i = 1, 5                      ! 循环嵌套，外循环控制百位数
     do j = 1, 5                   ! 中间循环控制十位数
      do k = 1, 5                  ! 内循环控制个位数
        value = i*100 + j*10 + k   ! 计算数值
        num = num + 1              ! 累积三位数的个数
        write (*,*) value
      end do
    end do
  end do
  write (*,'(A,I5,A)') '共组成的三位数有', num, '个'
end program

program main
  implicit none
  integer,dimension(5) :: score
  integer i, avg1, avg2, sum1
  
  write(*,*)'Please input 5 scores'
  read(*,*) score
  
  sum1=0
  do i= 1, 5
      sum1 = sum1 + score(i)
  end do
  avg1 = sum1/5
  write(*,*)'Please input No.1, 3, 5 scores'
  read(*,*) score(1:5:2)
  
  sum1=0
  do i= 1, 5
      sum1 = sum1 + score(i)
  end do
  avg2 = sum1/5

  write(*,*) score
  write(*,*) 'avg1=',avg1,'avg2=',avg2
end
!例子把每个学生的成绩输入一个无格式文件来记录。
program example87
  implicit none
  real, dimension(8) :: score = (/81.5,83.0,72.5,63.5,94.0,79.0,66.5,57.5/)
  character(len=9) :: fname ='exm87.out'
  integer mychar

  call score_save(fname, score, size(score))
  write(*,*) 'Enter Your Choice'
  write(*,*) '    1 Read a score form a file' 
  write(*,*) '    2 Modify a score in a file'
  write(*,*) '    3 Exit'
  read(*,*) mychar
  do while (mychar /= 3)
      select case (mychar)
          case (1)
              call score_read(fname)
          case (2)
              call score_modify(fname)
      end select
      write(*,*) 'Enter Your Choice'
      read (*,*) mychar
  end do
end

subroutine score_save(fname, score, size_score)
  implicit none
  character(len=*),intent(in):: fname
  integer, intent(in) :: size_score
  real, dimension(size_score), intent(in) :: score
  ! Local var
  integer i

  open(unit = 10, file = fname, form = 'unformatted', &
       access = 'direct', recl = 4)
  do i = 1, size_score
      write(10, rec =i) score(i)
  end do
  close(10)
end subroutine score_save

subroutine score_read(fname)
  implicit none
  character(len=*), intent(in) :: fname
  ! Local var
  logical alive
  real score
  integer id, error
  
  inquire(file = fname, exist = alive)
  if (alive) then
      open( unit =10, file = fname, form = 'unformatted', &
            access = 'direct', recl = 4)
      do while (.true.)
          write(*,'(A$)') 'Please Input ID(1~8) :'
          read (*,*) id
          read (10, rec = id, iostat = error) score
          if ( error /= 0) exit
          write (*,'(A,F5.2)') 'SCORE =', score
      end do
      close(10)
  else
      write(*,*) fname, ' does not exist'
  end if
end subroutine

subroutine score_modify(fname)
  implicit none
  character(len=*), intent(in) :: fname
  ! Local var
  logical alive
  real score
  integer id, error
  
  inquire(file = fname, exist = alive)
  if (alive) then
      open( unit =10, file = fname, form = 'unformatted', &
            access = 'direct', recl = 4)
      do while (.true.)
          write(*,'(A$)') 'Please Input ID(1~8) :'
          read (*,*) id
          if ( id < 1 ) exit
          write (*,'(A$)') 'Please Input a new score :'
          read (*,*) score
          write (10, rec = id, iostat = error) score
          if ( error /= 0) exit
      end do
      close(10)
  else
      write(*,*) fname, ' does not exist'
  end if
end subroutine

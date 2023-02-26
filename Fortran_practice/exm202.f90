program main
  implicit none
  integer :: m
  character(60) :: long_str

  m = 1 + 2 + 333333 + 55555 + 77777 + &
      999+ 888
  long_str = 'There is a very long string and we should&
              be careful.'
  write(*,*) m
  write(*,*) long_str
end


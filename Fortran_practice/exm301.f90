program main
  implicit none
  real x
  complex c

  x = 3.1415926
  c = (0.5, -1.234)

  write(*,*) x
  write(*,*) c
  write(*,*)
  write(*,'(F8.3)') x
  write(*,'(2F10.5)') c
  write(*,'(A,F8.3)') 'Now is format output: ', x
end

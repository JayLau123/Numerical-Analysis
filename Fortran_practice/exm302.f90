program main
  implicit none
  real x
  real(8) y

  x = 1.0/3.0
  y = 1.0/3.0
  ! y = 1.E0 / 3.E0
  write(*,*) 'x=', x
  write(*,*) 'y=', y
end

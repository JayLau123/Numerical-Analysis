module simple_stats
     implicit none
     integer, save :: mean_use    = 0
     integer, save :: std_dev_use = 0
     contains
       real function mean(vec)
         real, intent(in), dimension(:) :: vec
         mean = sum(vec)/real(size(vec))
         mean_use = mean_use + 1
       end function mean

       real function std_dev(vec)
         real, intent(in), dimension(:) :: vec
         std_dev = sqrt(sum((vec-mean(vec))**2)/real(size(vec)))
         std_dev_use = std_dev_use + 1
     end function std_Dev
end module simple_stats

program example92
    use simple_stats
    implicit none
    real,allocatable :: x(:)
    integer :: n_elts, istat
    do
      write(*,*) "How big is the array? ";
      read(*,*) n_elts
      if (n_elts == 0) exit
      allocate(x(n_elts),STAT=istat)
      if (istat /= 0) then
          write(*,*) "Allocation request failed"
      else
          write(*,*) "Type in your ", n_elts," numbers";
          read(*,*) x
          write(*,*) "Mean    = ", mean(x)
          write(*,*) "Std Dev = ", std_dev(X)
          deallocate(x)
      end if
    end do
    write(*,*) "Function Mean used", mean_use, "times."
    write(*,*) "Function Std_Dev used", std_dev_use, "times."
end

program example65
  implicit none
  integer, parameter :: iRow= 3, iCol= 4
  integer, dimension(iRow, iCol) :: MatA
  integer, dimension(iCol, iRow) :: MatB
  integer  i, j
  MatA = reshape( (/1,3,5,2,4,6,3,7,10,4,11,9/), (/3,4/) )
  
  write(*,*) 'Matrix A ='
  do i = 1, iRow
    write(*,'(4I5)') (MatA(i,j), j=1, iCol)
  end do

  do j = 1, iCol
    do i = 1, iRow
      MatB(j, i) = MatA(i, j)
    end do
  end do
  ! MatB = transpose(MatA)
  write(*,*) 'Matrix B ='
  do i = 1, iCol
    write(*,'(3I5)') (MatB(i,j), j=1, iRow)
  end do
end

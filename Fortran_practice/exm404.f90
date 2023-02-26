program example404
    ! 统计学生考试合格人数
    implicit none
    integer :: score, s = 0, k = 0

10  write (*,*) ' 键入分数 负数时退出：'
    read (*,*) score
    if (score < 0) goto 90
    s = s + 1
    if (score >= 60) k = k + 1
    goto 10
90  write(*,*)  k,' 个学生合格。总人数＝', s
end program

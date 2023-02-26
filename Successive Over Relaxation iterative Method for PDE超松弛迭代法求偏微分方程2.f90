program main
implicit none

integer, parameter :: npt = 51! 对于正方形区域，x和y轴的步数为50，节点数为51
real, parameter :: eps = 1.0e-4!设置迭代终止条件

real, dimension(npt,npt) :: phi, rho, xpos, ypos !定义要用到的二维矩阵
real omega ! relaxation parameter，松弛因子
real hh ! point interval，步长
integer ii, jj

omega = 0.5 ! Input the relaxation parameter omega
do while( omega<=1.0 .or. omega >=2.0 )
write(*,'(A,$)') 'Input the relaxation parameter omega([1, 2])= ' 
read(*,*) omega
end do

call Ini_pot(phi, rho, xpos, ypos, hh, npt)
call sor_iter(omega, phi, rho, eps, npt)
open(unit=22, file='poisson_2d.dat')
write(22,'(A)') '# x y phi(x,y) rho(x,y)' 
do ii = 1, npt
    do jj = 1, npt
    write(22, '(2I3, 2F13.6)') ii, jj, phi(ii,jj), rho(ii,jj)
    end do
    write(22,*) '' 
end do
close(22)
end program


subroutine sor_iter(omega, phi, rho, myeps, npt)
implicit none

real omega, myeps
integer npt
real, dimension(npt, npt) :: phi, rho! local var
real ErrSum, phiN, h
integer, parameter :: iter_max = 5000, chk_step = 20 !事先设定循环5000次，看能不能达到误差要求的精读
integer ii, jj, iter

h = 1.0/real(npt-1)

do iter = 1, iter_max
ErrSum = 0.0
    do jj = 2, npt-1!周围一圈的初始值已经给定，迭代的起点只能从中间开始
        do ii = 2, npt-1
            phiN = 0.25*( phi(ii-1,jj) + phi(ii+1,jj) + phi(ii,jj-1) + &
                phi(ii,jj+1) + h*h*rho(ii,jj) )

                ErrSum = ErrSum + abs( phi(ii,jj) - phiN )!每循环一次，就要更新误差，判断迭代是否终止
                phi(ii,jj) = (1.0 - omega)*phi(ii,jj) + omega*phiN!每循环一次，该点新的值

        end do
    end do

if( mod(iter, chk_step) == 1 ) then!每完成循环20次，则输出一次误差的结果，并附带输出循环的次数
    write(*, '(I4, F15.8)') iter, ErrSum
    end if
if( ErrSum < myeps) exit!已经达到误差要求的精度，停止循环

end do
write(*, '(A,I4)') '# Final Step = ', iter!输出最终循环到了哪一步
end subroutine

subroutine Ini_pot(phi, rho, xpos, ypos, hh, npt)
implicit none
integer npt,ii,jj
real, dimension(npt, npt) :: phi, rho,xpos,ypos
real hh
real,parameter :: pi = 4.0*atan(1.0)!物理参数

phi(:,:) = 0.0!矩阵初始值全部为0
phi(1,:) = 0.0; phi(npt,:) = 0.0; phi(:,1) = 0.0; phi(:,npt) = 0.0
! We focus xpt [0,1] ypt [0,1],周围一圈全部设定边界条件

hh = 1.0/real(npt-1)!步长，节点数为50+1=51，步数为50

do jj = 1, npt!网格化，每一个点的x和y都有值
    do ii = 1, npt
        xpos(ii,jj) = (ii-1)*hh
        ypos(ii,jj) = (jj-1)*hh
    end do
end do

! we put one charge in the middle point
rho(:,:) = 0.0
rho(npt/2, npt/2) = -100.0*4.0*pi
end subroutine

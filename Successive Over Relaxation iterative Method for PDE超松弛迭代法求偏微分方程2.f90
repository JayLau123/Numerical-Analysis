program main
implicit none

integer, parameter :: npt = 51! ��������������x��y��Ĳ���Ϊ50���ڵ���Ϊ51
real, parameter :: eps = 1.0e-4!���õ�����ֹ����

real, dimension(npt,npt) :: phi, rho, xpos, ypos !����Ҫ�õ��Ķ�ά����
real omega ! relaxation parameter���ɳ�����
real hh ! point interval������
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
integer, parameter :: iter_max = 5000, chk_step = 20 !�����趨ѭ��5000�Σ����ܲ��ܴﵽ���Ҫ��ľ���
integer ii, jj, iter

h = 1.0/real(npt-1)

do iter = 1, iter_max
ErrSum = 0.0
    do jj = 2, npt-1!��ΧһȦ�ĳ�ʼֵ�Ѿ����������������ֻ�ܴ��м俪ʼ
        do ii = 2, npt-1
            phiN = 0.25*( phi(ii-1,jj) + phi(ii+1,jj) + phi(ii,jj-1) + &
                phi(ii,jj+1) + h*h*rho(ii,jj) )

                ErrSum = ErrSum + abs( phi(ii,jj) - phiN )!ÿѭ��һ�Σ���Ҫ�������жϵ����Ƿ���ֹ
                phi(ii,jj) = (1.0 - omega)*phi(ii,jj) + omega*phiN!ÿѭ��һ�Σ��õ��µ�ֵ

        end do
    end do

if( mod(iter, chk_step) == 1 ) then!ÿ���ѭ��20�Σ������һ�����Ľ�������������ѭ���Ĵ���
    write(*, '(I4, F15.8)') iter, ErrSum
    end if
if( ErrSum < myeps) exit!�Ѿ��ﵽ���Ҫ��ľ��ȣ�ֹͣѭ��

end do
write(*, '(A,I4)') '# Final Step = ', iter!�������ѭ��������һ��
end subroutine

subroutine Ini_pot(phi, rho, xpos, ypos, hh, npt)
implicit none
integer npt,ii,jj
real, dimension(npt, npt) :: phi, rho,xpos,ypos
real hh
real,parameter :: pi = 4.0*atan(1.0)!�������

phi(:,:) = 0.0!�����ʼֵȫ��Ϊ0
phi(1,:) = 0.0; phi(npt,:) = 0.0; phi(:,1) = 0.0; phi(:,npt) = 0.0
! We focus xpt [0,1] ypt [0,1],��ΧһȦȫ���趨�߽�����

hh = 1.0/real(npt-1)!�������ڵ���Ϊ50+1=51������Ϊ50

do jj = 1, npt!���񻯣�ÿһ�����x��y����ֵ
    do ii = 1, npt
        xpos(ii,jj) = (ii-1)*hh
        ypos(ii,jj) = (jj-1)*hh
    end do
end do

! we put one charge in the middle point
rho(:,:) = 0.0
rho(npt/2, npt/2) = -100.0*4.0*pi
end subroutine

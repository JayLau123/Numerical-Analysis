program main
implicit none

integer, parameter :: N=100
real, parameter :: myeps = 1.0e-3
real, dimension(0:N,0:N) :: phi, rho, xpos, ypos  
real omega 
integer ii, jj

write(*,*) '�������ɳ�����([1, 2])= ' 
read(*,*) omega

call Ini_pot(phi, rho, xpos, ypos, hhx,hhy, N)
call sor_iter(omega, phi, rho, myeps, N)
end 

subroutine sor_iter(omega, phi, rho, myeps,N)
implicit none
integer N
real omega, myeps
real, dimension(0:N,0:N) :: phi, rho
real ErrSum, phiN, hx,hy
integer ii, jj, iter

hx = 4.0/N
hy=3.0/N

do iter = 1,50000
ErrSum = 0.0
    do jj = 1,N-1 !��ΧһȦ�ĳ�ʼֵ�Ѿ����������������ֻ�ܴ��м俪ʼ
        do ii = 1,N-1
            phiN = ((hy**2)*(phi(ii+1,jj)+phi(ii-1,jj))+(hx**2)*(phi(ii,jj-1)+phi(ii,jj+1))-&
            (hx**2)*(hy**2)*rho(ii,jj))/(2*(hx**2+hy**2))
            ErrSum = ErrSum + abs( phi(ii,jj) - phiN )!ÿѭ��һ�Σ���Ҫ�������жϵ����Ƿ���ֹ
            phi(ii,jj) = (1.0 - omega)*phi(ii,jj) + omega*phiN!ÿѭ��һ�Σ��õ��µ�ֵ
        end do
    end do
    
if( ErrSum < myeps) exit
end do

write(*,*) 'the final iter=' iter !�˳�����ʱ��ѭ��������iter��ʼ���õ���1-50000
end subroutine

subroutine Ini_pot(phi, rho, xpos, ypos, hhx,hhy, N)
implicit none
integer N,ii,jj
real,parameter :: pi = 4.0*atan(1.0)
real, dimension(0:N,0:N) :: phi, rho,xpos,ypos
real hhx,hhy

phi(:,:) = 0.0
phi(0,:) = 0.0; phi(N,:) = 0.0; phi(:,0) = 0.0; phi(:,N) = 0.0
hhx = 4.0/N
hhy=3.0/N

do jj =0,N
    do ii =0,N
        xpos(ii,jj) = ii*hhx
        ypos(ii,jj) = jj*hhy
    end do
end do

rho(:,:) = 0.0
rho(N/2, N/2) = -4.0*250*pi
end subroutine

program wave_equation

implicit none

!=========================================================
! PRECISION
!=========================================================

integer, parameter :: dp = kind(1.0d0)

!=========================================================
! VARIABLES
!=========================================================

integer :: Nr, Nt
integer :: j, n

real(dp) :: rmin, rmax
real(dp) :: dr, dt
real(dp) :: t_final

real(dp) :: CFL
real(dp) :: CFL_sq

real(dp) :: phi0
real(dp) :: r0
real(dp) :: sigma

character(len=100) :: filename

!=========================================================
! ARREGLOS
!=========================================================

real(dp), allocatable :: r(:)
real(dp), allocatable :: phi_old(:)
real(dp), allocatable :: phi_now(:)
real(dp), allocatable :: phi_new(:)

!=========================================================
! ENTRADA DE PARAMETROS
!=========================================================

print*, '======================================'
print*, ' ECUACION DE ONDA 1D '
print*, '======================================'

print*, 'Ingrese el numero de nodos Nr de la malla (numero entero):'
read(*,*) Nr
Nr = Nr + 1
 
print*, 'Los siguientes parametros los puede escribir en notacion decimal'
print*, 'Ingrese rmin:'
read(*,*) rmin

print*, 'Ingrese rmax:'
read(*,*) rmax

print*, 'Ingrese el tiempo final t_final:'
read(*,*) t_final

print*, 'Ingrese phi0:'
read(*,*) phi0

print*, 'Ingrese r0 (centro del pulso):'
read(*,*) r0

print*, 'Ingrese sigma (ancho del pulso):'
read(*,*) sigma

!=========================================================
! PARAMETROS NUMERICOS
!=========================================================

dr = (rmax-rmin)/real(Nr-1,dp)

CFL = 0.5_dp
dt = CFL*dr

CFL_sq = (dt/dr)**2

Nt = int(t_final/dt)


!=========================================================
! RESERVAR MEMORIA
!=========================================================

allocate(r(0:Nr-1))
allocate(phi_old(0:Nr-1))
allocate(phi_now(0:Nr-1))
allocate(phi_new(0:Nr-1))

!=========================================================
! CONSTRUIR MALLA
!=========================================================

do j = 0, Nr-1
   r(j) = rmin + j*dr
end do

!=========================================================
! CONDICION INICIAL
!=========================================================

do j = 0, Nr-1

   phi_now(j) = phi0 * exp( -((r(j)-r0)**2)/(sigma**2) )

end do

!=========================================================
! VELOCIDAD INICIAL = 0
!=========================================================

phi_old = phi_now

!=========================================================
! GUARDAR ESTADO INICIAL
!=========================================================

write(filename,'("snapshot_",I4.4,".txt")') 0

open(unit=10,file=filename, &
     status='replace',action='write')

do j = 0, Nr-1

   write(10,'(2ES20.10)') r(j), phi_now(j)

end do

close(10)

print*
print*, 'Estado inicial guardado en: ', trim(filename)

!=========================================================
! EVOLUCION TEMPORAL
!=========================================================

do n = 1, Nt

   !======================================================
   ! EVOLUCION INTERIOR
   !======================================================

   do j = 1, Nr-2

      phi_new(j) = 2.0_dp*phi_now(j) - phi_old(j) &
      + CFL_sq * ( phi_now(j+1) - 2.0_dp*phi_now(j) &
      + phi_now(j-1) )

   end do

   !======================================================
   ! CONDICIONES DE FRONTERA
   !======================================================

   phi_new(0)    = 0.0_dp
   phi_new(Nr-1) = 0.0_dp

   !======================================================
   ! GUARDAR SNAPSHOTS
   !======================================================

   if (mod(n,20) == 0) then

      write(filename,'("snapshot_",I4.4,".txt")') n

      open(unit=10,file=filename, &
           status='replace',action='write')

      do j = 0, Nr-1

         write(10,'(2ES20.10)') r(j), phi_new(j)

      end do

      close(10)

   end if

   !======================================================
   ! ACTUALIZAR SOLUCION
   !======================================================

   phi_old = phi_now
   phi_now = phi_new

end do

!=========================================================
! FINAL
!=========================================================

print*
print*, 'Simulacion terminada.'
print*, 'Numero total de pasos temporales:', Nt

!=========================================================
! LIBERAR MEMORIA
!=========================================================

deallocate(r)
deallocate(phi_old)
deallocate(phi_now)
deallocate(phi_new)

end program wave_equation
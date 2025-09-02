program test
 use omp_lib 
 implicit none 
  integer :: i,j,k
  integer,parameter ::n=10
  real :: a(n,n), b(n,n), c(n,n),temp
  real(kind=8):: tstart,tend 

  c = 0.0; a=1.0; b=2.0 

  tstart=omp_get_wtime()
  
  !$omp parallel
  !$omp do
    do j = 1, n
      do k = 1, n

  do i = 1, n
        c(i,j) = c(i,j) + a(i, k) * b(k, j) 
      end do
 
    end do
  end do
  !$omp enddo
  !$omp end parallel 
  
  tend=omp_get_wtime()

  write(*,*) 'elapsed time: ',tend-tstart 
 end


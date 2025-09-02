program test
use omp_lib
  implicit none
  integer :: i, a,p_sum
  integer, parameter :: n = 10
  integer :: arr(n)

  ! Initialize array
  arr = 1
  a = 0
 

!$omp parallel private(p_sum)
  p_sum = 0
  
  	!$omp do
  		do i = 1, n
     			p_sum = p_sum + arr(i)
  		end do
  	!$omp end do
  
 	!$omp critical
  		a=a+p_sum
  	!$omp end critical
  
  !$omp end parallel

  write(*,*) "Sum:", a
end program test


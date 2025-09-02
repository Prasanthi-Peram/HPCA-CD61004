program parallel_sum
  use omp_lib
  implicit none

  integer, parameter :: n = 10000000
  real :: array(n), sum,p_sum
  integer :: i
  real(8) :: t_start, t_end

  ! Initialize the array
  array = 1.0
  !do i=1,n
  !	array(i)=i
  !enddo

  t_start = omp_get_wtime()
  !$omp parallel private(p_sum)
  p_sum = 0.0
  
  !$omp do
  do i = 1, n
     p_sum = p_sum + array(i)
  end do
  !$omp end do
  
  !$omp critical
  sum=sum+p_sum
  !$omp end critical
  
 !$omp end parallel
 
  t_end = omp_get_wtime()

  write(*,*) "Sum : ",sum,"elapsed time: ", t_end-t_start

end program parallel_sum


program parallel_sum
  use omp_lib
  implicit none

  integer, parameter :: n = 10000000
  real :: array(n), sum
  integer :: i,stride,first,last,id,max_threads
  real(8) :: t_start, t_end

  ! Initialize the array
  array = 1.0
  sum = 0.0

 t_start = omp_get_wtime()
  
  !$omp parallel reduction(+:sum) private(stride,first,last,id,max_threads)
  max_threads=omp_get_max_threads()
  id=omp_get_thread_num()
  stride= (n+max_threads-1)/max_threads

  first=stride*id+1
  last=min(N,stride*(id+1))
  
  
  do i = first,last
    sum = sum + array(i)
  end do
  
 !$omp end parallel
 
  t_end = omp_get_wtime()

  write(*,*) "Sum : ",sum,"elapsed time: ", t_end-t_start

end program parallel_sum


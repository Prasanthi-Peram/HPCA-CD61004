program hello
	use omp_lib
	implicit none
	integer:: id
	
	!$omp parallel
		write(*,*) "hello from process:", omp_get_thread_num(),"/",omp_get_num_threads()
	!$omp end parallel
end program hello

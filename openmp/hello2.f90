program hello
	use omp_lib
	implicit none
	integer:: num_threads, thread_id
	num_threads=omp_get_max_threads()
	
	!$omp parallel private(thread_id)
	
		thread_id=omp_get_thread_num()
		write(*,*) "ad",thread_id,"out of",num_threads
	!$omp end parallel
	
	write(*,*) 'Hello, from thread', thread_id,'/',num_threads
end program hello

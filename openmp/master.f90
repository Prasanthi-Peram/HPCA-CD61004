program hello
	use omp_lib
	implicit none
	integer:: msg
	
	!$omp parallel private(msg)
		!$omp master
			msg=20
		!$omp end master
		
		write(*,*) "Hello, World!",msg
	!$omp end parallel
end program hello

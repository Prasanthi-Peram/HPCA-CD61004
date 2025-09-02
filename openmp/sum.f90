program test
	use omp_lib
	implicit none
	
	integer,parameter:: N=10000
	integer:: total,i,p_sum,nt,id
	
	total=0
	
	!Parallel Region
	!$omp parallel private(i,p_sum)
		p_sum=0
	
		!$omp do
		!static distribution
			do i=1,N
				p_sum=p_sum+i
			enddo
		!$omp end do

		!If all the threads each this point, we want to make sure only one thread adds 
		!to total,it is private by default
		!$omp critical
			total=total+p_sum
		!$omp end critical
	
	
	!$omp end parallel
	
	write(*,*) "Sum: ", total
end program test

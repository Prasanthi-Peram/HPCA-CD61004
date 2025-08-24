program avg
implicit none
include 'mpif.h'


integer::ierr,np,id,N,stride,first,last,i
real:: lsum,gsum,r

call mpi_init(ierr)
call mpi_comm_size(mpi_comm_world,np,ierr)
call mpi_comm_rank(mpi_comm_world,id,ierr)

N=3000
lsum=0.0

stride=(N+np-1)/np
first=id*stride+1
last=min(N,(id+1)*stride)

call random_seed()
do i=first,last
    call random_number(r)
    ! Can scale using a+(b-a)*r
    lsum=lsum+r
enddo

call mpi_reduce(lsum,gsum,1,mpi_real,mpi_sum,0,mpi_comm_world,ierr)

if(id==0) then
    write(*,*) 'Average' , gsum/N
endif

call mpi_finalize(ierr)
end program avg
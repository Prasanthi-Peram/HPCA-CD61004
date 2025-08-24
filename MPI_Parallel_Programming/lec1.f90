program success
    implicit none
    include 'mpif.h'
    
    integer:: ierr,np,id

    call mpi_init(ierr)
    call mpi_comm_size(mpi_comm_world,np,ierr)
    call mpi_comm_rank(mpi_comm_world,id,ierr)

    if(mod(id,2)/=0) then
        write(*,*) id,'successful'
    end if
    call mpi_finalize(ierr)


end program success
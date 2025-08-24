program ring
    implicit none
    include 'mpif.h'

    integer:: ierr,np,id,msg,tag

    call mpi_init(ierr)
    call mpi_comm_size(mpi_comm_world,np,ierr)
    call mpi_comm_rank(mpi_comm_world,id,ierr)

    msg=10
    tag=0
    
    if(id==0) then
        call mpi_send(msg,1,mpi_integer,1,tag,mpi_comm_world,ierr)

    else
        call mpi_recv(msg,1,mpi_integer,id-1,mpi_any_tag,mpi_comm_world,mpi_status_ignore,ierr)
        write(*,*) id,'received from process',id-1
        call mpi_send(msg,1,mpi_integer,mod(id+1,np),tag,mpi_comm_world,ierr)
    endif

    if(id==0) then 
        call mpi_recv(msg,1,mpi_integer,np-1,mpi_any_tag,mpi_comm_world,mpi_status_ignore,ierr)
        write(*,*) id,'recieved from process', np-1
    endif
    call mpi_finalize(ierr)
end program ring
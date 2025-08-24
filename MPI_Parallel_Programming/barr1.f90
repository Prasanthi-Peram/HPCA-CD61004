program barrier
    implicit none
    include 'mpif.h'

    integer::np,id,ierr,msg,tag,i
    call mpi_init(ierr)
    call mpi_comm_size(mpi_comm_world,np,ierr)
    call mpi_comm_rank(mpi_comm_world,id,ierr)

    msg=10
    tag=0
    if(id==0) then 
        do i=1,np-1
            call mpi_recv(msg,1,mpi_integer,i,mpi_any_tag,mpi_comm_world,mpi_status_ignore,ierr)
            write(*,*) 0,'received from', i
        enddo
    
        do i=1,np-1
            call mpi_send(msg,1,mpi_integer,0,tag,mpi_comm_world,ierr)
        enddo

    else
        !send to p0
            call mpi_send(msg,1,mpi_integer,0,tag,mpi_comm_world,ierr)
        !receive from p0
            call mpi_recv(msg,1,mpi_integer,0,mpi_any_tag,mpi_comm_world,mpi_status_ignore,ierr)

            write(*,*) id,'recieved from',0
    endif


    call mpi_finalize(ierr)
end program barrier
program questao1
    implicit none
    integer :: N, i, iunit, iostat
    character(len=100) :: iomsg
    real :: PI
    real, dimension(:), allocatable :: sequence
    
    N = 25
    PI = 3.1415927
    allocate(sequence(N))

    do i = 1, N
        sequence(i) = sin(i/real(N) * 2*PI)
    end do

    open(newunit=iunit, file='../Dados/q1.dat', status='replace', iostat=iostat, iomsg=iomsg)
    
    if (iostat == 0) then
        do i = 1, N
            write(iunit, *) i, sequence(i)
        end do
    else
        print *, "Erro: ", trim(iomsg)
        stop
    end if

    close(iunit)

    deallocate(sequence)

end program questao1
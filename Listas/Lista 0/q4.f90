program questao4
    implicit none
    integer :: N, i, iunit, iostat
    real :: temp
    character(len=100) :: iomsg

    N = 100

    open(&
        newunit = iunit, &
        file = '../Dados/q4.dat', &
        action = 'write', &
        status = 'replace', &
        iostat = iostat, &
        iomsg = iomsg &
    )

    if (iostat /= 0) then
        print *, "Erro ao abrir arquivo: ", trim(iomsg)
        stop
    end if

    do i = 1, N
        call random_number(temp)
        write(iunit, *) temp
    end do

    close(iunit)
end program questao4
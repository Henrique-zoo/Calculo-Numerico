program prof
    implicit none
    real, dimension(0:100) :: x
    integer :: n, iunit, iostat
    character(len=100) :: iomsg

    x(0) = 3.0
    do n = 0, 99
        x(n+1) = g(x(n))
    end do

    open(&
        newunit = iunit,            &
        file = '../Dados/prof.dat', &
        status = 'replace',         &
        action = 'write',           &
        iostat = iostat,            &
        iomsg = iomsg               &
    )

    if (iostat /= 0) then
        print *, "Erro ao abrir o arquivo: ", trim(iomsg)
        stop
    end if

    do n = 0, 100
        write(iunit, *) n, x(n)
    end do

    close(iunit)
contains
    function g(x) result(y)
        implicit none
        real, intent(in) :: x
        real :: y
        y = (x + 1.0)**(1.0/3.0)
    end function g
end program prof
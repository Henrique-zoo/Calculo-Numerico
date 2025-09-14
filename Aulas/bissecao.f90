program bissecao
    implicit none
    integer :: n, iunit, iostat
    real :: a, b
    real, dimension(0:10000) :: x
    character(len=100) :: iomsg

    n = 0
    a = 0
    b = 6
    
    do while (abs(f(x(n))) > 1.e-3)
        x(n) = (a + b) / 2
        if ((f(a)*f(x(n))) < 0) then
            b = x(n)
        else
            a = x(n)
        end if
        n = n + 1
    end do

    open(&
        newunit = iunit,                &
        file = '../Dados/bissecao.dat', &
        status = 'replace',             &
        action = 'write',               &
        iostat = iostat,                &
        iomsg = iomsg                   &
    )

    if (iostat /= 0) then
        print *, "Erro ao abrir o arquivo: ", trim(iomsg)
        stop
    end if

    do n = 0, size(x) - 1
        write(iunit, *) n, x(n)
    end do

    close(iunit)
contains
    function f(x) result(y)
        implicit none
        real, intent(in) :: x
        real :: y
        y = x*x*x - x - 1.0
    end function f
end program bissecao
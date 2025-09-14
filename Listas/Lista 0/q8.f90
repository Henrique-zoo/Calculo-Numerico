program questao8
    implicit none
    integer :: n, i, iunit, iostat
    integer, dimension(:), allocatable :: fib
    character(len=100) :: iomsg

    print *, "Até qual termo de fibonacci você quer ver?"
    read(*,*) n

    allocate(fib(n))
    
    call fibonacci(n, fib)

    open(&
        newunit = iunit, &
        file = '../Dados/q8.dat', &
        status = 'replace', &
        action = 'write', &
        iostat = iostat, &
        iomsg = iomsg &
    )

    if (iostat /= 0) then
        print *, "Erro ao abrir o arquivo: ", trim(iomsg)
        stop
    end if

    do i = 1, n
        write(iunit, *) fib(i), f(fib(i))
    end do

    close(iunit)

    deallocate(fib)
contains
    subroutine fibonacci(n,  fib)
        integer, intent(in) :: n
        integer, dimension(:), intent(out) :: fib
        integer :: i
        fib(1) = 0
        fib(2) = 1

        do i = 3, n
            fib(i) = fib(i-2) + fib(i-1)
        end do
    end subroutine fibonacci

    function f(x)
        implicit none
        integer, intent(in) :: x
        integer :: f
        f = int(x**(1.0/2.0) + x**(1.0/3.0))

        return
    end function f
end program questao8
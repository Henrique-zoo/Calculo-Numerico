module item1
    implicit none
contains
    subroutine proc_item1(a, file)
        real, intent(in) :: a
        character(len=*) :: file
        integer :: n, i, iunit, iostat
        real, dimension(:), allocatable :: x
        character(len=100) :: iomsg

        n = 100
        allocate(x(n))
        x(1) = 1.0

        do i = 1, n-1
            x(i+1) = a * x(i)
        end do

        open(&
            newunit = iunit,                    &
            file = file,                        &
            status = 'replace',                 &
            action = 'write',                   &
            iostat = iostat,                    &
            iomsg = iomsg                       &
        )
        if (iostat /= 0) then
            print *, "Erro ao abrir arquivo: ", iomsg
            stop
        end if

        do i = 1, n
            write(iunit, *) i, x(i)
        end do

        close(iunit)
        deallocate(x)
    end subroutine proc_item1
end module item1
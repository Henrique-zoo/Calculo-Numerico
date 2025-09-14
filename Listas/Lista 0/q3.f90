program questao3
    implicit none
    integer :: i, trash, iunit, iostat
    real, dimension(25) :: data
    character(len=100) :: iomsg

    open(&
        newunit = iunit,            &
        file = '../Dados/q1.dat',   &
        status = 'unknown',         &
        action = 'read',            &
        iostat = iostat,            &
        iomsg = iomsg               &
    )
    
    if (iostat /= 0) then
        print *, "Erro ao abrit o arquivo: ", trim(iomsg)
        stop
    end if

    do i = 1, 25
        read(iunit, *, iostat=iostat) trash, data(i)
        if (iostat /= 0) exit
    end do

    close(iunit)

    call merge_sort(data, size(data))

    open(&
        newunit = iunit, &
        file = '../Dados/q3.dat', &
        status = 'replace', &
        action = 'write', &
        iostat = iostat, &
        iomsg = iomsg &
    )

    if (iostat /= 0) then
        print *, "Erro ao abrir o arquivo: ", trim(iomsg)
        stop
    end if

    do i = 1, 25
        write(iunit, *) i, data(i)
    end do

    close(iunit)

contains
    recursive subroutine merge_sort(arr, n)
        real, intent(inout) :: arr(:)
        integer, intent(in) :: n
        integer :: mid
        real, allocatable :: temp(:)
        
        if (n > 1) then
            mid = n / 2
            call merge_sort(arr(1:mid), mid)
            call merge_sort(arr(mid+1:n), n - mid)
            call merge(arr, n, mid, temp)
        end if
    end subroutine merge_sort

    subroutine merge(arr, n, mid, temp)
        real, intent(inout) :: arr(:)
        integer, intent(in) :: n, mid
        real, allocatable, intent(out) :: temp(:)
        integer :: i, j, k
        
        allocate(temp(n))
        i = 1
        j = mid + 1
        k = 1 ! Current position in the array
        
        do while (i <= mid .and. j <= n)
            if (arr(i) <= arr(j)) then
                temp(k) = arr(i)
                i = i + 1
            else
                temp(k) = arr(j)
                j = j + 1
            end if
            k = k + 1
        end do
        
        do while (i <= mid)
            temp(k) = arr(i)
            i = i + 1
            k = k + 1
        end do
        
        do while (j <= n)
            temp(k) = arr(j)
            j = j + 1
            k = k + 1
        end do
        
        arr(1:n) = temp(1:n)
        deallocate(temp)
    end subroutine merge
end program questao3
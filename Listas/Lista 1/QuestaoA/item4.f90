program item4
    implicit none
    integer :: item, i, n, iunit, iostat
    real, allocatable :: x(:)
    character(len=20) :: item_str
    character(len=100) :: iomsg

    print *, "Qual processo iterativo você quer usar (a -> 1, b ->2, ...)"
    read(*,*) item
    write(item_str, '(I0)') item
    n = 100
    allocate(x(0:n))
    x(0) = 3.0

    if (item == 1) then
        do i = 1, n
            x(i) = a(x(i+1))
        end do
    else if (item == 2) then
        do i = 1, n
            x(i) = b(x(i+1))
        end do
    else if (item == 3) then
        do i = 1, n
            x(i) = c(x(i+1))
        end do
    else if (item == 4) then
        do i = 1, n
            x(i) = d(x(i+1))
        end do
    else
        print *, "Essa não é uma opção."
    end if

    open(&
        newunit = iunit,                            &
        file = 'Q(A)_item4_' // trim(item_str),     &
        status = 'replace',                         &
        action = 'write',                           &
        iostat = iostat,                            &
        iomsg = iomsg                               &
    )

    do i = 0, 100
        write(iunit, *) i, x(i)
    end do

    close(iunit)

    deallocate(x)
contains
    function a(xn) result(xn1)
        real, intent(in) :: xn
        real :: xn1
        xn1 = 1.0/3.0 * xn + 1.0
    end function a

    function b(xn) result(xn1)
        real, intent(in) :: xn
        real :: xn1
        xn1 = 4.0/23.0 * xn + 2.0/5.0
    end function b

    function c(xn) result(xn1)
        real, intent(in) :: xn
        real :: xn1
        xn1 = 3.0 * xn + 1
    end function c

    function d(xn) result(xn1)
        real, intent(in) :: xn
        real :: xn1
        xn1 = 0.035 * xn + 12
    end function d
end program item4
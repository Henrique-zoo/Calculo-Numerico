program questao5
    implicit none
    integer :: N, iunit, iostat
    real, dimension(:, :), allocatable :: matrix, trans_matrix
    character(len=100) :: iomsg

    print *, "Digite a dimensão N da matrix quadrada NxN"
    read(*,*) N

    allocate(matrix(N, N))
    call random_number(matrix)

    trans_matrix = transposta(matrix)

    open(&
        newunit = iunit,            &
        file = '../Dados/q5.dat',   &
        status = 'replace',         &
        action = 'write',           &
        iostat = iostat,            &
        iomsg = iomsg               &
    )

    if (iostat /= 0) then
        print *, "Erro ao abrir arquivo: ", trim(iomsg)
        stop
    end if

    write(iunit, *) matrix

    close(iunit)

    open(&
        newunit = iunit,                &
        file = '../Dados/q5_trans.dat', &
        status = 'replace',             &
        action = 'write',               &
        iostat = iostat,                &
        iomsg = iomsg                   &
    )

    if (iostat /= 0) then
        print *, "Erro ao abrir arquivo: ", trim(iomsg)
        stop
    end if

    write(iunit, *) trans_matrix

    close(iunit)

    deallocate(matrix, trans_matrix)

contains
    pure function transposta(A) result(A_t)
        implicit none
        real, dimension(:, :), intent(in) :: A
        real, dimension(:, :), allocatable ::  A_t
        integer :: i, j, n, m

        n = size(A, 1)
        m = size(A, 2)
        allocate(A_t(m, n))

        do i = 1, n
            do j = 1, m
                A_t(j, i) = A(i, j)
            end do            
        end do
    end function transposta
end program questao5
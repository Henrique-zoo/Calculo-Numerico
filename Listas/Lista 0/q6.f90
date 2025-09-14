program questao6
    implicit none
    integer :: N, flops, iunit, iostat
    real, dimension(:, :), allocatable :: A, B, C
    character(len=100) :: iomsg

    print *, "Digite a dimensão N da matrix quadrada NxN"
    read(*,*) N

    allocate(A(N, N))
    allocate(B(N, N))
    allocate(C(N, N))
    call random_number(A)
    call random_number(B)

    call flops_and_matrix_product(A, B, C, flops)

    open(&
        newunit = iunit,            &
        file = '../Dados/q6.dat',   &
        action = 'write',           &
        status = 'unknown',         &
        position = 'append',        &
        iostat = iostat,            &
        iomsg = iomsg               &
    )

    if (iostat /= 0) then
        print *, "Erro ao abrir o arquivo: ", trim(iomsg)
        stop
    end if

    write(iunit, *) N, flops

    close(iunit)

    deallocate(A, B, C)
contains
    subroutine flops_and_matrix_product(A, B, C, flops)
        implicit none        
        integer, intent(out) :: flops
        real, dimension(:, :), intent(in) :: A, B
        real, dimension(:, :), intent(out) :: C
        integer :: N, i, j, k

        flops = 0
        N = size(A, 1)
        
        do i = 1, N
            do j = 1, N
                C(i, j) = 0.0
                do k = 1, N
                    C(i, j) = C(i, j) + A(i, k) * B(k, j)
                    flops = flops + 1
                end do
            end do            
        end do
    end subroutine flops_and_matrix_product
    
end program questao6
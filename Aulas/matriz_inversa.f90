program matriz_inversa
    implicit none
    integer :: i, j, k, n
    double precision, dimension(:), allocatable :: x, b, c
    double precision, dimension(:,:), allocatable :: M, M_inv, L, U, Id, prod

    n = 5
    allocate(L(n, n), U(n, n), M(n, n), M_inv(n, n), prod(n, n), Id(n, n), x(n), b(n), c(n))

    M = reshape([2.d0, 1.d0, -1.d0, 1.d0, 3.d0, &
        1.d0, 0.d0, 2.d0, -1.d0, 1.d0, &
        0.d0, -2.d0, 1.d0, 1.d0, -1.d0, &
        3.d0, 1.d0, -4.d0, 0.d0, 5.d0, &
        1.d0, -1.d0, -1.d0, -1.d0, 1.d0], [n, n], order=[1,2])

    b = [7.d0, 2.d0, 2.d0, 6.d0, 3.d0]

    Id = 0.0d0
    forall(i = 1:n) Id(i, i) = 1.0d0

    call fatoracao_LU(M, L, U)
    
    do j = 1, n
        call subs_direta(L, Id(:, j), c)
        call subs_reversa(U, c, M_inv(:, j))
    end do

    print *, "Matriz inversa M_inv:"
    call exibir_matriz(M_inv)

    call prod_matrizes(M, M_inv, prod)
    print *, "Produto M x M_inv"
    call exibir_matriz(prod)

    deallocate(L, U, M, M_inv, x, c, prod)
contains
    subroutine fatoracao_LU(A, L, U)
        double precision, dimension(:,:), intent(in) :: A
        double precision, dimension(:,:), intent(out) :: L, U
        integer :: i, j
        
        U = A
        L = 0.0d0
        forall(i = 1:n) L(i, i) = 1.0d0 

        do j = 1, n
            if(U(j, j) == 0d0) stop
            do i = j+1, n
                L(i, j) = U(i, j) / U(j, j)
                do k = 1, n
                    U(i, k) = U(i, k) - L(i, j)*U(j, k)
                end do
            end do
        end do
    end subroutine fatoracao_LU

    subroutine subs_reversa(U, b, x)
        double precision, dimension(:,:), intent(in) :: U
        double precision, dimension(:), intent(in) ::  b
        double precision, dimension(:), intent(out) ::  x
        double precision :: soma
        integer :: i, j

        x(n) = b(n) / U(n, n)
        do i = n-1, 1, -1
            soma = 0.d0
            do j = i+1, n
                soma = soma + U(i, j)*x(j)
            end do
            x(i) = (b(i) - soma) / U(i, i)
        end do
    end subroutine subs_reversa

    subroutine subs_direta(L, b, c)
        double precision, dimension(:,:), intent(in) :: L
        double precision, dimension(:), intent(in) :: b
        double precision, dimension(:), intent(out) :: c
        double precision :: soma
        integer :: i, j
        
        c(1) = b(1)
        do i = 2, size(c)
            soma = 0
            do j = 1, i-1
                soma = soma + L(i, j)*c(j)
            end do
            c(i) = b(i) - soma
        end do
    end subroutine subs_direta

    subroutine prod_matrizes(A,  B, C)
        double precision, dimension(:,:), intent(in) :: A, B
        double precision, dimension(:,:), intent(out) :: C
        do i = 1, n
            do j = 1, n
                C(i, j) = 0.0d0
                do k = 1, n
                    C(i, j) = C(i, j) + A(i, k) * B(k, j)
                end do
            end do
        end do
    end subroutine prod_matrizes

    subroutine exibir_matriz(A)
        double precision, dimension(:,:), intent(in) :: A
        integer :: i, j, n

        n = size(A, 1)
        do i = 1, n
            do j = 1, n
                write(*, '(F10.4)', advance='no') A(i, j)
            end do
            print *
        end do
    end subroutine exibir_matriz
end program matriz_inversa
program matriz_inversa
    implicit none
    integer :: i, j, k, n
    double precision, dimension(:), allocatable :: x, b, c
    double precision, dimension(:,:), allocatable :: M, M_inv, L, U, Id

    n = 5
    allocate(L(n, n), U(n, n), M(n, n), M_inv(n, n), Id(n, n), x(n), b(n), c(n))

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
    do i = 1, n
        print *, M_inv(i, :)
    end do

    deallocate(L, U, M, M_inv, x, c)
contains
    subroutine fatoracao_LU(A, L, U)
        double precision, dimension(:,:), intent(in) :: A
        double precision, dimension(:,:), intent(out) :: L, U
        
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
        
        c(1) = b(1)
        do i = 2, size(c)
            soma = 0
            do j = 1, i
                soma = soma + L(i, j)*c(j)
            end do
            c(i) = b(i) - soma
        end do
    end subroutine subs_direta
end program matriz_inversa
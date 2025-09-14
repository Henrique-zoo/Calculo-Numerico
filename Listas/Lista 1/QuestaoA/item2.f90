program item2
    use item1
    implicit none
    real :: a
    character(len=100) :: file

    ! |a| = 0
    a = 0
    file = "../Dados/Q(A)_item2_caso1.dat"
    call proc_item1(a, file) ! 1

    ! |a| < 1
    a = 0.4
    file = "../Dados/Q(A)_item2_caso2.dat"
    call proc_item1(a, file) ! 2
    a = -0.4
    file = "../Dados/Q(A)_item2_caso3.dat"
    call proc_item1(a, file) ! 3

    ! |a| = 1
    a = 1
    file = "../Dados/Q(A)_item2_caso4.dat"
    call proc_item1(a, file) ! 4
    a = -1
    file = "../Dados/Q(A)_item2_caso5.dat"
    call proc_item1(a, file) ! 5

    ! |a| > 1
    a = 20
    file = "../Dados/Q(A)_item2_caso6.dat"
    call proc_item1(a, file) ! 6
    a = -20
    file = "../Dados/Q(A)_item2_caso7.dat"
    call proc_item1(a, file) ! 7
end program item2
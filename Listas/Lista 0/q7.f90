program questao7
    implicit none
    real :: a, b, c, delta, x1, x2

    print *, "Resolução da equação quadrática ax² + bx + c = 0"
    print *, "Digite os coeficientes a, b e c:"
    read(*, *) a, b, c ! Formato: a b c\n

    delta = b*b - 4 * a * c

    if (delta > 0) then
        print *, "Há duas raízes reais distintas!"
        x1 = (-b + sqrt(delta)) / (2*a)
        x2 = (-b - sqrt(delta)) / (2*a)
        print *, "x1 = ", x1
        print *, "x2 = ", x2
    else if (delta == 0) then
        print *, "Há duas raízes reais idênticas!"
        x1 = -b / (2*a)
        print *, "x1 = x2 = ", x1
    else
        print *, "Há duas raízes complexas distintas!"
        x1 = -b / (2*a)
        x2 = sqrt(-delta) / (2*a)
        print *, "x1 = ", x1, " + j", x2
        print *, "x2 = ", x1, " - j", x2
    end if
end program questao7
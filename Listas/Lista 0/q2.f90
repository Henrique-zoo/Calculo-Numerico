program questao2
    implicit none
    integer :: iunit, temp_unit, iostat
    real :: trash, sen, arcsen
    character(len=100) :: iomsg

    open(newunit = iunit,           &
        file = '../Dados/q1.dat',   &
        status = 'old',             &
        action = 'readwrite',       &
        iostat = iostat,            &
        iomsg = iomsg               &
    )

    if (iostat /= 0) then
        print *, 'Erro ao abrir o arquivo: ', trim(iomsg)
        stop
    end if

    open(newunit = temp_unit, &
        status = 'scratch', &
        iostat = iostat, &
        iomsg = iomsg &
    )
    
    if (iostat /= 0) then
        print *, 'Erro ao criar arquivo temporário: ', trim(iomsg)
        stop
    end if

    do
        read(iunit, *, iostat=iostat) trash, sen
        if (iostat /= 0) exit
        write(temp_unit, *) sen, asin(sen)
    end do

    rewind(temp_unit)
    backspace(iunit)

    do
        read(temp_unit, *, iostat=iostat) sen, arcsen
        if (iostat /= 0) exit
        write(iunit, *) sen, arcsen
    end do

    close(iunit)
    close(temp_unit)

end program questao2
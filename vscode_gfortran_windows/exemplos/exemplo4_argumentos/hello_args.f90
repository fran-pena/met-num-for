program hello_args
  implicit none
  integer :: i, n
  character(255) :: arg ! maximum path length in Windows API

  call get_command_argument(1, arg)
  read(arg, *) n
  do i = 1, n
      print*, 'Hello', i
  end do
end program  
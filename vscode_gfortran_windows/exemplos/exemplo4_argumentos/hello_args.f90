program hello_read
  implicit none
  integer :: i, n
  character(260) :: arg ! 260 is the maximum path length in Windows API

  call get_command_argument(1, arg)
  read(arg, *) n
  do i = 1, n
      print*, 'Hello', i
  end do
end program  
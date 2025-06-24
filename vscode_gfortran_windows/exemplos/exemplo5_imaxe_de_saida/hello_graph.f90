program hello_graph
  implicit none
  integer :: iu
  character(260) :: file ! 260 is the maximum path length in Windows API

  call get_command_argument(1, file)
  open(newunit=iu, file = 'output_graph.m', position='rewind')
  write(iu,*) 'h = figure(''visible'',''off'');'

  write(iu,*) 'x = [', [1, 4, 9, 16, 25], '];'
  write(iu,*) 'y = [', [1, 2, 3,  4,  5], '];'
  write(iu,*) 'plot(x,y)'
  write(iu,*) 'saveas(h,''', trim(file), ''')'
  close(iu)
end program  
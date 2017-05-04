
program t
  use elsi

  type(elsi_t) :: elsi_h

  call init_elsi(elsi_h,solver=1)

  call print_elsi_handle(elsi_h)
  
end program t


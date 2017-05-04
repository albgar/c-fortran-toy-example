
program t
  use elsi
  use m_init, only: init_elsi, print_elsi_handle
  use, intrinsic :: iso_c_binding

  type(elsi_t), target :: elsi_handle
  type(c_ptr) :: elsi_h

  elsi_h = c_loc(elsi_handle) 
  
  call init_elsi(elsi_h,1)

  call print_elsi_handle(elsi_h)
  
end program t


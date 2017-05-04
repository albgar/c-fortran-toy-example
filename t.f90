
program t
  use elsi
  use m_init, only: init_elsi, print_elsi_handle
  use, intrinsic :: iso_c_binding

  !! type(elsi_t), pointer :: elsi_handle
  type(c_ptr) :: elsi_h

  ! This will allocate a derived type and return
  ! its address in elsi_h
  
  call init_elsi(elsi_h,1)

  ! This will formally create a typed pointer,
  ! but in this current version without wrappers
  ! we cannot use it
  
  !!   call c_f_pointer(elsi_h,elsi_handle)

  ! We need to keep using the c_ptr for calls into
  ! the library routines.
  ! This is undesirable because we loose the compiler
  ! type checking
  
  call print_elsi_handle(elsi_h)
  
end program t


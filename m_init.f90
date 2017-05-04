module m_init
  
  public :: init_elsi, print_elsi_handle
  
CONTAINS
  
  subroutine print_elsi_handle(elsi_h) bind(C,name="c_print_elsi_handle")
  use, intrinsic :: iso_c_binding 
  use elsi

  implicit none

  type(c_ptr), value :: elsi_h

  type(elsi_t), pointer :: elsi_h_p

  call c_f_pointer(elsi_h,elsi_h_p)
  print *, elsi_h_p%solver 

end subroutine print_elsi_handle

subroutine init_elsi(elsi_h,solver)  bind(C,name="c_init_elsi")

  use, intrinsic :: iso_c_binding
  use elsi

  implicit none

  !  type(c_ptr), value :: elsi_h
  ! Note that we cannot use the "value" attribute, since it
  ! is formally "intent(out)"
  
  type(c_ptr) :: elsi_h
  integer(kind=c_int), value, intent(in) :: solver

  type(elsi_t), pointer :: elsi_h_p

  ! Create a new instance of the derived type, fill it,
  ! and return its address to the C side
  
  allocate(elsi_h_p)
  elsi_h_p%solver = solver
  elsi_h = c_loc(elsi_h_p)
  
end subroutine init_elsi
end module m_init

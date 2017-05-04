module elsi_wrappers
  use, intrinsic :: iso_c_binding 
  use elsi

  implicit none
  
CONTAINS
  
  subroutine w_print_elsi_handle(elsi_h) bind(C,name="c_print_elsi_handle")
  type(c_ptr), value :: elsi_h

  type(elsi_t), pointer :: elsi_h_p

  call c_f_pointer(elsi_h,elsi_h_p)
  call print_elsi_handle(elsi_h_p)

end subroutine w_print_elsi_handle

subroutine w_init_elsi(elsi_h,solver)  bind(C,name="c_init_elsi")

  ! Note that we cannot use the "value" attribute, since it
  ! is formally "intent(out)"
  
  type(c_ptr) :: elsi_h
  integer(kind=c_int), value, intent(in) :: solver

  type(elsi_t), pointer :: elsi_h_p

  ! Create a new instance of the derived type, fill it,
  ! and return its address to the C side
  
  allocate(elsi_h_p)
  call init_elsi(elsi_h_p,solver)

  elsi_h = c_loc(elsi_h_p)
  
end subroutine w_init_elsi

subroutine w_end_elsi(elsi_h)  bind(C,name="c_end_elsi")
  type(c_ptr), value :: elsi_h

  type(elsi_t), pointer :: elsi_h_p
  call end_elsi(elsi_h_p)

end subroutine w_end_elsi

subroutine w_elsi_solve(elsi_h_cptr,matrix_h_cptr,sum_mat)  bind(C,name="c_elsi_solve")
  use matrix
  
  type(c_ptr), value :: elsi_h_cptr
  type(c_ptr), value :: matrix_h_cptr
  real(c_double), intent(out)  :: sum_mat  ! will pass address on C side as '&sum'
  
  type(elsi_t), pointer :: elsi_h_p
  type(matrix_t), pointer :: matrix_h_p

  call c_f_pointer(elsi_h_cptr,elsi_h_p)
  call c_f_pointer(matrix_h_cptr,matrix_h_p)
  call elsi_solve(elsi_h_p,matrix_h_p,sum_mat)

end subroutine w_elsi_solve
end module elsi_wrappers

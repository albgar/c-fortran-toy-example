module matrix_wrappers

  use iso_c_binding
  use matrix
  
  private

CONTAINS
  
  subroutine w_matrix_register(matrix_h_cptr,a,n,type) &
           bind(C,name="c_matrix_register")

    ! No 'value' attribute as it is 'intent(out)'
    type(c_ptr) :: matrix_h_cptr

    ! This is also passed by reference
    real(c_double), intent(in)  :: a(n)

    ! These passed by value
    integer(c_int), value :: n
    integer(c_int), value :: type

    type(matrix_t), pointer :: matrix_h_p

    allocate(matrix_h_p)
    call matrix_register(matrix_h_p,a,n,type)

    ! Pass address back to C side
    matrix_h_cptr = c_loc(matrix_h_p)

  end subroutine w_matrix_register

  !------------------
  subroutine w_matrix_print(matrix_h_cptr) &
               bind(C,name="c_matrix_print")

    ! This is passed by value
    type(c_ptr), value :: matrix_h_cptr

    type(matrix_t), pointer :: matrix_h_p

    call c_f_pointer(matrix_h_cptr,matrix_h_p)
    call matrix_print(matrix_h_p)
    
  end subroutine w_matrix_print

end module matrix_wrappers

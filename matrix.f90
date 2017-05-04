module matrix

  use iso_c_binding

  implicit none
  private
  
  type, public :: matrix_t
     integer :: type
     ! I defer the issues related to two-dimensional arrays for now
     ! focusing on the type passing
     real(c_double), allocatable :: val(:)
  end type matrix_t

  public :: matrix_register, matrix_print

CONTAINS
  
  subroutine matrix_register(matrix_h,a,n,type) 
    type(matrix_t), intent(inout) :: matrix_h
    integer(c_int) :: n
    real(c_double), intent(in)  :: a(n)
    integer(c_int) :: type

    matrix_h%type = type
    allocate(matrix_h%val(n))
    matrix_h%val(:) = a(:)
    
  end subroutine matrix_register

    subroutine matrix_print(matrix_h)
    type(matrix_t), intent(in) :: matrix_h

    print "(4f10.4)", matrix_h%val
    
  end subroutine matrix_print

  subroutine w_matrix_register(matrix_h_cptr,a,n,type) bind(C,name="c_matrix_register")

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

  subroutine w_matrix_print(matrix_h_cptr) bind(C,name="c_matrix_print")

    ! This is passed by value
    type(c_ptr), value :: matrix_h_cptr

    type(matrix_t), pointer :: matrix_h_p

    call c_f_pointer(matrix_h_cptr,matrix_h_p)
    call matrix_print(matrix_h_p)
    
  end subroutine w_matrix_print
  
end module matrix

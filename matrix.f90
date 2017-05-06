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

end module matrix

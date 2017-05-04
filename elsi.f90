module elsi

  implicit none
  
  private
  type, public :: elsi_t
     integer :: solver
     integer, allocatable :: a(:)
     integer :: solver_calls = 0
  end type elsi_t

  public :: init_elsi, print_elsi_handle, end_elsi
  public :: elsi_solve
  
CONTAINS

  ! A dummy routine to "solve" some matrix problem
  subroutine elsi_solve(elsi_h,mat_h,sum_mat)
    use iso_c_binding
    use matrix
    
    type(elsi_t), intent(inout) :: elsi_h
    type(matrix_t), intent(in) :: mat_h
    real(c_double), intent(out) :: sum_mat

    sum_mat = sum(mat_h%val(:))
    elsi_h%solver_calls = elsi_h%solver_calls + 1
    
  end subroutine elsi_solve

  subroutine print_elsi_handle(elsi_h)

  implicit none

  type(elsi_t), intent(in) :: elsi_h

  print *, elsi_h%solver 
  print *, "Number of solver calls: ", elsi_h%solver_calls
  print "(8i3)", elsi_h%a

end subroutine print_elsi_handle

subroutine init_elsi(elsi_h,solver)
  use iso_c_binding, only: c_int
  implicit none

  type(elsi_t), intent(inout) :: elsi_h
  integer(kind=c_int), intent(in) :: solver

  elsi_h%solver = solver
  allocate(elsi_h%a(5))
  elsi_h%a = [1,2,3,4,5]
  
end subroutine init_elsi

subroutine end_elsi(elsi_h)
  implicit none

  type(elsi_t), intent(inout) :: elsi_h

  if (allocated(elsi_h%a)) deallocate(elsi_h%a)
  
end subroutine end_elsi

end module elsi


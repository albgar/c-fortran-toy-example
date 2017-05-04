module elsi

  implicit none
  
  private
  type, public :: elsi_t
     integer :: solver
     integer, allocatable :: a(:)
  end type elsi_t

  public :: init_elsi, print_elsi_handle
  
CONTAINS
  
  subroutine print_elsi_handle(elsi_h)

  implicit none

  type(elsi_t), intent(in) :: elsi_h

  print *, elsi_h%solver 
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
end module elsi


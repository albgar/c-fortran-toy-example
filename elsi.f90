module elsi

  implicit none
  
  private
  type, public :: elsi_t
     integer :: solver
  end type elsi_t

  public :: init_elsi, print_elsi_handle
  
CONTAINS
  
  subroutine print_elsi_handle(elsi_h)

  implicit none

  type(elsi_t), intent(in) :: elsi_h

  print *, elsi_h%solver 

end subroutine print_elsi_handle

subroutine init_elsi(elsi_h,solver)
  use iso_c_binding, only: c_int
  implicit none

  type(elsi_t), intent(inout) :: elsi_h
  integer(kind=c_int), intent(in) :: solver

  elsi_h%solver = solver
  
end subroutine init_elsi
end module elsi


program fsolve
  use elsi
  use matrix
  use iso_c_binding

  real(c_double), allocatable :: a(:)
  integer, parameter :: n = 4, type=3

  type(elsi_t) :: elsi_h
  type(matrix_t) :: matrix_h
  
  integer :: i
  real(c_double) :: sum_mat
  
  allocate(a(n))
  do i = 1, n
     a(i) = real(i,kind=c_double)
  enddo

  call matrix_register(matrix_h,a,n,type)

  call init_elsi(elsi_h,solver=1)
  call elsi_solve(elsi_h,matrix_h,sum_mat)
  print *, "Sum of elements: ", sum_mat
  
  call print_elsi_handle(elsi_h)

end program fsolve

program fmat
  use matrix
  use iso_c_binding

  real(c_double), allocatable :: a(:)
  integer, parameter :: n = 5, type=3

  type(matrix_t) :: matrix_h
  
  integer :: i
  
  allocate(a(n))
  do i = 1, n
     a(i) = real(i,kind=c_double)
  enddo

  call matrix_register(matrix_h,a,n,type)
  call matrix_print(matrix_h)
end program fmat

#include <stdio.h>
#include <stdlib.h>

/* Example of calls to matrix Fortran module */

#include "matrix.h"

int main()
{
  int n=4;
  int type=1;
  Matrix_handle matrix_handle;
  double *a;
  int i;

  a = (double*)malloc(n*sizeof(double));
  for (i=0; i<n; i++) {
    a[i] = i + 1; }

  c_matrix_register(&matrix_handle,a,n,type);
  c_matrix_print(matrix_handle);
  return 0;
}

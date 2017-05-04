#include <stdio.h>
#include <stdlib.h>

/* Example of calls to matrix Fortran module */

/* Note the 'passing by reference' of the pointer in this call */
void c_matrix_register(void **p, double *a, int n, int type);
void c_matrix_print(void  *p);

int main()
{
  int n=4;
  int type=1;
  void *matrix_handle;
  double *a;
  int i;

  a = (double*)malloc(n*sizeof(double));
  for (i=0; i<n; i++) {
    a[i] = i + 1; }

  c_matrix_register(&matrix_handle,a,n,type);
  c_matrix_print(matrix_handle);
  return 0;
}

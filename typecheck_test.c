#include <stdio.h>
#include <stdlib.h>

#include "elsi.h"
#include "matrix.h"

#define ELPA 1

int main()
{
  int solver = ELPA;
  ELSI_handle elsi_handle;

  int n=4;
  int type=1;
  Matrix_handle matrix_handle;
  double *a;
  double sum;
  int i;

  /* We need to get back the actual value of the address,
     so we cannot pass elsi_handle by value...
     See:
     http://stackoverflow.com/questions/2229498/passing-by-reference-in-c
  */
  c_init_elsi(&elsi_handle,solver);

  a = (double*)malloc(n*sizeof(double));
  for (i=0; i<n; i++) {
    a[i] = i + 1; }

  c_matrix_register(&matrix_handle,a,n,type);

  c_elsi_solve(matrix_handle,elsi_handle,&sum);
  printf("Sum of elements: %10.4f\n",sum);  
  c_print_elsi_handle(elsi_handle);
  c_end_elsi(elsi_handle);
  return 0;
}

#include <stdio.h>
#include <stdlib.h>

/* Combination of elsi and matrix calls. 
   Could use typedefs and subroutines in the future */

typedef void * ELSI_handle;
typedef void * Matrix_handle;

void c_init_elsi(ELSI_handle *elsi_h, int a);
void c_print_elsi_handle(ELSI_handle elsi_h);
void c_end_elsi(ELSI_handle elsi_h);
void c_elsi_solve(ELSI_handle elsi_h, Matrix_handle mat_h, double *sum);

/* Note the 'passing by reference' of the pointer in this call */
void c_matrix_register(Matrix_handle *mat_h, double *a, int n, int type);
void c_matrix_print(Matrix_handle mat_h);

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

  c_elsi_solve(elsi_handle,matrix_handle,&sum);
  printf("Sum of elements: %10.4f\n",sum);  
  c_print_elsi_handle(elsi_handle);
  c_end_elsi(elsi_handle);
  return 0;
}

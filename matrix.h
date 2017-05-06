#ifndef MATRIX_H_INCLUDED
#define MATRIX_H_INCLUDED

#include "my_macros.h"

DECLARE_HANDLE(Matrix_handle);

/* Note the 'passing by reference' of the pointer in this call */
void c_matrix_register(Matrix_handle *mat_h, double *a, int n, int type);
void c_matrix_print(Matrix_handle mat_h);

#endif

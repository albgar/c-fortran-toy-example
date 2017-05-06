#ifndef ELSI_H_INCLUDED
#define ELSI_H_INCLUDED

#include "my_macros.h"

DECLARE_HANDLE(ELSI_handle);


void c_init_elsi(ELSI_handle *elsi_h, int a);
void c_print_elsi_handle(ELSI_handle elsi_h);
void c_end_elsi(ELSI_handle elsi_h);

/* Pieces using Matrix functionality */

#include "matrix.h"

void c_elsi_solve(ELSI_handle elsi_h, Matrix_handle mat_h, double *sum);

#endif /* ELSI_H_INCLUDED */

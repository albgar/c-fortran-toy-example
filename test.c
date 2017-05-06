#include <stdio.h>

#include "elsi.h"

int main()
{
  int solver;
  ELSI_handle elsi_handle;

  solver = 1;
  /* We need to get back the actual value of the address,
     so we cannot pass elsi_handle by value...
     See:
     http://stackoverflow.com/questions/2229498/passing-by-reference-in-c
  */
  c_init_elsi(&elsi_handle,solver);
  c_print_elsi_handle(elsi_handle);
  c_end_elsi(elsi_handle);
  return 0;
}

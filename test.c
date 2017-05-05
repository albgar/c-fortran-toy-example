#include <stdio.h>

typedef void * ELSI_handle;
void c_init_elsi(ELSI_handle *elsi_h, int a);
void c_print_elsi_handle(ELSI_handle elsi_h);
void c_end_elsi(ELSI_handle elsi_h);

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

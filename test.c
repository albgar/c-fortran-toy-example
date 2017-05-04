#include <stdio.h>
void c_init_elsi(void **p, int a);
void c_print_elsi_handle(void  *p);

int main()
{
  int solver;
  void *elsi_handle;

  solver = 1;
  /* We need to get back the actual value of the address,
     so we cannot pass elsi_handle by value...
     See:
     http://stackoverflow.com/questions/2229498/passing-by-reference-in-c
  */
  c_init_elsi(&elsi_handle,solver);
  c_print_elsi_handle(elsi_handle);
  return 0;
}

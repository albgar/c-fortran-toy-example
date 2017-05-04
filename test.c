#include <stdio.h>
void c_init_elsi(void *p, int a);
void c_print_elsi_handle(void  *p);

int main()
{
  int solver;
  void *elsi_handle;

  solver = 1;
  c_init_elsi(elsi_handle,solver);
  c_print_elsi_handle(elsi_handle);
  return 0;
}

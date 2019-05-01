Toy example for C-Fortran interoperability with opaque types

(Originally prepared for the ELSI project in May 2017)

The Fortran side uses derived types to keep state and encapsulate
the functionality.

On the C side, the contents of those derived types are NOT
replicated. Instead, they are mapped to opaque handles (defined
formally as 'structs' in order to enable strong type checking by the C
compiler -- see "my_macros.h" and try to compile 'typecheck_test' to
see it in action).

C-Fortran wrapper routines use the 'iso_c_binding' technology, in
particular the `type(c_ptr)' universal pointer concept.

The only limitation to this approach is that the Fortran routines must
use as other arguments interoperable types (i.e., no allocatable
arrays, or assumed-shape arrays, for example).

Note however that among the other arguments can be other derived
types, as long as they are also mapped to opaque handles in the C
side. As an example, the 'matrix' module implements a toy matrix
derived type. An argument of this type is used in the 'elsi_solve'
routine.

Note: Derived types are fully handled in the Fortran side, and all the
relevant operations on them implemented in Fortran. To initialize the
C handles we need to pass to the C side the memory location of the
Fortran data structure. Since C functions arguments are passed by
value, we need to pass a pointer to the handle to the initialization
function. Other functions in the C interface just pass the handle
itself.

This toy package consists of two "libraries" (`matrix` and `elsi`), with
the second using functionality from the first. Each library is implemented
in Fortran, wrappers are provided for the C interface (with iso_c_binding), and
`.h` interface files are provided for the C side.

| Fortran "library"  |  C-wrappers          |  C interface file |
| -----------------  |  ----------          |  ---------------- |
| matrix.f90         |  matrix_wrappers.f90 |  matrix.h         |
| elsi.f90           |  elsi_wrappers.f90   |  elsi.h           |

As example programs: fmat.f90, fsimple.f90, and fsolve.f90 in Fortran,
and cmat.c, csimple.c, and csolve.c in C.


To compile the examples, use the makefile provided.

The 'wrapper' routines are put in modules for convenience. Note that
nothing needs to be exported from these modules: the C binding names
are taken from the "bind" attributes in the routines themselves.

Alberto Garcia
albertog@icmab.es
May 2017



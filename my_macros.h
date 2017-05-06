#ifndef MY_MACROS_H_INCLUDED
#define MY_MACROS_H_INCLUDED

/* This macro declares 'name' as a trivial struct. This is
   done so that the C compiler can perform type checking
   when there are several different kinds of opaque handles.
   The simple form 'typedef void * name Handle_A' will not
   achieve this.
   See: http://stackoverflow.com/questions/376452/  
*/
   
#define DECLARE_HANDLE(name) struct name##__ { int unused; }; \
                               typedef struct name##__ *name

#endif

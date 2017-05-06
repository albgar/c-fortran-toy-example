#ifndef MY_MACROS_H_INCLUDED
#define MY_MACROS_H_INCLUDED

#define DECLARE_HANDLE(name) struct name##__ { int unused; }; \
                               typedef struct name##__ *name

#endif

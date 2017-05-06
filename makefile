.SUFFIXES:
.SUFFIXES: .c .f90 .o .a

FC=gfortran
FCFLAGS = -g -O0 -fcheck=bounds
CFLAGS = -g -O0
CC=gcc
#
all: csimple fsimple cmat fmat csolve fsolve 
#
csimple: csimple.o elsi_wrappers.o elsi.o
	$(FC) -o csimple csimple.o elsi.o elsi_wrappers.o
fsimple: fsimple.o elsi.o
	$(FC) -o fsimple fsimple.o elsi.o
#
elsi.o: matrix.o
elsi_wrappers.o: elsi.o matrix.o
matrix_wrappers.o: matrix.o
fsimple.o:  elsi.o

csimple.o: elsi.h elsi_wrappers.o
cmat.o: matrix.h matrix_wrappers.o
csolve.o: elsi.h matrix.h elsi_wrappers.o matrix_wrappers.o
#
cmat: cmat.o matrix.o matrix_wrappers.o
	$(FC) -o cmat cmat.o matrix.o matrix_wrappers.o
#
fmat: fmat.o matrix.o
	$(FC) -o fmat fmat.o matrix.o
#
csolve: csolve.o matrix.o elsi.o elsi_wrappers.o matrix_wrappers.o
	$(FC) -o csolve csolve.o matrix.o elsi.o\
                 elsi_wrappers.o matrix_wrappers.o
#
typecheck_test: typecheck_test.o matrix.o elsi.o \
                elsi_wrappers.o matrix_wrappers.o
	$(FC) -o typecheck_test typecheck_test.o matrix.o elsi.o \
                 elsi_wrappers.o matrix_wrappers.o
#
fsolve: fsolve.o matrix.o elsi.o 
	$(FC) -o fsolve fsolve.o matrix.o elsi.o 
#
.f90.o:
	$(FC) $(FCFLAGS) -c $<

clean:
	rm -f *.o *.mod csimple fsimple cmat fmat typecheck_test csolve fsolve



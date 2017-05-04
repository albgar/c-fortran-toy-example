.SUFFIXES:
.SUFFIXES: .c .f90 .o .a

FC=gfortran
FCFLAGS = -g -O0 -fcheck=bounds
CFLAGS = -g -O0
CC=gcc

chh: test.o wrappers.o elsi.o
	$(FC) -o chh test.o elsi.o wrappers.o
fhh: t.o elsi.o
	$(FC) -o fhh t.o elsi.o
#
wrappers.o: elsi.o
t.o:  elsi.o
#
cmat: cmat.o matrix.o
	$(FC) -o cmat cmat.o matrix.o
#
fmat: fmat.o matrix.o
	$(FC) -o fmat fmat.o matrix.o
#
csolve: csolve.o matrix.o elsi.o wrappers.o
	$(FC) -o csolve csolve.o matrix.o elsi.o wrappers.o
#
fsolve: fsolve.o matrix.o elsi.o 
	$(FC) -o fsolve fsolve.o matrix.o elsi.o 
#
.f90.o:
	$(FC) $(FCFLAGS) -c $<

clean:
	rm -f *.o chh fhh cmat fmat csolve



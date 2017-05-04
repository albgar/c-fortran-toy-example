.SUFFIXES:
.SUFFIXES: .c .f90 .o .a

FC=gfortran
CC=gcc

chh: test.o wrappers.o elsi.o
	$(FC) -o chh test.o elsi.o wrappers.o
fhh: t.o elsi.o
	$(FC) -o fhh t.o elsi.o
#
wrappers.o: elsi.o
t.o:  elsi.o
#
.f90.o:
	$(FC) -c $<



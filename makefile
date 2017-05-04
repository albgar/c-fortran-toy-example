.SUFFIXES:
.SUFFIXES: .c .f90 .o .a

FC=gfortran
CC=gcc

chh: test.o m_init.o elsi.o
	$(FC) -o chh test.o m_init.o elsi.o
fhh: t.o m_init.o elsi.o
	$(FC) -o fhh t.o m_init.o elsi.o
#
m_init.o: elsi.o
t.o:  m_init.o elsi.o
#
.f90.o:
	$(FC) -c $<



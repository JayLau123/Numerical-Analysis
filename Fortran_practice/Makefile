########################################
#
# A makefile for windows
#                   Libo
#                   2011-08-20
#
########################################
FC = gfortran

tt = exm101.exe exm202.exe exm201.f95 exm31.exe\
	exm401.exe exm402.exe exm43.exe exm44.exe\
	exm51.exe exm52.exe exm53.exe exm54.exe exm55.exe\
	exm56.exe exm57.exe\
	exm62.exe exm65.exe exm66.exe\
	exm67.exe exm68.exe\
	exm71.exe exm72.exe exm74.exe exm75.exe \
	exm76.exe exm77.exe exm78.exe exm79.exe \
	exm7a.exe exm7b.exe exm7c.exe exm7d.exe \
	exm81.exe exm82.exe exm83.exe exm84.exe exm85.exe\
	exm86.exe exm87.exe\
	exm91.exe exm92.exe exm93.exe exm94.exe exm95.exe exm96.exe

qq = exm02.f.exe

all : $(tt) $(qq)
phony: clean

%.exe : %.f90
	$(FC) $^ -o $@
%.f.exe : %.f
	$(FC) $^ -o $@
clean :
	if exist exm??.exe del exm??.exe
	if exist exm02.f.exe del exm02.f.exe
	if exist *.out del *.out
	if exist *.o del *.o	

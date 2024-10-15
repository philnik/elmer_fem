

gmsh = "C:\Program Files\FreeCAD 0.21\bin\gmsh.exe"

mesh:
	$(gmsh) -2 beam2d.geo 
	ElmerGrid 14 2 beam2d.msh -autoclean

f90:
	"C:\Users\filip\opt\ElmerFEM-gui-mpi-Windows-AMD64\stripped_gfortran\bin\x86_64-w64-mingw32-gfortran.exe" force.f90  -fallow-argument-mismatch  -DCONTIG= -DMINGW32 -DWIN32 -DHAVE_EXECUTECOMMANDLINE -DUSE_ISO_C_BINDINGS -DUSE_ARPACK -O3 -DNDEBUG -O3  -shared -I"C:\Users\filip\opt\ElmerFEM-gui-mpi-Windows-AMD64\share\elmersolver\include" -L"C:\Users\filip\opt\ElmerFEM-gui-mpi-Windows-AMD64\bin" -shared -lelmersolver -o force.dll
	cp force.dll ./sif/force.dll


lisp: clean f90
	beam2d.exe


plot:	lisp
	gnuplot plot_file.plt
	wsl qiv image.png

clean:

	rm -rf sif 2> /dev/null
	rm -rf vtu 2> /dev/null
	rm -f *~ 2> /dev/null
	mkdir sif
	mkdir vtu

blisp: 
	sbcl --load lisp/run.lisp


all: clean mesh f90 blisp lisp plot 

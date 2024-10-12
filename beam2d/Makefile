

gmsh = "C:\Program Files\FreeCAD 0.21\bin\gmsh.exe"

build:
	$(gmsh) -2 beam2d.geo 
	ElmerGrid 14 2 beam2d.msh -autoclean
	ElmerSolver beam2d.sif

run:
	ElmerSolver beam2d.sif


lisp: clean
	beam2d.exe


plot:	lisp
	gnuplot plot_file.plt
	wsl qiv image.png

clean:
	rm -f sif/* 2> /dev/null
	rm -f vtu/* 2> /dev/null
	rm -f *~ 2> /dev/null

blisp: 
	sbcl --load lisp/run.lisp


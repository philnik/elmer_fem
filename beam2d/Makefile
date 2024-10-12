

gmsh = "C:\Program Files\FreeCAD 0.21\bin\gmsh.exe"

build:
	$(gmsh) -2 beam2d.geo 
	ElmerGrid 14 2 beam2d.msh -autoclean
	ElmerSolver beam2d.sif

run:
	ElmerSolver beam2d.sif

plot:
	gnuplot plot_file.plt
	wsl qiv image.png

clean:
	rm sif/*
	rm vtu/*
	rm *~

sif: clean
	sbcl --load param.lisp

all: sif plot
	echo "hello"

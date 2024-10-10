

gmsh = "C:\Program Files\FreeCAD 0.21\bin\gmsh.exe"

build:
	$(gmsh) -2 beam2d.geo 
	ElmerGrid 14 2 beam2d.msh -autoclean
	ElmerSolver beam2d.sif

run:
	ElmerSolver beam2d.sif

plot:
	gnuplot plot_line.plt
	wsl qiv image.png

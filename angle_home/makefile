gmsh = "C:/Program Files/FreeCAD 0.21/bin/gmsh.exe"

parametric:
	python angle_home.py

grid:
	$(gmsh) angle_home.geo -2
	ElmerGrid 14 2 angle_home.msh -autoclean

all: parametric grid
	echo "ok!"

solver: all
	ElmerSolver angle_home.sif
#	python test_pyvista.py

gmsh:
	$(gmsh) angle_home.msh

gmsh_lines:
	$(gmsh) angle_home.geo

clean:
	rm -f fan_pull_out.geo
	rm -f *.msh
	#rm -f -r fan_pull_out
	rm -f mesh*

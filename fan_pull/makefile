

gmsh = "C:/Program Files/FreeCAD 0.21/bin/gmsh.exe"

parametric:
	python parametric_geo.py
	python sif_templates.py

grid:
	$(gmsh) fan_pull_out.geo -2
	ElmerGrid 14 2 fan_pull_out.msh -autoclean

all: parametric grid
	echo "ok!"

solver: all
	ElmerSolver ocase.sif
	python test_pyvista.py

gmsh:
	$(gmsh) fan_pull_out.msh

clean:
	rm -f fan_pull_out.geo
	rm -f *.msh
	#rm -f -r fan_pull_out
	rm -f mesh*

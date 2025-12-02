gmsh = "C:/Program Files/FreeCAD 0.21/bin/gmsh.exe"
dxf2geo = wsl perl "../femscripts/dxf2geo.pl"

pre = shell03

dxf:
	wsl ../femscripts/convert_dxf.sh	

parametric:
	python $(pre).py

msh:
	$(gmsh) $(pre).geo -2

elmergrid:
	ElmerGrid 14 2 $(pre).msh -autoclean

grid: msh elmergrid


all: parametric grid
	echo "ok!"

solver: all
	ElmerSolver $(pre).sif
#	python test_pyvista.py

mpi_solver: all
	"C:\Program Files (x86)\Intel\oneAPI\mpi\2021.13\bin\mpiexec.exe"  ElmerSolver_mpi -n 2 shell03.sif


gmsh:
	$(gmsh) $(pre).msh

gmsh_lines:
	$(gmsh) $(pre).geo

clean:
	rm -f resu/*
	rm -f *.msh
	#rm -f -r fan_pull_out
	rm -f mesh*

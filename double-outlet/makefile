

clean:
	rm resu/*vtu

run:
	ElmerSolver acoustic_box.sif

gmsh:
	gmsh double-outlet.geo

dxf2geo:
	wsl perl ./dxf2geo.pl double-outlet.dxf

elmergrid:
	ElmerGrid 14 2 double-outlet.msh -autoclean

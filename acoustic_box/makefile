

clean:
	rm resu/*vtu

run:
	ElmerSolver acoustic_box.sif


dxf2geo:
	wsl perl ./dxf2geo.pl acoustic_box.dxf 

elmergrid:
	ElmerGrid 14 2 acoustic_box.msh -autoclean

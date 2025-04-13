    1  cat case.sif 
    2  cd ..
    3  ls
    4  ElmerSolver venturi.sif 
    5  ElmerSolver venturi.sif 
    6  ls
    7  cd venturi_transient/
    8  ls
    9  ElmerSolver venturi.sif 
   10  ElmerSolver venturi.sif 
   11  ls
   12  cd ..
   13  ElmerSolver venturi.sif 
   14  ElmerSolver venturi.sif 
   15  ElmerSolver venturi.sif 
   16  ElmerSolver v2.sif 
   17  ElmerSolver v2.sif 
   18  ls
   19  $gmsh venturi.geo 
   20  ElmerGrid 14 2 venturi.msh 
   21  ElmerSolver v2.sif 
   22  ls
   23  ElmerGrid 14 2 venturi.msh -autoclean
   24  ElmerSolver v2.sif 
   25  ElmerSolver v2.sif 
   26  ElmerSolver v2.sif 
   27  ElmerSolver v2.sif 
   28  ElmerSolver v2.sif 
   29  ElmerSolver v2.sif 
   30  ElmerSolver v2.sif 
   31  ElmerSolver v2.sif 
   32  ls
   33  ls
   34  ls
   35  ls
   36  cd venturi_trans4/
   37  ls
   38  ls
   39  ls
   40  ls
   41  ls
   42  ls
   43  ls
   44  ls
   45  ls
   46  ls
   47  ls
   48  ls
   49  ls
   50  cd ../..
   51  cd beam3d/
   52  ls
   53  cd gui
   54  ls
   55  ElmerSolver case.sif 
   56  ElmerSolver case.sif 
   57  ElmerSolver case.sif 
   58  ls
   59  paraview 
   60  ls
   61  cd ..
   62  ls
   63  $gmsh beam3d.geo 
   64  ls
   65  ElmerGrid 14 2 beam3d.msh -autoclean
   66  cd gui
   67  ls
   68  ElmerSolver case.sif 
   69  ls
   70  $gmsh ../beam3d.msh 
   71  $gmsh ../beam3d.msh 
   72  ElmerSolver case.sif 
   73  ElmerSolver case.sif 
   74  ElmerSolver case.sif 
   75  ElmerSolver case.sif 
			     
   76  ls
   77  ElmerSolver case.sif 
			     
   78  cd ..
   79  cd ..
   80  mkdir -p beam2d
   81  cd beam2d
   82  ls
   83  ls
   84  ls
   85  cp ../beam3d/dxf2geo.pl ./
   86  ls
   87  perl dxf2geo.pl beam2d.dxf 
   88  ls
   89  $gmsh beam2d.geo 
   90  $gmsh beam2d.geo 
   91  perl dxf2geo.pl beam2d.geo 
   92  ls
   93  $gmsh beam2d.geo 
   94  $gmsh beam2d.geo 
   95  ls
   96  ElmerGrid 14 2 beam2d.msh -autoclean
   97  ls
   98  mkdir -p gui
   99  ElmerSolver beam2d.sif 
  100  ElmerSolver beam2d.sif 
  101  ls
  102  $gmsh -2 beam2d.geo 
  103  $gmsh beam2d.msh 
  104  $gmsh beam2d.msh 
  105  $gmsh -2 beam2d.geo 
  106  $gmsh beam2d.msh 
  107  $gmsh -2 beam2d.geo 
  108  $gmsh beam2d.msh 
  109  $gmsh -2 beam2d.geo 
  110  $gmsh beam2d.msh 
  111  $gmsh -2 beam2d.geo 
  112  $gmsh beam2d.msh 
  113  ElmerGrid 14 2 beam2d.msh 
  114  ElmerGrid 14 2 beam2d.msh -autoclean
  115  ls
  116  ElmerSolver beam2d.sif 
  117  ls
  118  ElmerGrid 14 2 beam2d.msh -autoclean
  119  $gmsh -2 beam2d.geo 
  120  ls
  121  ElmerGrid 14 2 beam2d.msh -autoclean
  122  ElmerGrid 14 2 beam2d.msh -autoclean
  123  ElmerSolver beam2d.sif 
  124  $gmsh -2 beam2d.geo 
  125  ElmerGrid 14 2 beam2d.msh -autoclean
  126  ElmerSolver beam2d.sif 
  127  history
  128  history > run.sh

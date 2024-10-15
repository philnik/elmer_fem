
set terminal png
unset key
set output "image.png
set term png size 1000,1000
set grid
plot \
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/200.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/400.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/600.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/800.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/1000.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/1200.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/1400.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/1600.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/1800.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/2000.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/2200.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/2400.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/2600.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/2800.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/3000.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/3200.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/3400.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/3600.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/3800.dat" using 4:8 with lines,\

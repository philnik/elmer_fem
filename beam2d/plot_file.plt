
set terminal png
unset key
set output "image.png
set term png size 1000,1000
set grid
plot \
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/100.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/200.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/300.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/400.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/500.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/600.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/700.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/800.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/900.dat" using 4:8 with lines,\

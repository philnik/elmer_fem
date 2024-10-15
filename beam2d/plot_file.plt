
set terminal png
unset key
set output "image.png
set term png size 1000,1000
set grid
plot \
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/4.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/5.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/6.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/7.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/8.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/9.dat" using 4:8 with lines,\
"c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d//vtu/10.dat" using 4:8 with lines,\

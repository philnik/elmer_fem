reset

set terminal jpeg
set output "1.jpg"

set xrange [0:0.5]
plot "point_data.dat" using 5:6 w l linetype 4 title "Pressure"

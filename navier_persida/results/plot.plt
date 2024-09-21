reset

set terminal jpeg
set output "0.jpg"
set multiplot

cxmax = 400
cymax = 2

set xrange [0:cxmax]
set yrange [0:cymax]
set key left
set lmargin 10
set rmargin 10
plot "point_data.dat" using 5 w l linetype 3 title "Velocity"
set x2range [0:300]
set yrange [0:1000]
#unset mytics
set my2tics 10
unset xlabel
unset ytics
set y2tics 100
set mx2tics 10
set y2range [0:1000]
set key right

set style line 1 lc rgb "red" lw 3
set lmargin 10
set rmargin 10
plot "point_data.dat" using 6 w l linetype 4 title "Pressure"
unset multiplot
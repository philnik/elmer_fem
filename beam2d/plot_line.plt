
set terminal png
unset key
set output "image.png
set term png size 1000,1000
set grid
plot \
"images/d6-1000_500.dat" using 4:8 with lines,\
"images/d6-1000_900.dat" using 4:8 with lines,\
"images/d6-1000_1300.dat" using 4:8 with lines,\
"images/d6-1000_1700.dat" using 4:8 with lines,\
"images/d6-1000_2100.dat" using 4:8 with lines,\
"images/d6-1000_2500.dat" using 4:8 with lines,\
"images/d6-1000_2900.dat" using 4:8 with lines,\
"images/d6-1000_3300.dat" using 4:8 with lines,\
"images/d6-1000_3700.dat" using 4:8 with lines,\

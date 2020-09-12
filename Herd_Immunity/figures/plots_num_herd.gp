reset
set terminal pngcairo size 1600,800 
set output 'Numerical_herd.png'
set bmargin 6
set lmargin 15
set key at 45,0.75 
set key font "Helvetica,32" 
set key spacing 1.0
set title "" font "Helvetica,34"
set xrange [0:100] noreverse writeback
set xtics ( "0" 0, "20" 20, "40" 40, "60" 60, "80" 80, "100" 100) offset 0,-1  font "Helvetica,30"
set ytics ( "0" 0, "10" 0.1, "20" 0.2, "30" 0.3, "40" 0.4,"50" 0.5, "60" 0.6, "70" 0.7, "80" 0.8, "90" 0.9, "100" 1) offset 0,0  font "Helvetica,30"
set yrange [0.0:1.0] writeback
set xlabel "Time (in days)" offset 0,-2.0 font "Helvetica,38"
set ylabel "Population (in percent)" offset -7 font "Helvetica,38"
#set grid ytics lt 1 lw 1 lc rgb "#bbbbbb"
#set grid xtics lt 1 lw 1 lc rgb "#bbbbbb"
set encoding iso_8859_1
set arrow from 78, graph 0 to 78, graph 1 nohead lw 2 lc rgb "red" filled
set label "Ic = 28%" textcolor rgb "red" at 79 ,0.9 font "Helvetica,32"

set arrow from 60, graph 0 to 60, graph 1 nohead lw 2 lc rgb "blue" filled
set label "Ic = 12%" textcolor rgb "blue" at 61 ,0.9 font "Helvetica,32"

N= 6.7e7

set datafile separator "," 

plot     "France_nolock.data" every 2000          using  1:($2/N)       with linespoints  ps 3 pt 6 lw 4 lc 8 dt 1  title 'S (Susceptible) ' ,\
         "France_nolock.data"                     using  1:($5/N)      with lines                  lw 6 lc 8 dt 2  title 'R (Recovered) ' ,\
         "France_nolock.data"                     using  1:($4/N)      with lines                  lw 4 lc 8 dt 1  title 'I (Active infections) ' ,\
         "France_nolock.data" every 2000          using  1:($3+$4)/N       with linespoints  ps 3 pt 3 lw 4 lc 8 dt 1  title 'A+I  ' ,\
         

         
         
         
         
         



                                                                

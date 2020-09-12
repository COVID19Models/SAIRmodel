reset
#set terminal pngcairo size 1200,800 
set terminal postscript eps size 9,5 enhanced color
set output 'AbyI.eps'
set bmargin 8
set lmargin 17
set encoding iso_8859_1 
set key top right
#set key opaque
set key font "Helvetica,42" 
set key spacing 1.5
#set title "Armenia : {/Symbol g}^{-1} Estimation" font "Helvetica,32"
set xrange [0:120] noreverse writeback
set xtics ( "0" 0, "100" 100, "20" 20, "120" 120, "40" 40, "80" 80, "60" 60, "140" 140) offset 0,-1.5  font "Helvetica,34"
set ytics ( "0" 0, "10" 10, "20" 20, "30" 30,"40" 40) offset 0,-1.5  font "Helvetica,34"
set yrange [0:35] writeback
set xlabel "Time (in days)" offset 0,-3.5 font "Helvetica,42"
set ylabel "A/I" offset -6 font "Helvetica,42"


set datafile separator "," 




plot       "France_nolock.data"     every 2000     using  1:6       with linespoints   pt 6 ps 3    lw 6 lc 8 dt 1  title 'France' ,\
           "Italy_nolock.data"      every 2000     using  1:6       with linespoints   pt 8 ps 3    lw 6 lc 8 dt 1  title 'Italy' ,\
           "Japan_nolock.data"                   using  1:6       with lines                      lw 6 lc 8 dt 2  title 'Japan' ,\
           "Switzerland_nolock.data"             using  1:6       with lines                      lw 6 lc 8 dt 1  title 'Switzerland' ,\
           

           



                                                                

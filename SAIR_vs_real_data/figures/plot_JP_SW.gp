reset
#set terminal pngcairo size 1200,800 
set terminal postscript eps size 8,5 enhanced color
set output 'I_vs_time_JP_SW.eps'
set bmargin 8
set lmargin 17
set encoding iso_8859_1 
set key top left
#set key opaque
set key font "Helvetica,42" 
set key spacing 1.5
#set title "Armenia : {/Symbol g}^{-1} Estimation" font "Helvetica,32"
set xrange [0:100] noreverse writeback
set xtics ( "0" 0, "100" 100, "20" 20, "120" 120, "40" 40, "80" 80, "60" 60, "140" 140) offset 0,-1.5  font "Helvetica,30"
set ytics ( "5e3" 5000, "0" 0, "1e4" 10000,"1.5e4" 15000, "2e4" 20000) offset 0,-1.5  font "Helvetica,30"
set yrange [0:25000] writeback
set xlabel "Time (in days)" offset 0,-3.5 font "Helvetica,42"
set ylabel "I (Active infections)" offset -6 font "Helvetica,42"


set datafile separator "," 




plot       "I_run_av_7_JP.data"    every 3 using  1:2       with points pt 7 ps 3 lw 6 lc 8 dt 1  title 'Japan' ,\
           "I_run_av_7_SW.data"    every 3 using  ($1):2       with points pt 4 ps 3 lw 6 lc 8 dt 1  title 'Switzerland' ,\
           "Japan.data"                   using  1:4       with lines            lw 6 lc 8 dt 1  title 'Numerical solution' ,\
           "Switzerland.data"                    using  1:4       with lines            lw 6 lc 8 dt 1  title ''

           



                                                                

reset
#set terminal pngcairo size 1200,800 
set terminal postscript eps size 8,5 enhanced color
set output 'R1dot_vs_I_JP_SW.eps'
set bmargin 8
set lmargin 17
set encoding iso_8859_1 
set key top left
set key opaque
set key font "Helvetica,42" 
set key spacing 1.5
#set title "Armenia : {/Symbol g}^{-1} Estimation" font "Helvetica,32"
set xrange [0:500000] noreverse writeback
set ytics ( "0" 0, "2e4" 20000, "1e4" 10000, "3e4" 30000, "4e4" 40000) offset 0,-1  font "Helvetica,28"
set xtics ( "0" 0, "1e5" 100000, "2e5" 200000, "3e5" 300000, "4e5" 400000, "5e5" 500000, "6e6" 6000000,"7e6" 7000000) offset 0,-1  font "Helvetica,28"
set yrange [0:40000] writeback
set xlabel "{/Symbol \362} I dt" offset 0,-3.5 font "Helvetica,42"
set ylabel "R_I (Recovered from Infections)" offset -5 font "Helvetica,42"

set datafile separator "," 


gamma1 = 0.04
gamma2 = 0.04
gamma3 = 0.04
gamma4 = 0.04

c1 = 100
c2 = 100
c3 = 1
c4 = 1

h1(x) = gamma1* x + c1
h2(x) = gamma2* x + c2

fit h3(x) '< cat R1dot_I_run_av_7_int_fit1_JP.data'  using 2:1 via gamma3,c3
fit h4(x) '< cat R1dot_I_run_av_7_int_fit1_SW.data'  using 2:1 via gamma4,c4



plot      "R1dot_I_run_av_7_int_JP.data"        every 2          using  2:1       with points pt 9 ps 3 lw 4 lc 8 dt 1  title 'Japan: {/Symbol g} =  0.086' ,\
          "R1dot_I_run_av_7_int_SW.data"        every 2          using  2:1       with points pt 6 ps 3 lw 4 lc 8 dt 1  title 'Switzerland: {/Symbol g} =  0.028' ,\
          h3(x)                with lines lw 4 lc 8 dt 1 title "" ,\
          h4(x)                with lines lw 4 lc 8 dt 1 title ""



                                                                

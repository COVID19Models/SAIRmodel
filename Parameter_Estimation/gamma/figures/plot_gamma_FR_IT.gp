reset
#set terminal pngcairo size 1200,800 
set terminal postscript eps size 8,5 enhanced color
set output 'R1dot_vs_I_FR_IT.eps'
set bmargin 8
set lmargin 17
set encoding iso_8859_1 
set key at 4000000,200000
set key opaque
set key font "Helvetica,42" 
set key spacing 1.5
#set title "Armenia : {/Symbol g}^{-1} Estimation" font "Helvetica,32"
#set xrange [0:800] noreverse writeback
set ytics ( "0" 0, "5e4" 50000, "10e4" 100000, "15e4" 150000, "20e4" 200000) offset 0,-1  font "Helvetica,28"
set xtics ( "0" 0, "1e6" 1000000, "2e6" 2000000, "3e6" 3000000, "4e6" 4000000, "5e6" 5000000, "6e6" 6000000,"7e6" 7000000) offset 0,-1  font "Helvetica,28"
set yrange [0:200000] writeback
set xlabel "{/Symbol \362} I dt" offset 0,-3.5 font "Helvetica,42"
set ylabel "R_I (Recovered from Infections)" offset -6 font "Helvetica,42"

set datafile separator "," 


gamma1 = 0.04
gamma2 = 0.04
gamma3 = 0.04
gamma4 = 0.04

c1 = 100
c2 = 100
c3 = 100
c4 = 100

h1(x) = gamma1* x + c1
h2(x) = gamma2* x + c2
h3(x) = gamma3* x + c3
h4(x) = gamma4* x + c4

fit h1(x) '< cat R1dot_I_run_av_7_int_fit1_FR.data'  using 2:1 via gamma1,c1
fit h2(x) '< cat R1dot_I_run_av_7_int_fit1_IT.data'  using 2:1 via gamma2,c2




plot      "R1dot_I_run_av_7_int_FR.data"        every 3          using  2:1       with points pt 7 ps 3 lw 4 lc 8 dt 1  title 'France: {/Symbol g} =  0.020' ,\
          "R1dot_I_run_av_7_int_IT.data"        every 3          using  2:1       with points pt 4 ps 3 lw 4 lc 8 dt 1  title 'Italy: {/Symbol g} =  0.034' ,\
          h1(x)                with lines lw 4 lc 8 dt 1 title "" ,\
          h2(x)                with lines lw 4 lc 8 dt 1 title ""
          



                                                                

 reset
#set terminal pngcairo size 1200,800 
set terminal postscript eps size 9,5 enhanced color
set output 'I_vs_time_early.eps'
set bmargin 8
set lmargin 17
set encoding iso_8859_1 
set key at 155,149000
#set key opaque
set key font "Helvetica,38" 
set key spacing 1.5
#set title "Armenia : {/Symbol g}^{-1} Estimation" font "Helvetica,32"
set xrange [0:150] noreverse writeback
set xtics ( "0" 0, "100" 100, "20" 20, "120" 120, "40" 40, "80" 80, "60" 60, "140" 140) offset 0,-1.5  font "Helvetica,30"
set ytics ( "2e4" 20000, "4e4" 40000, "6e4" 60000,"8e4" 80000, "10e4" 100000, "12e4" 120000,"14e4" 140000) offset 0,-1.5  font "Helvetica,30"
set yrange [0:150000] writeback
set xlabel "Time (in days)" offset 0,-3.5 font "Helvetica,42"
set ylabel "I (Active infections)" offset -6 font "Helvetica,42"


set datafile separator "," 


gamma1 = 0.0313
gamma2 = 0.0313
gamma3 = 0.0313
gamma4 = 0.0313

alpha01  = 0.2
alpha02  = 0.2
alpha03  = 0.2
alpha04  = 0.2

a1 = 1
a2 = 1 
a3 = 1
a4 = 1

h1(x) = a1* exp((alpha01-gamma1)*x)
h2(x) = a2* exp((alpha02-gamma2)*x)
h3(x) = a3* exp((alpha03-gamma3)*x)
h4(x) = a4* exp((alpha04-gamma4)*x)

fit h1(x) '< cat I_run_av_7_fit1_FR.data'  using ($1):2 via a1,alpha01
fit h2(x) '< cat I_run_av_7_fit1_IT.data'  using ($1):2 via a2,alpha02
fit h3(x) '< cat I_run_av_7_fit1_JP.data'  using ($1):2 via a3,alpha03
fit h4(x) '< cat I_run_av_7_fit1_SW.data'  using ($1):2 via a4,alpha04

#set label "France        : {/Symbol a_0} = 0.274 \261 0.002  "             textcolor rgb "black" at 80 ,140000 font "Helvetica,32"
#set label "Italy             : {/Symbol a_0} = 0.274 \261 0.002    "       textcolor rgb "black" at 80 ,130000 font "Helvetica,32"
#set label "Spain          : {/Symbol a_0} = 0.274 \261 0.002    "          textcolor rgb "black" at 80 ,120000 font "Helvetica,32"
#set label "Switzerland : {/Symbol a_0} = 0.274 \261 0.002    "             textcolor rgb "black" at 80 ,110000 font "Helvetica,32"



plot       "I_run_av_7_FR.data"    every 3 using  1:2       with points pt 7 ps 3 lw 6 lc 8 dt 1  title 'France: {/Symbol a_0} = 0.240 ' ,\
           "I_run_av_7_IT.data"    every 3 using  1:2       with points pt 4 ps 3 lw 6 lc 8 dt 1  title 'Italy: {/Symbol a_0} = 0.271' ,\
           "I_run_av_7_JP.data"    every 3 using  1:2       with points pt 9 ps 3 lw 6 lc 8 dt 1  title 'Japan: {/Symbol a_0} = 0.137' ,\
           "I_run_av_7_SW.data"    every 3 using  1:2       with points pt 6 ps 3 lw 6 lc 8 dt 1  title 'Switzerland: {/Symbol a_0} = 0.283' ,\
           h1(x)                with lines lw 4 lc 8 dt 1 title "" ,\
           h2(x)                with lines lw 4 lc 8 dt 1 title "" ,\
           h3(x)                with lines lw 4 lc 8 dt 1 title "" ,\
           h4(x)                with lines lw 4 lc 8 dt 1 title ""



                                                                

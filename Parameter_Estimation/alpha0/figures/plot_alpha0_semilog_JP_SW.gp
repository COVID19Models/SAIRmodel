reset
#set terminal pngcairo size 1200,800 
set terminal postscript eps size 8,5 enhanced color
set output 'I_vs_time_early_JP_SW.eps'
set bmargin 8
set lmargin 17
set encoding iso_8859_1 
set key bottom right
#set key opaque
set key font "Helvetica,42" 
set key spacing 1.5
#set title "Armenia : {/Symbol g}^{-1} Estimation" font "Helvetica,32"
set xrange [0:100] noreverse writeback
set xtics ( "0" 0, "10" 10, "20" 20, "30" 30, "40" 40, "50" 50, "60" 60, "70" 70, "80" 80, "90" 90, "100" 100) offset 0,-1.5  font "Helvetica,30"
set ytics ( "1" 0, "10" 2.3, "10^2" 4.6, "10^3" 6.9, "10^4" 9.21, "10^5" 11.51, "10^6" 13.81) offset 0,-1.5  font "Helvetica,30"
set yrange [0:15] writeback
set xlabel "Time (in days)" offset 0,-3.5 font "Helvetica,42"
set ylabel "log ( I )" offset -6 font "Helvetica,42"


set datafile separator "," 


gamma1 = 0.017
gamma2 = 0.034
gamma3 = 0.086
gamma4 = 0.028

alpha01  = 0.2
alpha02  = 0.2
alpha03  = 0.2
alpha04  = 0.2

a1 = 1
a2 = 1 
a3 = 1
a4 = 1

#h1(x) = a1* exp((alpha01-gamma1)*x)
#h2(x) = a2* exp((alpha02-gamma2)*x)
#h3(x) = a3* exp((alpha03-gamma3)*x)
#h4(x) = a4* exp((alpha04-gamma4)*x)

#h1(x) = a1 + ((alpha01-gamma1)*x)
#h2(x) = a2 + ((alpha02-gamma2)*x)
h3(x) = a3 + ((alpha03-gamma3)*x)
h4(x) = a4 + ((alpha04-gamma4)*x)


#fit h1(x) '< cat I_run_av_7_fit1_FR.data'  using ($1):(log($2)) via a1,alpha01
#fit h2(x) '< cat I_run_av_7_fit1_IT.data'  using ($1):(log($2)) via a2,alpha02
fit h3(x) '< cat I_run_av_7_fit1_JP.data'  using ($1):(log($2)) via a3,alpha03
fit h4(x) '< cat I_run_av_7_fit1_SW.data'  using ($1):(log($2)) via a4,alpha04

#set label "France        : {/Symbol a_0} = 0.274 \261 0.002  "             textcolor rgb "black" at 80 ,140000 font "Helvetica,32"
#set label "Italy             : {/Symbol a_0} = 0.274 \261 0.002    "       textcolor rgb "black" at 80 ,130000 font "Helvetica,32"
#set label "Spain          : {/Symbol a_0} = 0.274 \261 0.002    "          textcolor rgb "black" at 80 ,120000 font "Helvetica,32"
#set label "Switzerland : {/Symbol a_0} = 0.274 \261 0.002    "             textcolor rgb "black" at 80 ,110000 font "Helvetica,32"



plot       "I_run_av_7_JP.data"    every 2 using  1:(log($2))       with points pt 9 ps 3 lw 6 lc 8 dt 1  title 'Japan: {/Symbol a_0} = 0.185' ,\
           "I_run_av_7_SW.data"    every 2 using  1:(log($2))       with points pt 6 ps 3 lw 6 lc 8 dt 1  title 'Switzerland: {/Symbol a_0} = 0.290' ,\
           h3(x)                with lines lw 4 lc 8 dt 1 title "" ,\
           h4(x)                with lines lw 4 lc 8 dt 1 title ""



                                                                

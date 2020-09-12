reset
#set terminal pngcairo size 1200,800 
set terminal postscript eps size 8,5 enhanced color
set output '7.eps'
set bmargin 8
set lmargin 21
set encoding iso_8859_1 
set key top right
#set key opaque
set key font "Helvetica,38" 
set key spacing 1.5
#set title "Armenia : {/Symbol g}^{-1} Estimation" font "Helvetica,32"
set xrange [0:140] noreverse writeback
set xtics ( "0" 0, "100" 100, "20" 20, "120" 120, "40" 40, "80" 80, "60" 60, "140" 140) offset 0,-1.5  font "Helvetica,30"
set ytics ( "1" 0, "10" 2.3, "10^2" 4.6, "10^3" 6.9, "10^4" 9.21, "10^5" 11.51, "10^6" 13.81) offset 0,-1.5  font "Helvetica,30"
set yrange [0:15] writeback
set xlabel "Time (in days)" offset 0,-3.5 font "Helvetica,42"
set ylabel " log( dI/dt + {/Symbol g}I )" offset -7 font "Helvetica,42"
#set grid ytics lt 1 lw 1 lc rgb "#bbbbbb"
#set grid xtics lt 1 lw 1 lc rgb "#bbbbbb"
set datafile separator "," 


gamma1 = 0.0247
gamma2 = 0.033
gamma3 = 0.033
#gamma4 = 0.0393
gamma4 = 0.055

delta1 = 0.01
delta2 = 0.01
delta3 = 0.01
delta4 = 0.01

a1 = 10
a2 = 10
a3 = 10
a4 = 10

#h1(x) = a1* exp(-(delta1+gamma1)*x)
#h2(x) = a2* exp(-(delta2+gamma2)*x)
#h3(x) = a3* exp(-(delta3+gamma3)*x)
#h4(x) = a4* exp(-(delta4+gamma4)*x)

h1(x) = a1 + (-(delta1+gamma1)*x)
h2(x) = a2 + (-(delta2+gamma2)*x)
h3(x) = a3 + (-(delta3+gamma3)*x)
h4(x) = a4 + (-(delta4+gamma4)*x)


fit h1(x) '< cat I_run_av_7_fit1_FR.data'  using ($1):(log($3+$2*gamma1)) via delta1,a1
fit h2(x) '< cat I_run_av_7_fit1_IT.data'  using ($1):(log($3+$2*gamma2)) via delta2,a2
fit h3(x) '< cat I_run_av_7_fit1_JP.data'  using ($1):(log($3+$2*gamma3)) via delta3,a3
fit h4(x) '< cat I_run_av_7_fit1_SW.data'  using ($1):(log($3+$2*gamma4)) via delta4,a4




plot       "I_run_av_7_FR.data"    every 2         using  1:(log($3+$2*gamma1))       with points pt 7 ps 3 lw 4 lc 8 dt 1  title 'France: {/Symbol d} =  0.01' ,\
           "I_run_av_7_IT.data"    every 3         using  1:(log($3+$2*gamma2))       with points pt 4 ps 3 lw 4 lc 8 dt 1  title 'Italy: {/Symbol d} =  0.09' ,\
           "I_run_av_7_JP.data"    every 4         using  1:(log($3+$2*gamma3))       with points pt 9 ps 3 lw 4 lc 8 dt 1  title 'Japan: {/Symbol d} =  0.02' ,\
           "I_run_av_7_SW.data"    every 4         using  1:(log($3+$2*gamma4))       with points pt 6 ps 3 lw 4 lc 8 dt 1  title 'Switzerland: {/Symbol d} =  0.07' ,\
           h1(x)                with lines lw 4 lc 8 dt 1 title "" ,\
           h2(x)                with lines lw 4 lc 8 dt 1 title "" ,\
           h3(x)                with lines lw 4 lc 8 dt 1 title "" ,\
           h4(x)                with lines lw 4 lc 8 dt 1 title ""



                                                                

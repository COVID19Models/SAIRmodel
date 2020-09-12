/*********************************************************************************************
 *   Copyright (c) <2020>, <Santosh Ansumali@JNCASR>                                         *
 *   All rights reserved.                                                                    *
 *   Redistribution and use in source and binary forms, with or without modification, are    *
 *   permitted provided that the following conditions are met:                               *
 *                                                                                           *
 *    1. Redistributions of source code must retain the above copyright notice, this list of *
 *       conditions and the following disclaimer.                                            *
 *    2. Redistributions in binary form must reproduce the above copyright notice, this list *
 *       of conditions and the following disclaimer in the documentation and/or other        *
 *       materials provided with the distribution.                                           *
 *    3. Neither the name of the <JNCASR> nor the names of its contributors may be used to   *
 *       endorse or promote products derived from this software without specific prior       *
 *       written permission.                                                                 *
 *                                                                                           *
 *       THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND     *
 *       ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED       *
 *       WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  *
 *       IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,    *
 *       INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,      *
 *       BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,       *
 *       DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF     *
 *       LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE     *
 *       OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED   *
 *       OF THE POSSIBILITY OF SUCH DAMAGE.                                                  *
 *                                                                                           *
 *       Suggestions:          ansumali@jncasr.ac.in                                         *
 *       Bugs:                 ansumali@jncasr.ac.in                                         *
 *                                                                                           *
 *********************************************************************************************/


/*********************************************************************************************

 *  @Author: shaurya@jncasr.ac.in*

 *********************************************************************************************/

#include<iostream>
#include<fstream>
#include<stdio.h> 
#include<string> 
#include<cstdlib>
#include<cmath>
#include<iomanip>
#include <stdlib.h>
#include<math.h>
#include<time.h>
#include<algorithm>

void euler(double t0, double t_lock, double t_migration, double S0, double A0, double I0, double R0, double dt, double t, double alpha0,  double gamma, double delta, double beta1,  double r0, double N)
{
    
    double S = S0;
    double I = I0;
    double A = A0;
    double R = R0;
    
    double AplusI = A0+I0;

    
    std::ofstream file;
    char fileName[150];
    sprintf(fileName,"Switzerland_nolock.data");
    file.open(fileName);
        

	for(int i= 0; i<(t/dt);i++)
	{
        double time = i*dt;
        
        //PRE Lock -----------------------------------------
        
                
		S = S + dt* ( -S*alpha0* (1.0 - S + (1.0/r0)*log(S/S0)) ) ;
        
        AplusI = 1.0 - S + (1.0/r0)*log(S/S0);
        
        I = I + dt* (  delta*AplusI - (gamma+delta)*I  ) ;
        R = R + dt* (  gamma * AplusI                  ) ;
        A     = AplusI - I      ;
        
        
        file   << time<<","<<N*S<<","<<N*A<<","<<N*I<<","<<N*R<<","<<A/I ;
        file<<std::endl;

	}
	    file.close();


}




int main ()
{
	double t0 = 0, dt = 0.001, t = 120, t_lock = 30, t_migration = 37;
    double  I0   = 1e-6;                // 1 in a million infection
    double  A0   = I0;             
    double  S0   = (1.0 - (A0+I0));
	double  R0   = 0.0;
    double  N    = 0.9e7;
    
    double alpha0 = 0.29;
    double gamma  = 0.045;
    double delta  = 0.07;
    double beta1  = 0.15;
    
    double r0     = alpha0/gamma;
    
euler (t0, t_lock, t_migration, S0, A0, I0, R0, dt, t, alpha0, gamma, delta, beta1, r0, N); 

return 0;
}

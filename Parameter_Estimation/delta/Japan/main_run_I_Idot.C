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

int main(){

    
    std::ifstream file1("I.data");
    
    int t0int = 0;
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    int val(0), rows(0), cols(0), numItems(0);
    while( file1.peek() != '\n' && file1 >> val )
    {
        std::cout << val << ' ';
        ++numItems;
    }
    cols = numItems;// # of columns found
   
    std::cout << '\n';
    while( file1 >> val )
    {
        ++numItems;
        std::cout << val << ' ';
        if( numItems%cols == 0 ) std::cout << '\n';
    }
   
    if( numItems > 0 )// got data!
    {
        rows = numItems/cols;
        std::cout << "rows = " << rows << ", cols = " << cols << '\n';
    }
    else// didn't get any data
        std::cout << "data reading failed\n";

    int num_days = rows;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////

    
    
    
    
    std::ifstream file ("Idot.data");
    std::ifstream file3("I.data");
    if(file.is_open() && file3.is_open())
    {
        double  cases[num_days];
        double  reco[num_days];

        for(int i = 0; i < num_days; ++i)
        {
             file >> reco[i];
             file3>> cases[i];
        
        }
        
        
        
    
    
        
int p  = 7;      //running average days
int np = num_days-(p-1); 

int cases_run[np];
int reco_run[np];
int total_cases[num_days];
int total_reco[num_days];

for(int j=0; j<np; j++){
cases_run[j]   = 0.0;
reco_run[j]    = 0.0;
total_cases[j] = 0.0;
total_reco[j]  = 0.0;
}





for(int j=0; j<np;j++){
for(int i=j+p-1; i>=j; i--){
    cases_run[j] =  cases_run[j] + cases[i] ;
    reco_run[j]  =   reco_run[j] + reco[i]  ;  
    
} }

total_cases[0]  = cases_run[0] ;
total_reco[0]   = reco_run[0]  ;

for(int j=1; j<np; j++){
    if(j>=t0int){
total_cases[j]  = total_cases[j-1]  + cases_run[j] ; 
total_reco[j]   = total_reco[j-1]   +  reco_run[j] ;
    }
}
   
   

//Printing

 //*****************************************************************************************************************************  
  /*
   *  std::ofstream file2;
    char fileName1[150];
    sprintf(fileName1,"R1dot_I_run_av_%d_int.data",p);
    file2.open(fileName1);
    
      for (int j=t0int;j<np;j++){
          
        
           //file2 <<reco_run[j]/p<<","<<cases_run[j]/p;
           file2 <<total_reco[j]/p<<","<<total_cases[j]/p;
           file2 << std::endl;
        }
        
    file2.close();
    
  */  
     //*****************************************************************************************************************************  
    std::ofstream file4;
    char fileName4[150];
    sprintf(fileName4,"I_run_av_%d.data",p);
    file4.open(fileName4);
    
      for (int j=t0int;j<np;j++){
          
        
           file4 <<j<<","<<cases_run[j]/p<<","<<reco_run[j]/p;
          // file4 <<total_reco[j]/p<<","<<total_cases[j]/p;
           file4 << std::endl;
           
        }
        
    file4.close();
 
    

    }    
   
}



   


   
 





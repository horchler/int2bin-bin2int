int2bin - bin2int
========
#####Convert integer datatype to a binary string and back in Matlab.#####
######Version 1.0, 4-10-16######
#####Download Repository: [ZIP Archive](https://github.com/horchler/int2bin/archive/master.zip)#####

--------

[```int2bin(X)```](https://github.com/horchler/int2bin/blob/master/int2bin.m) returns the binary representation of ```X``` as a string. ```X``` must be an integer datatype and non-negative. Unlike Matlab's ```dec2bin```, ```int2bin``` supports ```int64``` and ```uint64``` values of ```X``` greater than ```2^52```.  
  
[```bin2int(S)```](https://github.com/horchler/bin2int/blob/master/bin2int.m) returns the integer value represented by the binary string ```S```. The class of the output is the minimum unsigned integer class that supports the number of bits in the binary string. Unlike Matlab's ```bin2dec```, ```bin2int``` supports binary strings with up to 64 bits.
&nbsp;  

--------

Andrew D. Horchler, *adh9 @ case . edu*, [biorobots.case.edu](http://biorobots.case.edu/)  
Created: 1-21-16, Revision: 1.0, 4-10-16  

This version tested with Matlab 9.0.0.341360 (R2016a)  
Mac OS X 10.11.4 (Build: 15E65), Java 1.7.0_75-b13  
Compatibility maintained back through Matlab 8.5 (R2015a)  
&nbsp;  

--------

Copyright &copy; 2016, Andrew D. Horchler  
All rights reserved.  

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of Case Western Reserve University nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ANDREW D. HORCHLER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#
# kv calculated on Soerensen et al., 2010 -..
#
# ScCO2 = 0.11 Tc^2 -6.16 Tc + 644.7 
# ScHg0 = v/D    Schmidt number for Hg(0)
# v = N/p(rho) = 0.017*e^0.025*T   kinematic viscosity (cm2 s-1)
# N = Viscosity of water (cP - centipoise)   1 P= 1Pa*s , 
# log(N)= (1301/(998.333+8.1855(Tc-20) + 0.00585(Tc-20)^2))- 3.30233
# Rho = density
# D = diffusivivty  (7.4*10^8*(saf*Mw)^1/2*Tk)/N*Vb^0.6
#---set parameters
Sal<-18
Tc<-15
Tk<-Tc+273.15

saf<-2.26  # Solvent association factor introduced to define the effective molecular 
Mw <-18    # g/mol molecular weight of water
Vb<-12.74  # (cm3 mol-1) Molal volume of mercury at its normal boiling

A<-0.25  # (unitless) Constant based on the 
          # Weibull distribution of wind speeds over oceans
u<-5   #m/s

ScCO2 <- 0.11*(Tc^2)-(6.16*Tc) + 644.7 

D <- (7.4*10^-8*((saf*Mw)^1/2)*Tk)/(N*(Vb^0.6) )   #cm2/s
D

#----------- calc density(T, sal) ------
A<-0.824493 - 0.0040899*Tc + 0.000076438*Tc^2 -
  0.00000082467*Tc^3 + 0.0000000053675*Tc^4
B<--0.005724 + 0.00010227*Tc - 0.0000016546*Tc^2 
Rho<- 1000*(1-(Tc+288.9414)/(508929.2*(Tc+68.12963))*(Tc-3.9863)^2) # density T rr
Rho2<- Rho + A*Sal + B*Sal^(3/2) + 0.00048314*Sal^2 # density T and sal corrected

#----------- calc viscosity (T, sal) ------
library(marelac) # Function viscosity calculates the shear 
                  # viscosity of water, in centipoise
 N<-viscosity(S = 18, t = Tc, P = 1)    #formula is valid for 0 < t < 30 and 0 < S < 36

 v<-N/Rho2
 ScHg0 <- v/D 
 
 m<-(ScHg0/ScCO2)^-.5  # [m/hr-1]
  A*(u^2)*m






setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/out_1anno")

Pmehg<-read.csv("Total_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Pmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

Pmehg_pM<-Pmehg/200.59*1000; 

OL_v<-c(5.9*10^12,(5.9*10^12),(4.5*10^12),(5.9*10^12))
SOL_v<-7.4*10^12
AOL_v<-c(5.3*10^13,5.3*10^13,2.9*10^14,10^14)
t_vol<-sum(OL_v)+sum(SOL_v)+sum(AOL_v); t_vol
OL_v_l<-OL_v*10^3
SOL_v_l<-SOL_v*10^3
AOL_v_l<-AOL_v*10^3

str(Pmehg_pM)

Pmehg_pM[2,1]   #riga, colonna

O1_vol_L<-5.9*10^15
## OL1    Pmehg_pM[2,2]-Pmehg_pM[2,3]
f2012<-Pmehg_pM[163,2]-Pmehg_pM[162,2]
f2013<-Pmehg_pM[164,2]-Pmehg_pM[163,2]
f2014<-Pmehg_pM[165,2]-Pmehg_pM[164,2]
f2015<-Pmehg_pM[166,2]-Pmehg_pM[165,2]
f2016<-Pmehg_pM[167,5]-Pmehg_pM[166,5]
f2017<-Pmehg_pM[168,5]-Pmehg_pM[167,5]
f2018<-Pmehg_pM[169,5]-Pmehg_pM[168,5]
f2019<-Pmehg_pM[170,5]-Pmehg_pM[169,5]

anno=c(2012,2013,2014,2015,2016, 2017, 2018, 2019)
varPmehgO1<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgO1_moly<-(varPmehgO1*O1_vol_L)/10^12
plot(anno,varPmehgO1_moly)

## OL2    Pmehg_pM[2,2]-Pmehg_pM[2,3]
f2012<-Pmehg_pM[163,3]-Pmehg_pM[162,3]
f2013<-Pmehg_pM[164,3]-Pmehg_pM[163,3]
f2014<-Pmehg_pM[165,3]-Pmehg_pM[164,3]
f2015<-Pmehg_pM[166,3]-Pmehg_pM[165,3]
f2016<-Pmehg_pM[167,5]-Pmehg_pM[166,5]
f2017<-Pmehg_pM[168,5]-Pmehg_pM[167,5]
f2018<-Pmehg_pM[169,5]-Pmehg_pM[168,5]
f2019<-Pmehg_pM[170,5]-Pmehg_pM[169,5]

varPmehgO2<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgO2_moly<-(varPmehgO2*O1_vol_L)/10^12

O3_vol_L<-4.5E+15
## OL3    Pmehg_pM[2,2]-Pmehg_pM[2,4]
f2012<-Pmehg_pM[163,4]-Pmehg_pM[162,4]
f2013<-Pmehg_pM[164,4]-Pmehg_pM[163,4]
f2014<-Pmehg_pM[165,4]-Pmehg_pM[164,4]
f2015<-Pmehg_pM[166,4]-Pmehg_pM[165,4]
f2016<-Pmehg_pM[167,5]-Pmehg_pM[166,5]
f2017<-Pmehg_pM[168,5]-Pmehg_pM[167,5]
f2018<-Pmehg_pM[169,5]-Pmehg_pM[168,5]
f2019<-Pmehg_pM[170,5]-Pmehg_pM[169,5]

varPmehgO3<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgO3_moly<-(varPmehgO3*O3_vol_L)/10^12


O4_vol_L<-5.9E+15
## OL4    Pmehg_pM[2,2]-Pmehg_pM[2,4]
f2012<-Pmehg_pM[163,5]-Pmehg_pM[162,5]
f2013<-Pmehg_pM[164,5]-Pmehg_pM[163,5]
f2014<-Pmehg_pM[165,5]-Pmehg_pM[164,5]
f2015<-Pmehg_pM[166,5]-Pmehg_pM[165,5]
f2016<-Pmehg_pM[167,5]-Pmehg_pM[166,5]
f2017<-Pmehg_pM[168,5]-Pmehg_pM[167,5]
f2018<-Pmehg_pM[169,5]-Pmehg_pM[168,5]
f2019<-Pmehg_pM[170,5]-Pmehg_pM[169,5]

varPmehgO4<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgO4_moly<-(varPmehgO4*O4_vol_L)/10^12

SO_vol_L<-7.4E+15
## OL4    Pmehg_pM[2,2]-Pmehg_pM[2,4]
f2012<-Pmehg_pM[163,6]-Pmehg_pM[162,6]
f2013<-Pmehg_pM[164,6]-Pmehg_pM[163,6]
f2014<-Pmehg_pM[165,6]-Pmehg_pM[164,6]
f2015<-Pmehg_pM[166,6]-Pmehg_pM[165,6]
f2016<-Pmehg_pM[167,6]-Pmehg_pM[166,6]
f2017<-Pmehg_pM[168,6]-Pmehg_pM[167,6]
f2018<-Pmehg_pM[169,6]-Pmehg_pM[168,6]
f2019<-Pmehg_pM[170,6]-Pmehg_pM[169,6]

varPmehgSO<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgSO_moly<-(varPmehgSO*SO_vol_L)/10^12
plot(anno,varPmehgSO_moly)

SO_vol_L<-7.4E+15
## OL4    Pmehg_pM[2,2]-Pmehg_pM[2,4]
f2012<-Pmehg_pM[163,6]-Pmehg_pM[162,6]
f2013<-Pmehg_pM[164,6]-Pmehg_pM[163,6]
f2014<-Pmehg_pM[165,6]-Pmehg_pM[164,6]
f2015<-Pmehg_pM[166,6]-Pmehg_pM[165,6]
f2016<-Pmehg_pM[167,6]-Pmehg_pM[166,6]
f2017<-Pmehg_pM[168,6]-Pmehg_pM[167,6]
f2018<-Pmehg_pM[169,6]-Pmehg_pM[168,6]
f2019<-Pmehg_pM[170,6]-Pmehg_pM[169,6]

varPmehgSO<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgSO_moly<-(varPmehgSO*SO_vol_L)/10^12
plot(anno,varPmehgSO_moly)

A1_vol_L<-5.3E+13*10^3
## AOL1    Pmehg_pM[2,2]-Pmehg_pM[2,4]
f2012<-Pmehg_pM[163,7]-Pmehg_pM[162,7]
f2013<-Pmehg_pM[164,7]-Pmehg_pM[163,7]
f2014<-Pmehg_pM[165,7]-Pmehg_pM[164,7]
f2015<-Pmehg_pM[166,7]-Pmehg_pM[165,7]
f2016<-Pmehg_pM[167,7]-Pmehg_pM[166,7]
f2017<-Pmehg_pM[168,7]-Pmehg_pM[167,7]
f2018<-Pmehg_pM[169,7]-Pmehg_pM[168,7]
f2019<-Pmehg_pM[170,7]-Pmehg_pM[169,7]

varPmehgA1<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgA1_moly<-(varPmehgA1*A1_vol_L)/10^12
plot(anno,varPmehgA1_moly)

## AOL1    Pmehg_pM[2,2]-Pmehg_pM[2,4]
f2012<-Pmehg_pM[163,8]-Pmehg_pM[162,8]
f2013<-Pmehg_pM[164,8]-Pmehg_pM[163,8]
f2014<-Pmehg_pM[165,8]-Pmehg_pM[164,8]
f2015<-Pmehg_pM[166,8]-Pmehg_pM[165,8]
f2016<-Pmehg_pM[167,8]-Pmehg_pM[166,8]
f2017<-Pmehg_pM[168,8]-Pmehg_pM[167,8]
f2018<-Pmehg_pM[169,8]-Pmehg_pM[168,8]
f2019<-Pmehg_pM[170,8]-Pmehg_pM[169,8]

varPmehgA2<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgA2_moly<-(varPmehgA2*A1_vol_L)/10^12

A3_vol_L<-2.9E+14*10^3
## AOL3    Pmehg_pM[2,2]-Pmehg_pM[2,4]
f2012<-Pmehg_pM[163,9]-Pmehg_pM[162,9]
f2013<-Pmehg_pM[164,9]-Pmehg_pM[163,9]
f2014<-Pmehg_pM[165,9]-Pmehg_pM[164,9]
f2015<-Pmehg_pM[166,9]-Pmehg_pM[165,9]
f2016<-Pmehg_pM[167,9]-Pmehg_pM[166,9]
f2017<-Pmehg_pM[168,9]-Pmehg_pM[167,9]
f2018<-Pmehg_pM[169,9]-Pmehg_pM[168,9]
f2019<-Pmehg_pM[170,9]-Pmehg_pM[169,9]

varPmehgA3<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgA3_moly<-(varPmehgA3*A3_vol_L)/10^12

A4_vol_L<-1E+14*10^3
## AOL4    Pmehg_pM[2,2]-Pmehg_pM[2,4]
f2012<-Pmehg_pM[163,10]-Pmehg_pM[162,10]
f2013<-Pmehg_pM[164,10]-Pmehg_pM[163,10]
f2014<-Pmehg_pM[165,10]-Pmehg_pM[164,10]
f2015<-Pmehg_pM[166,10]-Pmehg_pM[165,10]
f2016<-Pmehg_pM[167,10]-Pmehg_pM[166,10]
f2017<-Pmehg_pM[168,10]-Pmehg_pM[167,10]
f2018<-Pmehg_pM[169,10]-Pmehg_pM[168,10]
f2019<-Pmehg_pM[170,10]-Pmehg_pM[169,10]

varPmehgA4<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
varPmehgA4_moly<-(varPmehgA4*A4_vol_L)/10^12



par(mfrow=c(3,1), cex.axis=1.4, cex.lab=1.4, 
    mar=c(2,4,0,0))
plot(anno,varPmehgO1_moly, ylim=c(0,.80),ylab='mol/y', col='cadetblue1',
     lwd=3,type='b')
par(new=T)
plot(anno,varPmehgO2_moly, ylim=c(0,.80),ylab='mol/y', col='cadetblue3',
     lwd=3, type='b')
par(new=T)
plot(anno,varPmehgO3_moly, ylim=c(0,.80),ylab='mol/y', col='cadetblue4',
     lwd=3,type='b', pch=20)
par(new=T)
plot(anno,varPmehgO4_moly, ylim=c(0,.80),ylab='mol/y', col='aquamarine4',
     lwd=3, type='b')

plot(anno,varPmehgSO_moly, ylim=c(0,.3), ylab='mol/y',col='chartreuse4',
     lwd=3, type='b')

plot(anno,varPmehgA1_moly, ylim=c(0,20), ylab='mol/y', col='coral',
     lwd=3,type='b')
par(new=T)
plot(anno,varPmehgA2_moly, ylim=c(0,20), ylab='mol/y', col='coral3',
     lwd=3, type='b')
par(new=T)
plot(anno,varPmehgA3_moly, ylim=c(0,20), ylab='mol/y', col='brown3',
     lwd=3,type='b')
par(new=T)
plot(anno,varPmehgA4_moly, ylim=c(0,20), ylab='mol/y', col='brown4',
     lwd=3, type='b')




setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/out_1anno")
setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin

Phgs<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phgs)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

Phg_pM<-Phgs/200.59*1000; 

OL_v<-c(5.9*10^12,(5.9*10^12),(4.5*10^12),(5.9*10^12))
SOL_v<-7.4*10^12
AOL_v<-c(5.3*10^13,5.3*10^13,2.9*10^14,10^14)
t_vol<-sum(OL_v)+sum(SOL_v)+sum(AOL_v); t_vol
OL_v_l<-OL_v*10^3
SOL_v_l<-SOL_v*10^3
AOL_v_l<-AOL_v*10^3

str(Phg_pM)

Phg_pM[2,1]   #riga, colonna

O1_vol_L<-5.9*10^15
## OL1    Phg_pM[2,2]-Phg_pM[2,3]
O1_f2012<-Phg_pM[163,2]-Phg_pM[162,2]
O1_f2013<-Phg_pM[164,2]-Phg_pM[163,2]
O1_f2014<-Phg_pM[165,2]-Phg_pM[164,2]
O1_f2015<-Phg_pM[166,2]-Phg_pM[165,2]
O1_f2016<-Phg_pM[167,5]-Phg_pM[166,5]
O1_f2017<-Phg_pM[168,5]-Phg_pM[167,5]
O1_f2018<-Phg_pM[169,5]-Phg_pM[168,5]
O1_f2019<-Phg_pM[170,5]-Phg_pM[169,5]

anno=c(2012,2013,2014,2015,2016, 2017, 2018, 2019)
varPhgO1<-c(O1_f2012,O1_f2013,O1_f2014,O1_f2015,O1_f2016,O1_f2017,O1_f2018,O1_f2019)
varPhgO1_moly<-(varPhgO1*O1_vol_L)/10^12
plot(anno,varPhgO1_moly)

## OL2    Phg_pM[2,2]-Phg_pM[2,3]
O2_f2012<-Phg_pM[163,3]-Phg_pM[162,3]
O2_f2013<-Phg_pM[164,3]-Phg_pM[163,3]
O2_f2014<-Phg_pM[165,3]-Phg_pM[164,3]
O2_f2015<-Phg_pM[166,3]-Phg_pM[165,3]
O2_f2016<-Phg_pM[167,5]-Phg_pM[166,5]
O2_f2017<-Phg_pM[168,5]-Phg_pM[167,5]
O2_f2018<-Phg_pM[169,5]-Phg_pM[168,5]
O2_f2019<-Phg_pM[170,5]-Phg_pM[169,5]

varPhgO2<-c(O2_f2012,O2_f2013,O2_f2014,O2_f2015,O2_f2016,O2_f2017,O2_f2018,O2_f2019)
varPhgO2_moly<-(varPhgO2*O1_vol_L)/10^12

O3_vol_L<-4.5E+15
## OL3    Phg_pM[2,2]-Phg_pM[2,4]
O3_f2012<-Phg_pM[163,4]-Phg_pM[162,4]
O3_f2013<-Phg_pM[164,4]-Phg_pM[163,4]
O3_f2014<-Phg_pM[165,4]-Phg_pM[164,4]
O3_f2015<-Phg_pM[166,4]-Phg_pM[165,4]
O3_f2016<-Phg_pM[167,5]-Phg_pM[166,5]
O3_f2017<-Phg_pM[168,5]-Phg_pM[167,5]
O3_f2018<-Phg_pM[169,5]-Phg_pM[168,5]
O3_f2019<-Phg_pM[170,5]-Phg_pM[169,5]

varPhgO3<-c(O3_f2012,O3_f2013,O3_f2014,O3_f2015,O3_f2016,O3_f2017,O3_f2018,O3_f2019)
varPhgO3_moly<-(varPhgO3*O3_vol_L)/10^12


O4_vol_L<-5.9E+15
## OL4    Phg_pM[2,2]-Phg_pM[2,4]
O4_f2012<-Phg_pM[163,5]-Phg_pM[162,5]
O4_f2013<-Phg_pM[164,5]-Phg_pM[163,5]
O4_f2014<-Phg_pM[165,5]-Phg_pM[164,5]
O4_f2015<-Phg_pM[166,5]-Phg_pM[165,5]
O4_f2016<-Phg_pM[167,5]-Phg_pM[166,5]
O4_f2017<-Phg_pM[168,5]-Phg_pM[167,5]
O4_f2018<-Phg_pM[169,5]-Phg_pM[168,5]
O4_f2019<-Phg_pM[170,5]-Phg_pM[169,5]

varPhgO4<-c(O4_f2012,O4_f2013,O4_f2014,O4_f2015,O4_f2016,O4_f2017,O4_f2018,O4_f2019)
varPhgO4_moly<-(varPhgO4*O4_vol_L)/10^12

SO_vol_L<-7.4E+15
## SOL4    Phg_pM[2,2]-Phg_pM[2,4]
S_f2012<-Phg_pM[163,6]-Phg_pM[162,6]
S_f2013<-Phg_pM[164,6]-Phg_pM[163,6]
S_f2014<-Phg_pM[165,6]-Phg_pM[164,6]
S_f2015<-Phg_pM[166,6]-Phg_pM[165,6]
S_f2016<-Phg_pM[167,6]-Phg_pM[166,6]
S_f2017<-Phg_pM[168,6]-Phg_pM[167,6]
S_f2018<-Phg_pM[169,6]-Phg_pM[168,6]
S_f2019<-Phg_pM[170,6]-Phg_pM[169,6]

varPhgSO<-c(S_f2012,S_f2013,S_f2014,S_f2015,S_f2016,S_f2017,S_f2018,S_f2019)
varPhgSO_moly<-(varPhgSO*SO_vol_L)/10^12
plot(anno,varPhgSO_moly)

A1_vol_L<-5.3E+13*10^3
## AOL1    Phg_pM[2,2]-Phg_pM[2,4]
A1_f2012<-Phg_pM[163,7]-Phg_pM[162,7]
A1_f2013<-Phg_pM[164,7]-Phg_pM[163,7]
A1_f2014<-Phg_pM[165,7]-Phg_pM[164,7]
A1_f2015<-Phg_pM[166,7]-Phg_pM[165,7]
A1_f2016<-Phg_pM[167,7]-Phg_pM[166,7]
A1_f2017<-Phg_pM[168,7]-Phg_pM[167,7]
A1_f2018<-Phg_pM[169,7]-Phg_pM[168,7]
A1_f2019<-Phg_pM[170,7]-Phg_pM[169,7]

varPhgA1<-c(A1_f2012,A1_f2013,A1_f2014,A1_f2015,A1_f2016,A1_f2017,A1_f2018,A1_f2019)
varPhgA1_moly<-(varPhgA1*A1_vol_L)/10^12
plot(anno,varPhgA1_moly)

## AOL1    Phg_pM[2,2]-Phg_pM[2,4]
A2_f2012<-Phg_pM[163,8]-Phg_pM[162,8]
A2_f2013<-Phg_pM[164,8]-Phg_pM[163,8]
A2_f2014<-Phg_pM[165,8]-Phg_pM[164,8]
A2_f2015<-Phg_pM[166,8]-Phg_pM[165,8]
A2_f2016<-Phg_pM[167,8]-Phg_pM[166,8]
A2_f2017<-Phg_pM[168,8]-Phg_pM[167,8]
A2_f2018<-Phg_pM[169,8]-Phg_pM[168,8]
A2_f2019<-Phg_pM[170,8]-Phg_pM[169,8]

varPhgA2<-c(A2_f2012,A2_f2013,A2_f2014,A2_f2015,A2_f2016,A2_f2017,A2_f2018,A2_f2019)
varPhgA2_moly<-(varPhgA2*A1_vol_L)/10^12

A3_vol_L<-2.9E+14*10^3
## AOL3    Phg_pM[2,2]-Phg_pM[2,4]
A3_f2012<-Phg_pM[163,9]-Phg_pM[162,9]
A3_f2013<-Phg_pM[164,9]-Phg_pM[163,9]
A3_f2014<-Phg_pM[165,9]-Phg_pM[164,9]
A3_f2015<-Phg_pM[166,9]-Phg_pM[165,9]
A3_f2016<-Phg_pM[167,9]-Phg_pM[166,9]
A3_f2017<-Phg_pM[168,9]-Phg_pM[167,9]
A3_f2018<-Phg_pM[169,9]-Phg_pM[168,9]
A3_f2019<-Phg_pM[170,9]-Phg_pM[169,9]

varPhgA3<-c(A3_f2012,A3_f2013,A3_f2014,A3_f2015,A3_f2016,A3_f2017,A3_f2018,A3_f2019)
varPhgA3_moly<-(varPhgA3*A3_vol_L)/10^12

A4_vol_L<-1E+14*10^3
## AOL4    Phg_pM[2,2]-Phg_pM[2,4]
A4_f2012<-Phg_pM[163,10]-Phg_pM[162,10]
A4_f2013<-Phg_pM[164,10]-Phg_pM[163,10]
A4_f2014<-Phg_pM[165,10]-Phg_pM[164,10]
A4_f2015<-Phg_pM[166,10]-Phg_pM[165,10]
A4_f2016<-Phg_pM[167,10]-Phg_pM[166,10]
A4_f2017<-Phg_pM[168,10]-Phg_pM[167,10]
A4_f2018<-Phg_pM[169,10]-Phg_pM[168,10]
A4_f2019<-Phg_pM[170,10]-Phg_pM[169,10]

varPhgA4<-c(A4_f2012,A4_f2013,A4_f2014,A4_f2015,A4_f2016,A4_f2017,A4_f2018,A4_f2019)
varPhgA4_moly<-(varPhgA4*A4_vol_L)/10^12


OL_var_kmoly = (varPhgO1_moly + varPhgO2_moly + 
         varPhgO3_moly + varPhgO4_moly)/1000

SOL_var_kmoly = varPhgSO_moly/1000

AOL_var_kmoly = (varPhgA1_moly + varPhgA2_moly + 
                  varPhgA3_moly + varPhgA4_moly)/1000


var_Phg2013<-c(OL_var_kmoly[2],SOL_var_kmoly[2],AOL_var_kmoly[2])

write.csv(var_Phg2013, file='var_Phg2013.csv')

par(mfrow=c(3,1), cex.axis=1.4, cex.lab=1.4, 
    mar=c(2,4,0,0))
plot(anno,varPhgO1_moly, ylim=c(0,20),ylab='mol/y', col='cadetblue1',
     lwd=3,type='b')
par(new=T)
plot(anno,varPhgO2_moly, ylim=c(0,20),ylab='mol/y', col='cadetblue3',
     lwd=3, type='b')
par(new=T)
plot(anno,varPhgO3_moly, ylim=c(0,20),ylab='mol/y', col='cadetblue4',
     lwd=3,type='b')
par(new=T)
plot(anno,varPhgO4_moly, ylim=c(0,20),ylab='mol/y', col='aquamarine4',
     lwd=3, type='b')

plot(anno,varPhgSO_moly, ylim=c(0,5), ylab='mol/y',col='chartreuse4',
     lwd=3, type='b')

plot(anno,varPhgA1_moly, ylim=c(0,80), ylab='mol/y', col='coral',
     lwd=3,type='b')
par(new=T)
plot(anno,varPhgA2_moly, ylim=c(0,80), ylab='mol/y', col='coral3',
     lwd=3, type='b')
par(new=T)
plot(anno,varPhgA3_moly, ylim=c(0,80), ylab='mol/y', col='brown3',
     lwd=3,type='b')
par(new=T)
plot(anno,varPhgA4_moly, ylim=c(0,80), ylab='mol/y', col='brown4',
     lwd=3, type='b')




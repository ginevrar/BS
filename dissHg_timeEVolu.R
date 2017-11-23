
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/out_1anno")

hg<-read.csv("Dissolved_Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2");

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); 

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip =1, sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2") 

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")


diss_hgII<-hg+DOChg
diss_mehg<-DOCmehg+mehg
diss_hg_inor<-diss_hgII+hg0
diss_tot<-diss_mehg+diss_hg_inor
diss_tot_pM<-diss_tot/200.59*1000

diss_hgII_pM<-diss_hgII/200.59*1000



OL_v<-c(5.9*10^12,(5.9*10^12),(4.5*10^12),(5.9*10^12))
SOL_v<-7.4*10^12
AOL_v<-c(5.3*10^13,5.3*10^13,2.9*10^14,10^14)
t_vol<-sum(OL_v)+sum(SOL_v)+sum(AOL_v); t_vol
OL_v_l<-OL_v*10^3
SOL_v_l<-SOL_v*10^3
AOL_v_l<-AOL_v*10^3





O1_vol_L<-5.9*10^15
## OL1    diss_tot_pM[2,2]-diss_tot_pM[2,3]
f2012<-diss_hgII_pM[163,2]-diss_hgII_pM[162,2]
f2013<-diss_hgII_pM[164,2]-diss_hgII_pM[163,2]
f2014<-diss_hgII_pM[165,2]-diss_hgII_pM[164,2]
f2015<-diss_hgII_pM[166,2]-diss_hgII_pM[165,2]
f2016<-diss_hgII_pM[167,5]-diss_hgII_pM[166,5]
f2017<-diss_hgII_pM[168,5]-diss_hgII_pM[167,5]
f2018<-diss_hgII_pM[169,5]-diss_hgII_pM[168,5]
f2019<-diss_hgII_pM[170,5]-diss_hgII_pM[169,5]

anno=c(2012,2013,2014,2015,2016, 2017, 2018, 2019)
vardissO1<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissO1_moly<-(vardissO1*O1_vol_L)/10^12
plot(anno,vardissO1_moly)

## OL2    diss_hgII_pM[2,2]-diss_hgII_pM[2,3]
f2012<-diss_hgII_pM[163,3]-diss_hgII_pM[162,3]
f2013<-diss_hgII_pM[164,3]-diss_hgII_pM[163,3]
f2014<-diss_hgII_pM[165,3]-diss_hgII_pM[164,3]
f2015<-diss_hgII_pM[166,3]-diss_hgII_pM[165,3]
f2016<-diss_hgII_pM[167,5]-diss_hgII_pM[166,5]
f2017<-diss_hgII_pM[168,5]-diss_hgII_pM[167,5]
f2018<-diss_hgII_pM[169,5]-diss_hgII_pM[168,5]
f2019<-diss_hgII_pM[170,5]-diss_hgII_pM[169,5]

vardissO2<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissO2_moly<-(vardissO2*O1_vol_L)/10^12

O3_vol_L<-4.5E+15
## OL3    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
f2012<-diss_hgII_pM[163,4]-diss_hgII_pM[162,4]
f2013<-diss_hgII_pM[164,4]-diss_hgII_pM[163,4]
f2014<-diss_hgII_pM[165,4]-diss_hgII_pM[164,4]
f2015<-diss_hgII_pM[166,4]-diss_hgII_pM[165,4]
f2016<-diss_hgII_pM[167,5]-diss_hgII_pM[166,5]
f2017<-diss_hgII_pM[168,5]-diss_hgII_pM[167,5]
f2018<-diss_hgII_pM[169,5]-diss_hgII_pM[168,5]
f2019<-diss_hgII_pM[170,5]-diss_hgII_pM[169,5]

vardissO3<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissO3_moly<-(vardissO3*O3_vol_L)/10^12


O4_vol_L<-5.9E+15
## OL4    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
f2012<-diss_hgII_pM[163,5]-diss_hgII_pM[162,5]
f2013<-diss_hgII_pM[164,5]-diss_hgII_pM[163,5]
f2014<-diss_hgII_pM[165,5]-diss_hgII_pM[164,5]
f2015<-diss_hgII_pM[166,5]-diss_hgII_pM[165,5]
f2016<-diss_hgII_pM[167,5]-diss_hgII_pM[166,5]
f2017<-diss_hgII_pM[168,5]-diss_hgII_pM[167,5]
f2018<-diss_hgII_pM[169,5]-diss_hgII_pM[168,5]
f2019<-diss_hgII_pM[170,5]-diss_hgII_pM[169,5]

vardissO4<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissO4_moly<-(vardissO4*O4_vol_L)/10^12

SO_vol_L<-7.4E+15
## OL4    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
f2012<-diss_hgII_pM[163,6]-diss_hgII_pM[162,6]
f2013<-diss_hgII_pM[164,6]-diss_hgII_pM[163,6]
f2014<-diss_hgII_pM[165,6]-diss_hgII_pM[164,6]
f2015<-diss_hgII_pM[166,6]-diss_hgII_pM[165,6]
f2016<-diss_hgII_pM[167,6]-diss_hgII_pM[166,6]
f2017<-diss_hgII_pM[168,6]-diss_hgII_pM[167,6]
f2018<-diss_hgII_pM[169,6]-diss_hgII_pM[168,6]
f2019<-diss_hgII_pM[170,6]-diss_hgII_pM[169,6]

vardissSO<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissSO_moly<-(vardissSO*SO_vol_L)/10^12
plot(anno,vardissSO_moly)

SO_vol_L<-7.4E+15
## OL4    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
f2012<-diss_hgII_pM[163,6]-diss_hgII_pM[162,6]
f2013<-diss_hgII_pM[164,6]-diss_hgII_pM[163,6]
f2014<-diss_hgII_pM[165,6]-diss_hgII_pM[164,6]
f2015<-diss_hgII_pM[166,6]-diss_hgII_pM[165,6]
f2016<-diss_hgII_pM[167,6]-diss_hgII_pM[166,6]
f2017<-diss_hgII_pM[168,6]-diss_hgII_pM[167,6]
f2018<-diss_hgII_pM[169,6]-diss_hgII_pM[168,6]
f2019<-diss_hgII_pM[170,6]-diss_hgII_pM[169,6]

vardissSO<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissSO_moly<-(vardissSO*SO_vol_L)/10^12
plot(anno,vardissSO_moly)

A1_vol_L<-5.3E+13*10^3
## AOL1    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
f2012<-diss_hgII_pM[163,7]-diss_hgII_pM[162,7]
f2013<-diss_hgII_pM[164,7]-diss_hgII_pM[163,7]
f2014<-diss_hgII_pM[165,7]-diss_hgII_pM[164,7]
f2015<-diss_hgII_pM[166,7]-diss_hgII_pM[165,7]
f2016<-diss_hgII_pM[167,7]-diss_hgII_pM[166,7]
f2017<-diss_hgII_pM[168,7]-diss_hgII_pM[167,7]
f2018<-diss_hgII_pM[169,7]-diss_hgII_pM[168,7]
f2019<-diss_hgII_pM[170,7]-diss_hgII_pM[169,7]

vardissA1<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissA1_moly<-(vardissA1*A1_vol_L)/10^12
plot(anno,vardissA1_moly)

## AOL1    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
f2012<-diss_hgII_pM[163,8]-diss_hgII_pM[162,8]
f2013<-diss_hgII_pM[164,8]-diss_hgII_pM[163,8]
f2014<-diss_hgII_pM[165,8]-diss_hgII_pM[164,8]
f2015<-diss_hgII_pM[166,8]-diss_hgII_pM[165,8]
f2016<-diss_hgII_pM[167,8]-diss_hgII_pM[166,8]
f2017<-diss_hgII_pM[168,8]-diss_hgII_pM[167,8]
f2018<-diss_hgII_pM[169,8]-diss_hgII_pM[168,8]
f2019<-diss_hgII_pM[170,8]-diss_hgII_pM[169,8]

vardissA2<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissA2_moly<-(vardissA2*A1_vol_L)/10^12

A3_vol_L<-2.9E+14*10^3
## AOL3    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
f2012<-diss_hgII_pM[163,9]-diss_hgII_pM[162,9]
f2013<-diss_hgII_pM[164,9]-diss_hgII_pM[163,9]
f2014<-diss_hgII_pM[165,9]-diss_hgII_pM[164,9]
f2015<-diss_hgII_pM[166,9]-diss_hgII_pM[165,9]
f2016<-diss_hgII_pM[167,9]-diss_hgII_pM[166,9]
f2017<-diss_hgII_pM[168,9]-diss_hgII_pM[167,9]
f2018<-diss_hgII_pM[169,9]-diss_hgII_pM[168,9]
f2019<-diss_hgII_pM[170,9]-diss_hgII_pM[169,9]

vardissA3<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissA3_moly<-(vardissA3*A3_vol_L)/10^12

A4_vol_L<-1E+14*10^3
## AOL4    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
f2012<-diss_hgII_pM[163,10]-diss_hgII_pM[162,10]
f2013<-diss_hgII_pM[164,10]-diss_hgII_pM[163,10]
f2014<-diss_hgII_pM[165,10]-diss_hgII_pM[164,10]
f2015<-diss_hgII_pM[166,10]-diss_hgII_pM[165,10]
f2016<-diss_hgII_pM[167,10]-diss_hgII_pM[166,10]
f2017<-diss_hgII_pM[168,10]-diss_hgII_pM[167,10]
f2018<-diss_hgII_pM[169,10]-diss_hgII_pM[168,10]
f2019<-diss_hgII_pM[170,10]-diss_hgII_pM[169,10]

vardissA4<-c(f2012,f2013,f2014,f2015,f2016,f2017,f2018,f2019)
vardissA4_moly<-(vardissA4*A4_vol_L)/10^12



par(mfrow=c(3,1), cex.axis=1.4, cex.lab=1.4, 
    mar=c(2,4,0,0))
plot(anno,vardissO1_moly, ylim=c(0,120),ylab='mol/y', col='cadetblue1',
     lwd=3,type='b')
par(new=T)
plot(anno,vardissO2_moly, ylim=c(0,120),ylab='mol/y', col='cadetblue3',
     lwd=3, type='b')
par(new=T)
plot(anno,vardissO3_moly, ylim=c(0,120),ylab='mol/y', col='cadetblue4',
     lwd=3,type='b')
par(new=T)
plot(anno,vardissO4_moly, ylim=c(0,120),ylab='mol/y', col='aquamarine4',
     lwd=3, type='b')

plot(anno,vardissSO_moly, ylim=c(0,40), ylab='mol/y',col='chartreuse4',
     lwd=3, type='b')

plot(anno,vardissA1_moly, ylim=c(0,2000), ylab='mol/y', col='coral',
     lwd=3,type='b')
par(new=T)
plot(anno,vardissA2_moly, ylim=c(0,2000), ylab='mol/y', col='coral3',
     lwd=3, type='b')
par(new=T)
plot(anno,vardissA3_moly, ylim=c(0,2000), ylab='mol/y', col='brown3',
     lwd=3,type='b')
par(new=T)
plot(anno,vardissA4_moly, ylim=c(0,2000), ylab='mol/y', col='brown4',
     lwd=3, type='b')

  
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
  ## OL1    diss_hgII_pM[2,2]-diss_hgII_pM[2,3]
  O1_f2012<-diss_hgII_pM[163,2]-diss_hgII_pM[162,2]
  O1_f2013<-diss_hgII_pM[164,2]-diss_hgII_pM[163,2]
  O1_f2014<-diss_hgII_pM[165,2]-diss_hgII_pM[164,2]
  O1_f2015<-diss_hgII_pM[166,2]-diss_hgII_pM[165,2]
  O1_f2016<-diss_hgII_pM[167,5]-diss_hgII_pM[166,5]
  O1_f2017<-diss_hgII_pM[168,5]-diss_hgII_pM[167,5]
  O1_f2018<-diss_hgII_pM[169,5]-diss_hgII_pM[168,5]
  O1_f2019<-diss_hgII_pM[170,5]-diss_hgII_pM[169,5]
  
  anno=c(2012,2013,2014,2015,2016, 2017, 2018, 2019)
  vardisshgIIO1<-c(O1_f2012,O1_f2013,O1_f2014,O1_f2015,O1_f2016,O1_f2017,O1_f2018,O1_f2019)
  vardisshgIIO1_moly<-(vardisshgIIO1*O1_vol_L)/10^12
  plot(anno,vardisshgIIO1_moly)
  
  ## OL2    diss_hgII_pM[2,2]-diss_hgII_pM[2,3]
  O2_f2012<-diss_hgII_pM[163,3]-diss_hgII_pM[162,3]
  O2_f2013<-diss_hgII_pM[164,3]-diss_hgII_pM[163,3]
  O2_f2014<-diss_hgII_pM[165,3]-diss_hgII_pM[164,3]
  O2_f2015<-diss_hgII_pM[166,3]-diss_hgII_pM[165,3]
  O2_f2016<-diss_hgII_pM[167,5]-diss_hgII_pM[166,5]
  O2_f2017<-diss_hgII_pM[168,5]-diss_hgII_pM[167,5]
  O2_f2018<-diss_hgII_pM[169,5]-diss_hgII_pM[168,5]
  O2_f2019<-diss_hgII_pM[170,5]-diss_hgII_pM[169,5]
  
  vardisshgIIO2<-c(O2_f2012,O2_f2013,O2_f2014,O2_f2015,O2_f2016,O2_f2017,O2_f2018,O2_f2019)
  vardisshgIIO2_moly<-(vardisshgIIO2*O1_vol_L)/10^12
  
  O3_vol_L<-4.5E+15
  ## OL3    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
  O3_f2012<-diss_hgII_pM[163,4]-diss_hgII_pM[162,4]
  O3_f2013<-diss_hgII_pM[164,4]-diss_hgII_pM[163,4]
  O3_f2014<-diss_hgII_pM[165,4]-diss_hgII_pM[164,4]
  O3_f2015<-diss_hgII_pM[166,4]-diss_hgII_pM[165,4]
  O3_f2016<-diss_hgII_pM[167,5]-diss_hgII_pM[166,5]
  O3_f2017<-diss_hgII_pM[168,5]-diss_hgII_pM[167,5]
  O3_f2018<-diss_hgII_pM[169,5]-diss_hgII_pM[168,5]
  O3_f2019<-diss_hgII_pM[170,5]-diss_hgII_pM[169,5]
  
  vardisshgIIO3<-c(O3_f2012,O3_f2013,O3_f2014,O3_f2015,O3_f2016,O3_f2017,O3_f2018,O3_f2019)
  vardisshgIIO3_moly<-(vardisshgIIO3*O3_vol_L)/10^12
  
  
  O4_vol_L<-5.9E+15
  ## OL4    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
  O4_f2012<-diss_hgII_pM[163,5]-diss_hgII_pM[162,5]
  O4_f2013<-diss_hgII_pM[164,5]-diss_hgII_pM[163,5]
  O4_f2014<-diss_hgII_pM[165,5]-diss_hgII_pM[164,5]
  O4_f2015<-diss_hgII_pM[166,5]-diss_hgII_pM[165,5]
  O4_f2016<-diss_hgII_pM[167,5]-diss_hgII_pM[166,5]
  O4_f2017<-diss_hgII_pM[168,5]-diss_hgII_pM[167,5]
  O4_f2018<-diss_hgII_pM[169,5]-diss_hgII_pM[168,5]
  O4_f2019<-diss_hgII_pM[170,5]-diss_hgII_pM[169,5]
  
  vardisshgIIO4<-c(O4_f2012,O4_f2013,O4_f2014,O4_f2015,O4_f2016,O4_f2017,O4_f2018,O4_f2019)
  vardisshgIIO4_moly<-(vardisshgIIO4*O4_vol_L)/10^12
  
  SO_vol_L<-7.4E+15
  ## SOL4    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
  S_f2012<-diss_hgII_pM[163,6]-diss_hgII_pM[162,6]
  S_f2013<-diss_hgII_pM[164,6]-diss_hgII_pM[163,6]
  S_f2014<-diss_hgII_pM[165,6]-diss_hgII_pM[164,6]
  S_f2015<-diss_hgII_pM[166,6]-diss_hgII_pM[165,6]
  S_f2016<-diss_hgII_pM[167,6]-diss_hgII_pM[166,6]
  S_f2017<-diss_hgII_pM[168,6]-diss_hgII_pM[167,6]
  S_f2018<-diss_hgII_pM[169,6]-diss_hgII_pM[168,6]
  S_f2019<-diss_hgII_pM[170,6]-diss_hgII_pM[169,6]
  
  vardisshgsO<-c(S_f2012,S_f2013,S_f2014,S_f2015,S_f2016,S_f2017,S_f2018,S_f2019)
  vardisshgsO_moly<-(vardisshgsO*SO_vol_L)/10^12
  plot(anno,vardisshgsO_moly)
  
  A1_vol_L<-5.3E+13*10^3
  ## AOL1    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
  A1_f2012<-diss_hgII_pM[163,7]-diss_hgII_pM[162,7]
  A1_f2013<-diss_hgII_pM[164,7]-diss_hgII_pM[163,7]
  A1_f2014<-diss_hgII_pM[165,7]-diss_hgII_pM[164,7]
  A1_f2015<-diss_hgII_pM[166,7]-diss_hgII_pM[165,7]
  A1_f2016<-diss_hgII_pM[167,7]-diss_hgII_pM[166,7]
  A1_f2017<-diss_hgII_pM[168,7]-diss_hgII_pM[167,7]
  A1_f2018<-diss_hgII_pM[169,7]-diss_hgII_pM[168,7]
  A1_f2019<-diss_hgII_pM[170,7]-diss_hgII_pM[169,7]
  
  vardisshgIIA1<-c(A1_f2012,A1_f2013,A1_f2014,A1_f2015,A1_f2016,A1_f2017,A1_f2018,A1_f2019)
  vardisshgIIA1_moly<-(vardisshgIIA1*A1_vol_L)/10^12
  plot(anno,vardisshgIIA1_moly)
  
  ## AOL1    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
  A2_f2012<-diss_hgII_pM[163,8]-diss_hgII_pM[162,8]
  A2_f2013<-diss_hgII_pM[164,8]-diss_hgII_pM[163,8]
  A2_f2014<-diss_hgII_pM[165,8]-diss_hgII_pM[164,8]
  A2_f2015<-diss_hgII_pM[166,8]-diss_hgII_pM[165,8]
  A2_f2016<-diss_hgII_pM[167,8]-diss_hgII_pM[166,8]
  A2_f2017<-diss_hgII_pM[168,8]-diss_hgII_pM[167,8]
  A2_f2018<-diss_hgII_pM[169,8]-diss_hgII_pM[168,8]
  A2_f2019<-diss_hgII_pM[170,8]-diss_hgII_pM[169,8]
  
  vardisshgIIA2<-c(A2_f2012,A2_f2013,A2_f2014,A2_f2015,A2_f2016,A2_f2017,A2_f2018,A2_f2019)
  vardisshgIIA2_moly<-(vardisshgIIA2*A1_vol_L)/10^12
  
  A3_vol_L<-2.9E+14*10^3
  ## AOL3    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
  A3_f2012<-diss_hgII_pM[163,9]-diss_hgII_pM[162,9]
  A3_f2013<-diss_hgII_pM[164,9]-diss_hgII_pM[163,9]
  A3_f2014<-diss_hgII_pM[165,9]-diss_hgII_pM[164,9]
  A3_f2015<-diss_hgII_pM[166,9]-diss_hgII_pM[165,9]
  A3_f2016<-diss_hgII_pM[167,9]-diss_hgII_pM[166,9]
  A3_f2017<-diss_hgII_pM[168,9]-diss_hgII_pM[167,9]
  A3_f2018<-diss_hgII_pM[169,9]-diss_hgII_pM[168,9]
  A3_f2019<-diss_hgII_pM[170,9]-diss_hgII_pM[169,9]
  
  vardisshgIIA3<-c(A3_f2012,A3_f2013,A3_f2014,A3_f2015,A3_f2016,A3_f2017,A3_f2018,A3_f2019)
  vardisshgIIA3_moly<-(vardisshgIIA3*A3_vol_L)/10^12
  
  A4_vol_L<-1E+14*10^3
  ## AOL4    diss_hgII_pM[2,2]-diss_hgII_pM[2,4]
  A4_f2012<-diss_hgII_pM[163,10]-diss_hgII_pM[162,10]
  A4_f2013<-diss_hgII_pM[164,10]-diss_hgII_pM[163,10]
  A4_f2014<-diss_hgII_pM[165,10]-diss_hgII_pM[164,10]
  A4_f2015<-diss_hgII_pM[166,10]-diss_hgII_pM[165,10]
  A4_f2016<-diss_hgII_pM[167,10]-diss_hgII_pM[166,10]
  A4_f2017<-diss_hgII_pM[168,10]-diss_hgII_pM[167,10]
  A4_f2018<-diss_hgII_pM[169,10]-diss_hgII_pM[168,10]
  A4_f2019<-diss_hgII_pM[170,10]-diss_hgII_pM[169,10]
  
  vardisshgIIA4<-c(A4_f2012,A4_f2013,A4_f2014,A4_f2015,A4_f2016,A4_f2017,A4_f2018,A4_f2019)
  vardisshgIIA4_moly<-(vardisshgIIA4*A4_vol_L)/10^12
  
  
  OL_var_kmoly = (vardisshgIIO1_moly + vardisshgIIO2_moly + 
                    vardisshgIIO3_moly + vardisshgIIO4_moly)/1000
  
  SOL_var_kmoly = vardisshgsO_moly/1000
  
  AOL_var_kmoly = (vardisshgIIA1_moly + vardisshgIIA2_moly + 
                     vardisshgIIA3_moly + vardisshgIIA4_moly)/1000
  
  var_disshgII_2013<-c(OL_var_kmoly[2],SOL_var_kmoly[2],AOL_var_kmoly[2])
    write.csv(var_disshgII_2013, file='var_disshgII_kmoly2013.csv')


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

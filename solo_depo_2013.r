setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/prova")
#   /Anne1e_morehg_tris_pristine2")
#Leggi dati e taglia gli ultimi anni dopo il 2013 hg<-hg[2:1969,]
hg<-read.csv("Dissolved_Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg<-hg[59536:59900,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hgT<-hgT[59536:59900,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip =1, sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOChg<-DOChg[59536:59900,1:13]

Phgs<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phgs)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); Phgs<-Phgs[59536:59900,1:13]
## Phg ngL

SEDhg<-read.csv("Total_Sorbed_Divalent_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(SEDhg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); SEDhg<-SEDhg[59536:59900,1:13]
## Sedhg ngg

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); mehg<-mehg[59536:59900,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOCmehg<-DOCmehg[59536:59900,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); mehgT<-mehgT[59536:59900,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg0<-hg0[59536:59900,1:13]

solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); solids<-solids[59536:59900,1:13]
tail(solids)

diss_hgII<-hg+DOChg
diss_mehg<-DOCmehg+mehg
diss_hgtot<-diss_mehg+diss_hgII+hg0
diss_hg_inor<-diss_hgII+hg0
diss_hg_inor$Oxic1

O1<-(mean(diss_hgtot$Oxic1)); O2<-(mean(diss_hgtot$Oxic2))
O3<-(mean(diss_hgtot$CIL)); O4<-(mean(diss_hgtot$Oxycline))
S<-(mean(diss_hgtot$Suboxic1)); A1<-(mean(diss_hgtot$Suboxic2))
A2<-(mean(diss_hgtot$Anoxic)); A3<-(mean(diss_hgtot$Anoxic2))
A4<-(mean(diss_hgtot$Anoxic3))

O1_hgT<-(mean(hgT$Oxic1));    O2_hgT<-(mean(hgT$Oxic2))
O3_hgT<-(mean(hgT$CIL));      O4_hgT<-(mean(hgT$Oxycline))
S_hgT<-(mean(hgT$Suboxic1));  A1_hgT<-(mean(hgT$Suboxic2))
A2_hgT<-(mean(hgT$Anoxic));   A3_hgT<-(mean(hgT$Anoxic2))
A4_hgT<-(mean(hgT$Anoxic3))

O1_mehg<-(mean(mehg$Oxic1));   O2_mehg<-(mean(mehg$Oxic2))
O3_mehg<-(mean(mehg$CIL));     O4_mehg<-(mean(mehg$Oxycline))
S_mehg<-(mean(mehg$Suboxic1)); A1_mehg<-(mean(mehg$Suboxic2))
A2_mehg<-(mean(mehg$Anoxic));  A3_mehg<-(mean(mehg$Anoxic2))
A4_mehg<-(mean(mehg$Anoxic3))

O1_mehgT<-(mean(mehgT$Oxic1));   O2_mehgT<-(mean(mehgT$Oxic2))
O3_mehgT<-(mean(mehgT$CIL));     O4_mehgT<-(mean(mehgT$Oxycline))
S_mehgT<-(mean(mehgT$Suboxic1)); A1_mehgT<-(mean(mehgT$Suboxic2))
A2_mehgT<-(mean(mehgT$Anoxic));  A3_mehgT<-(mean(mehgT$Anoxic2))
A4_mehgT<-(mean(mehgT$Anoxic3))

O1_Phgs<-(mean(Phgs$Oxic1));   O2_Phgs<-(mean(Phgs$Oxic2))
O3_Phgs<-(mean(Phgs$CIL));     O4_Phgs<-(mean(Phgs$Oxycline))
S_Phgs<-(mean(Phgs$Suboxic1)); A1_Phgs<-(mean(Phgs$Suboxic2))
A2_Phgs<-(mean(Phgs$Anoxic));  A3_Phgs<-(mean(Phgs$Anoxic2))
A4_Phgs<-(mean(Phgs$Anoxic3))

diss<-c(O1,O2,O3,O4,S,A1,A2,A3,A4)
hgT<-c(O1_hgT,O2_hgT,O3_hgT,O4_hgT,S_hgT,A1_hgT,A2_hgT,A3_hgT,A4_hgT)
diss_mehg<-c(O1_mehg,O2_mehg,O3_mehg,O4_mehg,S_mehg,A1_mehg,A2_mehg,A3_mehg,A4_mehg)
mehgT<-c(O1_mehgT,O2_mehgT,O3_mehgT,O4_mehgT,S_mehgT,A1_mehgT,A2_mehgT,A3_mehgT,A4_mehgT)
Phg<-c(O1_Phgs,O2_Phgs,O3_Phgs,O4_Phgs,S_Phgs,A1_Phgs,A2_Phgs,A3_Phgs,A4_Phgs)

uu<-Phg+diss

prof<-c(11.4525,13.3275,14.715,15.41,15.92,16.41,16.83,17.14,17.25)

plot(diss,prof, col='cyan3',type='b', ylim=c(17.5,11.5), xlim=c(0,0.8))
par(new=T)
plot(hgT,prof, col=1,type='b', ylim=c(17.5,11.5), xlim=c(0,0.8))
par(new=T)
plot(mehgT,prof, col=2,type='b', ylim=c(17.5,11.5), xlim=c(0,0.8))
par(new=T)
plot(diss_mehg,prof, col='cyan4',type='b', ylim=c(17.5,11.5), xlim=c(0,0.8))
par(new=T)
plot(Phg,prof, col='brown', 
     type='b', ylim=c(17.5,11.5), xlim=c(0,0.8))
par(new=T)
plot(uu,prof, col='gray60', 
      ylim=c(17.5,11.5), xlim=c(0,0.8))




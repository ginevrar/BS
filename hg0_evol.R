
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e_morehg_tris")

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

hg0_pM<-hg0/200.59*1000; str(hg0_pM)

vol<-read.csv('volat_kmoly_2050.csv', skip = 1,header=FALSE, sep = ",", dec="."); 
plot(vol$V1)

OL_v<-c(5.9*10^12,(5.9*10^12),(4.5*10^12),(5.9*10^12))
SOL_v<-7.4*10^12
AOL_v<-c(5.3*10^13,5.3*10^13,2.9*10^14,10^14)
t_vol<-sum(OL_v)+sum(SOL_v)+sum(AOL_v); t_vol
OL_v_l<-OL_v*10^3
SOL_v_l<-SOL_v*10^3
AOL_v_l<-AOL_v*10^3

OL_hg0_pM<-hg0_pM[2:5];SOL_hg0_pM<-hg0_pM[6]; AOL_hg0_pM<-hg0_pM[7:10]

OL_hg0_kmol<-(OL_hg0_pM*OL_v_l)/10^15; tail(OL_hg0_kmol)
SOL_hg0_kmol<-(SOL_hg0_pM*SOL_v_l)/10^15; tail(SOL_hg0_kmol)
AOL_hg0_kmol<-(AOL_hg0_pM*AOL_v_l)/10^15; tail(AOL_hg0_kmol)





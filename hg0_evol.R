setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine")
setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

hg0_pM<-hg0/200.59*1000; str(hg0_pM)

vol<-read.csv('volat_media_e_cum_2050.csv', skip = 1,header=FALSE, sep = ",", dec="."); 
str(vol)
names(vol)<-c('anno','vol_kmoly','vol_cum')

OL_v<-c(5.9*10^12,(5.9*10^12),(4.5*10^12),(5.9*10^12))
SOL_v<-7.4*10^12
AOL_v<-c(5.3*10^13,5.3*10^13,2.9*10^14,10^14)
t_vol<-sum(OL_v)+sum(SOL_v)+sum(AOL_v); t_vol
OL_v_l<-OL_v*10^3
SOL_v_l<-SOL_v*10^3
AOL_v_l<-AOL_v*10^3

OL_hg0_pM<-hg0_pM[2:5];SOL_hg0_pM<-hg0_pM[6]; AOL_hg0_pM<-hg0_pM[7:10]

OL_hg0_kmol<-rowSums(OL_hg0_pM*OL_v_l)/10^15; tail(OL_hg0_kmol)
SOL_hg0_kmol<-rowSums(SOL_hg0_pM*SOL_v_l)/10^15; tail(SOL_hg0_kmol)
AOL_hg0_kmol<-rowSums(AOL_hg0_pM*AOL_v_l)/10^15; tail(AOL_hg0_kmol)

OL_hg0_kmol_media<-tapply(OL_hg0_kmol[2:2413],rep(1:(length(OL_hg0_kmol[2:2413])/12),each = 12), mean)
str(OL_hg0_kmol)
SOL_hg0_kmol_media<-tapply(SOL_hg0_kmol[2:2413],rep(1:(length(SOL_hg0_kmol[2:2413])/12),each = 12), mean)
AOL_hg0_kmol_media<-tapply(AOL_hg0_kmol[2:2413],rep(1:(length(AOL_hg0_kmol[2:2413])/12),each = 12), mean)
str(AOL_hg0_kmol)

Hg0_time_kmol<-data.frame(OL_hg0_kmol_media,SOL_hg0_kmol_media,AOL_hg0_kmol_media, vol$vol_kmoly)

write.table(Hg0_time_kmol,'hg0time.txt')

Hg0_time_kmol[164,]-Hg0_time_kmol[163]

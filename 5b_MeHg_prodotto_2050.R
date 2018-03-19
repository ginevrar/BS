## Produzione INTERNA MeHg

#REAZIONI VANNO MOLTIPLICATE PER TOTALE E NON PER FASE DISCiOLTA (!!)
#setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")

setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2")
setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin

TOTs<-read.csv('Total_solids.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(TOTs)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2");
TOTs<-TOTs[3:2414,1:13]

bulkD<-read.csv('Sediment_Bulk_Density.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(bulkD)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2");
bulkD<-bulkD[3:2414,1:13]
met<-read.csv('Bacterial_Methylation_Rate.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(met)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2");
met<-met[3:2414,1:13]
demet<-read.csv('Bacterial_Demethylation_Rate.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(demet)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2");
demet<-demet[3:2414,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); 
mehg<-mehg[3:2414,1:13]
DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); DOCmehg<-
  DOCmehg<- DOCmehg[3:2414,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); 
hg0<-hg0[3:2414,1:13]			  

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip =1, sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); DOChg<-DOChg[3:2414,1:13]

hg<-read.csv("Dissolved_Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); hg<-hg[3:2414,1:13]

hgT<-read.csv("Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); hgT<-hgT[3:2414,1:13]

mehgT<-read.csv("Methyl_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); mehgT<-mehgT[3:2414,1:13]

OL1_vol_m3 <-5.9E+12; 			OL1_vol_L  <-OL1_vol_m3*1000
CIL_vol_m3 <-4.5E+12; 			CIL_vol_L  <-CIL_vol_m3*1000
oxy_vol_m3 <-5.9E+12; 			oxy_vol_L  <-oxy_vol_m3*1000
SOL_vol_m3 <-7.4E+12; 			SOL_vol_L  <-SOL_vol_m3*1000
UAL1_vol_m3 <-5.3E+13; 			UAL1_vol_L  <-UAL1_vol_m3*1000
DAOL_vol_m3 <-2.9E+14; 			DAOL_vol_L  <-DAOL_vol_m3*1000
BBL_vol_m3 <-1E+14; 			BBL_vol_L  <-BBL_vol_m3*1000
Sed1_vol<-8.8*10^9
Sed2_vol<-2*10^10
diss_mehg<-DOCmehg+mehg; str(diss_mehg)
diss_hgII<-hg+DOChg; str(diss_hgII)

diss_mehg_pM<-(diss_mehg/215)*1000
diss_hgII_pM<-(diss_hgII/200.59)*1000

mehgT_pM <-(mehgT/215)*1000
hgT_pM   <-(hgT/200.59)*1000
hg0_pM   <-(hg0/200.59)*1000
# ------ end
# ....... sediment and porew
dryD1<-TOTs$Sed1;Porosity<-(bulkD$Sed1)-(dryD1/10^6) #g/m3/g/m3 water
PW_vol_sed1<-Sed1_vol*Porosity ;PW_vol_sed1_L<-PW_vol_sed1*1000

dryD2<-TOTs$Sed2; Porosity2<-(bulkD$Sed2)-(dryD2/10^6) #g/m3/g/m3 water
PW_vol_sed2<-Sed2_vol*Porosity2 #m3
PW_vol_sed2_L<-PW_vol_sed2*1000

#--------------------conc hgT = conc HgII
hgT_pmol_OL1		  <-hgT_pM$Oxic1   *OL1_vol_L
hgT_pmol_OL2		  <-hgT_pM$Oxic2   *OL1_vol_L
hgT_pmol_CIL		  <-hgT_pM$CIL     *CIL_vol_L
hgT_pmol_oxy		  <-hgT_pM$Oxycline*oxy_vol_L

hgT_pmol_SOL		  <-hgT_pM$Suboxic1*SOL_vol_L

hgT_pmol_UAL1	 	  <-hgT_pM$Suboxic2*UAL1_vol_L
hgT_pmol_UAL2	      <-hgT_pM$Anoxic1 *UAL1_vol_L
hgT_pmol_DAOL         <-hgT_pM$Anoxic2 *DAOL_vol_L
hgT_pmol_BBL	      <-hgT_pM$Anoxic3 *BBL_vol_L;

hgT_pmol_sed1	      <-hgT_pM$Sed1 *Sed1_vol;
hgT_pmol_sed2		    <-hgT_pM$Sed2 *Sed2_vol;
# ------ end 

# ------ METHYLATION IN EACH ZONE
met_pmol_day_oxic	  <-(hgT_pmol_OL1*met$Oxic1)+(hgT_pmol_OL2*met$Oxic2)+
  (hgT_pmol_CIL*met$CIL)+(hgT_pmol_oxy*met$Oxycline)

metilatooOL1<-met$Oxic1*hgT_pmol_OL1
perc_met_OL1<-metilatooOL1/hgT_pmol_OL1*100  #lo 0.16% del pool di Hg viene metilato 
turn_hg_OL1<-hgT_pmol_OL1/metilatooOL1      #tutto il Hg in 2 anni (632 -634-5-639 gg)

metilatooOL2<-met$Oxic2 *hgT_pmol_OL2
perc_met_OL2<-metilatooOL2/hgT_pmol_OL2*100  #0.4%
turn_hg_OL2<-hgT_pmol_OL2/metilatooOL2  

met_pmol_day_suboxic  <-(hgT_pmol_SOL*met$Suboxic1)

metilatooSOL<-met$Suboxic1 *hgT_pmol_SOL
perc_met_SOL<-metilatooSOL/hgT_pmol_SOL*100  #0.4%
turn_hg_SOL<-hgT_pmol_SOL/metilatooSOL 

met_pmol_day_anoxic	  <-(hgT_pmol_UAL1*met$Suboxic2)+(hgT_pmol_UAL2*met$Anoxic1)+
						(hgT_pmol_DAOL*met$Anoxic2) + (hgT_pmol_BBL*met$Anoxic3)

met_pmol_day_suboxic  <-(hgT_pmol_SOL*met$Suboxic1)
met_pmol_day_anoxic	  <-(hgT_pmol_UAL1*met$Suboxic2)+(hgT_pmol_UAL2*met$Anoxic1)+
  (hgT_pmol_DAOL*met$Anoxic2) + (hgT_pmol_BBL*met$Anoxic3)

metilatooAOL1<-met$Suboxic2*hgT_pmol_UAL1
perc_met_AOL1<-metilatooAOL1/hgT_pmol_UAL1*100  #lo 0.16% del pool di Hg viene metilato 
turn_hg_AOL1<-hgT_pmol_UAL1/metilatooAOL1      #tutto il Hg in 2 anni (632 -634-5-639 gg)

metilatooAOL2<-met$Anoxic1 *hgT_pmol_UAL2
perc_met_AOL2<-metilatooAOL2/hgT_pmol_UAL2*100  #0.4%
turn_hg_AOL2<-hgT_pmol_UAL2/metilatooAOL2  ## 238 gg

metilatooAOL3<-met$Anoxic2 *hgT_pmol_DAOL
perc_met_AOL3<-metilatooAOL3/hgT_pmol_DAOL*100  #DAOL 0.42%
turn_hg_AOL3<-hgT_pmol_DAOL/metilatooAOL3  ## DAOL 239 gg

metilatooAOL4<-met$Anoxic3 *hgT_pmol_BBL
perc_met_AOL4<-metilatooAOL4/hgT_pmol_BBL*100  #DAOL 0.42%
turn_hg_AOL4<-hgT_pmol_BBL/metilatooAOL4  ## DAOL 239 gg

met_pmol_day_sed	  <-(hgT_pmol_sed1*met$Sed1)+(hgT_pmol_sed2*met$Sed2)

#----------------------------------------conc mehgT
mehgT_pmol_OL1		  <-mehgT_pM$Oxic1   *OL1_vol_L
mehgT_pmol_OL2		  <-mehgT_pM$Oxic2   *OL1_vol_L
mehgT_pmol_CIL		  <-mehgT_pM$CIL     *CIL_vol_L
mehgT_pmol_oxy		  <-mehgT_pM$Oxycline*oxy_vol_L

mehgT_pmol_SOL		  <-mehgT_pM$Suboxic1*SOL_vol_L

mehgT_pmol_UAL1	 	  <-mehgT_pM$Suboxic2*UAL1_vol_L
mehgT_pmol_UAL2	      <-mehgT_pM$Anoxic1 *UAL1_vol_L
mehgT_pmol_DAOL       <-mehgT_pM$Anoxic2 *DAOL_vol_L
mehgT_pmol_BBL	      <-mehgT_pM$Anoxic3 *BBL_vol_L;



mehgT_pmol_sed1	      <-mehgT_pM$Sed1 *Sed1_vol;
mehgT_pmol_sed2	      <-mehgT_pM$Sed2 *Sed2_vol;
# ------ DEMETHYLATION IN EACH ZONE					
mehg_oxic<-data.frame(mehgT_pmol_OL1,mehgT_pmol_OL2,
                mehgT_pmol_CIL, mehgT_pmol_oxy,
                mehgT$Oxycline)

demet_1_day_oxic<-data.frame(demet$Oxic1, demet$Oxic2,demet$CIL,demet$Oxycline)

demetilaato<-demet_1_day_oxic[,1]*mehg_oxic[,1]
perc_dem_OL1<-(demetilaato/mehg_oxic[,1]) *100 #ogni gg il 4% del pool viene demetilato 
turn_mehg_OL1<-mehg_oxic[,1]/demetilaato    # in 22 gg viene sostituito

demetilaato4<-demet_1_day_oxic[,4]*mehg_oxic[,4]
perc_dem_OL4<-demetilaato2/mehg_oxic[,4] *100 #ogni gg il 4 - 4.5% del pool viene demetilato 
turn_mehg_OL4<-mehg_oxic[,4]/demetilaato2    # in 16 - 22 gg viene sostituito

demet_pmol_day_oxic	   <-(mehgT_pmol_OL1 *demet$Oxic1) +(mehgT_pmol_OL2*demet$Oxic2)+
					             	 (mehgT_pmol_CIL *demet$CIL)   +(mehgT_pmol_oxy*demet$Oxycline)

demet_pmol_day_suboxic <-(mehgT_pmol_SOL *demet$Suboxic1)

demetilatooSOL<-demet$Suboxic1*mehgT_pmol_SOL
perc_dem_SOL<-c(demetilatooSOL/mehgT_pmol_SOL*100)
turnover_mehg_SOL<-c(mehgT_pmol_SOL/demetilatooSOL)

demet_pmol_day_anoxic  <-(mehgT_pmol_UAL1*demet$Suboxic2)+(mehgT_pmol_UAL2*demet$Anoxic1)+
					             	 (mehgT_pmol_DAOL*demet$Anoxic2) +(mehgT_pmol_BBL*demet$Anoxic3)

mehgT_pmol_AOL<-c(mehgT_pmol_UAL1,mehgT_pmol_UAL2,
                  mehgT_pmol_DAOL,mehgT_pmol_BBL)

demetilatooAOL1<-demet$Suboxic2*mehgT_pmol_UAL1
perc_dem_AOL1<-demetilatooAOL1/mehgT_pmol_UAL1*100
turn_mehg_AOL1<-mehgT_pmol_UAL1/demetilatooAOL1

demetilatooAOL2<-demet$Anoxic1 *mehgT_pmol_UAL2
perc_dem_AOL2<-demetilatooAOL2/mehgT_pmol_UAL2*100  #0.4%
turn_mehg_AOL2<-mehgT_pmol_UAL2/demetilatooAOL2  ## 238 gg

demetilatooAOL4<-demet$Anoxic3 *mehgT_pmol_BBL
perc_dem_AOL4<-demetilatooAOL4/mehgT_pmol_BBL*100  #DAOL 0.42%
turn_mehg_AOL4<-c(mehgT_pmol_BBL/demetilatooAOL4)  ## DAOL 239 gg

demet_pmol_day_sed	  <-(mehgT_pmol_sed1*demet$Sed1)+(mehgT_pmol_sed2*met$Sed2)


met_kmol_y_OL  <-met_pmol_day_oxic*365/10^15; mean(tail(met_kmol_y_OL,12))   # 27 kmol
met_kmol_y_SOL <-met_pmol_day_suboxic*365/10^15; mean(tail(met_kmol_y_SOL,12)) # 6.7 kmol
met_kmol_y_AOL <-met_pmol_day_anoxic*365/10^15; mean(tail(met_kmol_y_AOL,12))  # 206 kmol
met_kmol_y_SED <-met_pmol_day_sed*365/10^15; mean(tail(met_kmol_y_SED,12))  # 206 kmol

demet_kmol_y_OL  <-demet_pmol_day_oxic*365/10^15; mean(tail(demet_kmol_y_OL,12))  # 27.8 kmol
demet_kmol_y_SOL <-demet_pmol_day_suboxic*365/10^15; mean(tail(demet_kmol_y_SOL,12)) # 10 kmol
demet_kmol_y_AOL <-demet_pmol_day_anoxic*365/10^15; mean(tail(demet_kmol_y_AOL,12))#  198 kmol
demet_kmol_y_SED <-demet_pmol_day_sed*365/10^15; mean(tail(demet_kmol_y_SED,12))  # 206 kmol

met_kmol_y<-data.frame(met_kmol_y_OL, met_kmol_y_SOL, met_kmol_y_AOL,met_kmol_y_SED)
demet_kmol_y<-data.frame(demet_kmol_y_OL, demet_kmol_y_SOL, demet_kmol_y_AOL,demet_kmol_y_SED)

trasf<-cbind(met_kmol_y,demet_kmol_y); str(trasf)
write.csv(trasf, file='trasformazioni.csv')
str(met_kmol_y)
trasf[1969,]

netto_prodotto_long<-met_kmol_y-demet_kmol_y
netto_prodotto_TOT_long<-rowSums(netto_prodotto_long)
plot(netto_prodotto_TOT_long)



metilato   <-rowSums(met_kmol_y)
demetilato <-rowSums(demet_kmol_y)
mean(tail(metilato,36))
mean(tail(demetilato,36))

str(met_kmol_y_OL)

mean(tail(met_kmol_y_OL,12))/mean(tail(metilato,12))*100
mean(tail(met_kmol_y_SOL,12))/mean(tail(metilato,12))*100
mean(tail(met_kmol_y_AOL,12))/mean(tail(metilato,12))*100

mean(tail(demet_kmol_y_OL,12))/mean(tail(demetilato,12))*100
mean(tail(demet_kmol_y_SOL,12))/mean(tail(demetilato,12))*100
mean(tail(demet_kmol_y_AOL,12))/mean(tail(demetilato,12))*100

write.csv(netto_prodotto_long, file='mehg_prodotto_kmol_y_2050.csv')
write.csv(demetilato, file='demetilato.csv')
write.csv(metilato, file='metilato.csv')

head(netto_prodotto_long,30)
head(metilato,15)
head(demetilato,15)

met_kmol_y_media <-as.numeric(lapply(met_kmol_y ,rep(1:(length(met_kmol_y)/12),each=12), mean))

OL_demet_kmol_y_media <-as.numeric(tapply(demet_kmol_y[,1] ,rep(1:(length(demet_kmol_y[,1])/12), each = 12), mean))
SOL_demet_kmol_y_media <-as.numeric(tapply(demet_kmol_y[,2] ,rep(1:(length(demet_kmol_y[,2])/12), each = 12), mean))
AOL_demet_kmol_y_media <-as.numeric(tapply(demet_kmol_y[,3] ,rep(1:(length(demet_kmol_y[,3])/12), each = 12), mean))
SED_demet_kmol_y_media <-as.numeric(tapply(demet_kmol_y[,4] ,rep(1:(length(demet_kmol_y[,4])/12), each = 12), mean))

OL_met_kmol_y_media <-as.numeric(tapply(met_kmol_y[,1] ,rep(1:(length(demet_kmol_y[,1])/12), each = 12), mean))
SOL_met_kmol_y_media <-as.numeric(tapply(met_kmol_y[,2] ,rep(1:(length(demet_kmol_y[,2])/12), each = 12), mean))
AOL_met_kmol_y_media <-as.numeric(tapply(met_kmol_y[,3] ,rep(1:(length(demet_kmol_y[,3])/12), each = 12), mean))
SED_met_kmol_y_media <-as.numeric(tapply(met_kmol_y[,4] ,rep(1:(length(met_kmol_y[,4])/12), each = 12), mean))

SED_demet_kmol_y_media[164]
SED_met_kmol_y_media[164]

OL_met_kmol_y_media[164]


met_kmol_y<-data.frame(OL_met_kmol_y_media, SOL_met_kmol_y_media, AOL_met_kmol_y_media)
demet_kmol_y<-data.frame(OL_demet_kmol_y_media, SOL_demet_kmol_y_media, AOL_demet_kmol_y_media)

met_kmol_y[164,] demet_kmol_y[164,]

netto_prodotto_OL  <-(OL_met_kmol_y_media - OL_demet_kmol_y_media) 
netto_prodotto_SOL <-(SOL_met_kmol_y_media- SOL_demet_kmol_y_media) 
netto_prodotto_AOL <-(AOL_met_kmol_y_media- AOL_demet_kmol_y_media) 
netto_prodotto_SED <-(SED_met_kmol_y_media- SED_demet_kmol_y_media) 

netto<-netto_prodotto_OL+netto_prodotto_SOL+netto_prodotto_AOL; mean(tail(netto,12))
netto_prodotto<-data.frame(netto_prodotto_OL,netto_prodotto_SOL, 
                  netto_prodotto_AOL, netto)

write.csv(netto_prodotto, file='netto_prodotto_kmol_y_2050.csv')
write.table(netto, file='netto_TOT_2050.txt')
write.csv(netto_prodotto_TOT_long,file='netto_prodotto_long_2050.csv')
plot(netto_prodotto_OL);abline(h=2.9)
plot(netto_prodotto_SOL);abline(h=2.9)
plot(netto_prodotto_AOL);abline(h=2.9)
plot(netto);abline(h=2.9)

mean(tail(netto,12))
mean(tail(netto_prodotto_OL,12))
mean(tail(netto_prodotto_SOL,12))
mean(tail(netto_prodotto_AOL,12))

mean(tail(AOL_met_kmol_y_media,12))
mean(tail(AOL_demet_kmol_y_media,12))

a<-mean(tail(netto_prodotto_OL,12))+
  mean(tail(netto_prodotto_SOL,12))+mean(tail(netto_prodotto_AOL,12))

b<-a+1.64
1/b*100
.6/b*100
.06/b*100

(a/b*100)+(1/b)*100+(.06/b*100)+(.6/b*100)

AOL_met_kmol_y_media


d_perc_dem<-data.frame(perc_dem_OL1,perc_dem_OL4, perc_dem_SOL,
           perc_dem_AOL1,perc_dem_AOL2,perc_dem_AOL4)

d_perc_dem<-data.frame(perc_dem_OL1,perc_dem_OL4, perc_dem_SOL,
                   perc_dem_AOL1,perc_dem_AOL2,perc_dem_AOL4)

mehg_turn<-data.frame(turn_mehg_OL1,turn_mehg_OL4, turnover_mehg_SOL,
                   turn_mehg_AOL1,turn_mehg_AOL2,turn_mehg_AOL4)

d_percmet<-data.frame(perc_met_OL1,perc_met_OL2, perc_met_SOL,
                      perc_met_AOL1,perc_met_AOL2,perc_met_AOL4)

hg_turn<-data.frame(turn_hg_OL1,turn_hg_OL2, turn_hg_SOL,
                    turn_hg_AOL1,turn_hg_AOL2,turn_hg_AOL4)
d_perc_dem[1969,]
d_percmet[1969,]
hg_turn[1969,]
mehg_turn[1969,]

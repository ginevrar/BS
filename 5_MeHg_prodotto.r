## Produzione INTERNA MeHg

#REAZIONI VANNO MOLTIPLICATE PER TOTALE E NON PER FASE DISCiOLTA (?!?!)
setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")

met<-read.csv('Bacterial_Methylation_Rate.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(met)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2");
met<-met[2:1969,1:13]
demet<-read.csv('Bacterial_Demethylation_Rate.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(demet)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2");
demet<-demet[2:1969,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); mehg<-mehg[2:1969,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); DOCmehg<-DOCmehg[2:1969,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); hg0<-hg0[2:1969,1:13]			  

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip =1, sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); DOChg<-DOChg[2:1969,1:13]

hg<-read.csv("Dissolved_Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); hg<-hg[2:1969,1:13]

hgT<-read.csv("Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); hgT<-hgT[2:1969,1:13]

mehgT<-read.csv("Methyl_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic1","Anoxic2","Anoxic3","Sed1","Sed2"); mehgT<-mehgT[2:1969,1:13]

OL1_vol_m3 <-5.9E+12; 			OL1_vol_L  <-OL1_vol_m3*1000
CIL_vol_m3 <-4.5E+12; 			CIL_vol_L  <-CIL_vol_m3*1000
oxy_vol_m3 <-5.9E+12; 			oxy_vol_L  <-oxy_vol_m3*1000
SOL_vol_m3 <-7.4E+12; 			SOL_vol_L  <-SOL_vol_m3*1000
UAL1_vol_m3 <-5.3E+13; 			UAL1_vol_L  <-UAL1_vol_m3*1000
DAOL_vol_m3 <-2.9E+14; 			DAOL_vol_L  <-DAOL_vol_m3*1000
BBL_vol_m3 <-1E+14; 			BBL_vol_L  <-BBL_vol_m3*1000

diss_mehg<-DOCmehg+mehg; str(diss_mehg)
diss_hgII<-hg+DOChg; str(diss_hgII)

diss_mehg_pM<-(diss_mehg/215)*1000
diss_hgII_pM<-(diss_hgII/200.59)*1000
diss_hgt<-(diss_mehg_pM+diss_hgII_pM)

mehgT_pM <-(mehgT/215)*1000
hgT_pM   <-(hgT/200.59)*1000

#-------conc diss hg
diss_hgII_pmol_OL1		  <-diss_hgII_pM$Oxic1*OL1_vol_L
diss_hgII_pmol_OL2		  <-diss_hgII_pM$Oxic2*OL1_vol_L
diss_hgII_pmol_CIL		  <-diss_hgII_pM$CIL*CIL_vol_L
diss_hgII_pmol_oxy		  <-diss_hgII_pM$Oxycline*oxy_vol_L

diss_hgII_pmol_SOL	 <-diss_hgII_pM$Suboxic1*SOL_vol_L

diss_hgII_pmol_UAL1	 <-diss_hgII_pM$Suboxic2*UAL1_vol_L
diss_hgII_pmol_UAL2	 <-diss_hgII_pM$Anoxic1 *UAL1_vol_L
diss_hgII_pmol_DAOL  <-diss_hgII_pM$Anoxic2 *DAOL_vol_L
diss_hgII_pmol_BBL	 <-diss_hgII_pM$Anoxic3 *BBL_vol_L;
# ------ end 

#----------------------------------------conc hgT
hgT_pmol_OL1		  <-hgT_pM$Oxic1   *OL1_vol_L
hgT_pmol_OL2		  <-hgT_pM$Oxic2   *OL1_vol_L
hgT_pmol_CIL		  <-hgT_pM$CIL     *CIL_vol_L
hgT_pmol_oxy		  <-hgT_pM$Oxycline*oxy_vol_L

hgT_pmol_SOL		  <-hgT_pM$Suboxic1*SOL_vol_L

hgT_pmol_UAL1	 	  <-hgT_pM$Suboxic2*UAL1_vol_L
hgT_pmol_UAL2	      <-hgT_pM$Anoxic1 *UAL1_vol_L
hgT_pmol_DAOL         <-hgT_pM$Anoxic2 *DAOL_vol_L
hgT_pmol_BBL	      <-hgT_pM$Anoxic3 *BBL_vol_L;
# ------ end 

# ------ METHYLATION IN EACH ZONE
met_pmol_day_oxic	  <-(hgT_pmol_OL1*met$Oxic1)+(hgT_pmol_OL2*met$Oxic2)+(hgT_pmol_CIL*met$CIL)+(hgT_pmol_oxy*met$Oxycline)
met_pmol_day_suboxic  <-(hgT_pmol_SOL*met$Suboxic1)
met_pmol_day_anoxic	  <-(hgT_pmol_UAL1*met$Suboxic2)+(hgT_pmol_UAL2*met$Anoxic1)+
						(hgT_pmol_DAOL*met$Anoxic2) + (hgT_pmol_BBL*met$Anoxic3)

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

# ------ DEMETHYLATION IN EACH ZONE					
demet_pmol_day_oxic	   <-(mehgT_pmol_OL1 *demet$Oxic1) +(mehgT_pmol_OL2*demet$Oxic2)+
					             	 (mehgT_pmol_CIL *demet$CIL)   +(mehgT_pmol_oxy*demet$Oxycline)
demet_pmol_day_suboxic <-(mehgT_pmol_SOL *demet$Suboxic1)
demet_pmol_day_anoxic  <-(mehgT_pmol_UAL1*demet$Suboxic2)+(mehgT_pmol_UAL2*demet$Anoxic1)+
					             	 (mehgT_pmol_DAOL*demet$Anoxic2) +(mehgT_pmol_BBL*demet$Anoxic3)
						 
met_kmol_y_OL  <-met_pmol_day_oxic*365/10^15; mean(tail(met_kmol_y_OL,12))   # 27 kmol
met_kmol_y_SOL <-met_pmol_day_suboxic*365/10^15; mean(tail(met_kmol_y_SOL,12)) # 6.7 kmol
met_kmol_y_AOL <-met_pmol_day_anoxic*365/10^15; mean(tail(met_kmol_y_AOL,12))  # 206 kmol

demet_kmol_y_OL  <-demet_pmol_day_oxic*365/10^15; mean(tail(demet_kmol_y_OL,12))  # 27.8 kmol
demet_kmol_y_SOL <-demet_pmol_day_suboxic*365/10^15; mean(tail(demet_kmol_y_SOL,12)) # 10 kmol
demet_kmol_y_AOL <-demet_pmol_day_anoxic*365/10^15; mean(tail(demet_kmol_y_AOL,12))#  198 kmol




met_kmol_y<-data.frame(met_kmol_y_OL, met_kmol_y_SOL, met_kmol_y_AOL)
demet_kmol_y<-data.frame(demet_kmol_y_OL, demet_kmol_y_SOL, demet_kmol_y_AOL)

trasf<-cbind(met_kmol_y,demet_kmol_y); str(trasf)
write.csv(trasf, file='trasformazioni.csv')

netto_prodotto_long<-met_kmol_y-demet_kmol_y
netto_prodotto_TOT_long<-rowSums(netto_prodotto_long)

metilato   <-rowSums(met_kmol_y)
demetilato <-rowSums(demet_kmol_y)
mean(tail(metilato,36))
mean(tail(demetilato,36))

mean(tail(met_kmol_y_OL,12))/mean(tail(metilato,12))*100
mean(tail(met_kmol_y_SOL,12))/mean(tail(metilato,12))*100
mean(tail(met_kmol_y_AOL,12))/mean(tail(metilato,12))*100

mean(tail(demet_kmol_y_OL,12))/mean(tail(demetilato,12))*100
mean(tail(demet_kmol_y_SOL,12))/mean(tail(demetilato,12))*100
mean(tail(demet_kmol_y_AOL,12))/mean(tail(demetilato,12))*100

write.csv(netto_prodotto_long, file='mehg_prodotto_kmol_y.csv')
write.csv(demetilato, file='demetilato.csv')
write.csv(metilato, file='metilato.csv')



met_kmol_y_media <-as.numeric(lapply(met_kmol_y ,rep(1:(length(met_kmol_y)/12),each=12), mean))

OL_demet_kmol_y_media <-as.numeric(tapply(demet_kmol_y[,1] ,rep(1:(length(demet_kmol_y[,1])/12), each = 12), mean))
SOL_demet_kmol_y_media <-as.numeric(tapply(demet_kmol_y[,2] ,rep(1:(length(demet_kmol_y[,2])/12), each = 12), mean))
AOL_demet_kmol_y_media <-as.numeric(tapply(demet_kmol_y[,3] ,rep(1:(length(demet_kmol_y[,3])/12), each = 12), mean))

OL_met_kmol_y_media <-as.numeric(tapply(met_kmol_y[,1] ,rep(1:(length(demet_kmol_y[,1])/12), each = 12), mean))
SOL_met_kmol_y_media <-as.numeric(tapply(met_kmol_y[,2] ,rep(1:(length(demet_kmol_y[,2])/12), each = 12), mean))
AOL_met_kmol_y_media <-as.numeric(tapply(met_kmol_y[,3] ,rep(1:(length(demet_kmol_y[,3])/12), each = 12), mean))


met_kmol_y<-data.frame(OL_met_kmol_y_media, SOL_met_kmol_y_media, AOL_met_kmol_y_media)
demet_kmol_y<-data.frame(OL_demet_kmol_y_media, SOL_demet_kmol_y_media, AOL_demet_kmol_y_media)

netto_prodotto_OL  <-(OL_met_kmol_y_media - OL_demet_kmol_y_media) 
netto_prodotto_SOL <-(SOL_met_kmol_y_media- SOL_demet_kmol_y_media) 
netto_prodotto_AOL <-(AOL_met_kmol_y_media- AOL_demet_kmol_y_media) 
netto<-netto_prodotto_OL+netto_prodotto_SOL+netto_prodotto_AOL; mean(tail(netto,12))
netto_prodotto<-data.frame(netto_prodotto_OL,netto_prodotto_SOL, 
                  netto_prodotto_AOL, netto)

write.csv(netto_prodotto, file='netto_prodotto_1.csv')
write.table(netto, file='netto_TOT.txt')
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


m_pmol_day_anoxic	  <-data.frame((hgT_pmol_UAL1*met$Suboxic2),(hgT_pmol_UAL2*met$Anoxic1),
  (hgT_pmol_DAOL*met$Anoxic2) , (hgT_pmol_BBL*met$Anoxic3))

colMeans(tail(m_pmol_day_anoxic, 12)*365/10^15)

dm_pmol_day_anoxic  <-data.frame((mehgT_pmol_UAL1*demet$Suboxic2),(mehgT_pmol_UAL2*demet$Anoxic1),
  (mehgT_pmol_DAOL*demet$Anoxic2),(mehgT_pmol_BBL*demet$Anoxic3))

colMeans(tail(dm_pmol_day_anoxic, 12)*365/10^15)

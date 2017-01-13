#
# nn tornano i conti
#
# Mass Balance delle foto reazioni
#
# gen 2013-dic 2013 --> [1958:1969]
# 
# primo anno out ha 13 out, gli alti 12
#  2414 out/200 anni = 12.07
#  sim 1850 - 2050
#
#
#
setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0")
atm_hg<-read.table("atm_hg.txt", header = TRUE); str(atm_hg)
atm_hg0<-atm_hg$atm_hg0   # --- atm conc of hg0 -
str(atm_hg0)

light<-read.table("light_norm.txt", header = TRUE); 
names(light)<-'light' ; light_sur<-light$light
light_sur_w_m2<-read.table("light_w_m2.txt", header = TRUE); 
light_sur_w_m2<-light_sur_w_m2$wm2

kred<-0.12
kox<-0.14
kdeg<-3.14685E-2

#Leggi model output
setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1b")
hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
str(hg$Oxic1)
hg<-hg[2:1969,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1, sep = ",")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT[2:1969,1:13]

solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
solids<-solids[2:1969,1:13]

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-Phg[2:1969,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg[2:1969,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg[2:1969,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg[2:1969,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0[2:1969,1:13]

dhg0<-read.csv("Dissolved_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(dhg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
dhg0<-dhg0[2:1969,1:13]

DOChg0<-read.csv("DOC_Sorbed_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg0<-DOChg0[2:1969,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehgT<-mehgT[2:1969,1:13]

fotored<-read.csv("Photo_Reduction_Divalent_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotored)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2");
fotored<-fotored[2:1969,1:13]
fotodem<-read.csv("Photo_Demethylation_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotodem)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
fotodem<-fotodem[2:1969,1:13]

evasion<-read.csv("Volatilization_Loss_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(evasion)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
evasion<-evasion[2:1969,1:13]
str(evasion)

silt<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3","Sed1","Sed2")
silt<-silt[2:1969,1:13]

POM<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
              "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
              "Anoxic3","Sed1","Sed2")
POM<-POM[2:1969,1:13]
str(POM$Time)

oxic_vol_m3<-5.9E+12
oxic_vol_L<-oxic_vol_m3*1000
Model_area  <-2.961E+11

time.steps <- hgT$Time     # leggo model timestep 
time.steps <- trunc(time.steps, 0)
time.steps <- time.steps*24*3600   # trasformo in sec
TEMPO <- as.POSIXct(time.steps, tz= "GMT", origin = "1850-01-01") # creo la var tempo
TEMPO[1:10]  # stringa con date
rdate1<-as.Date(TEMPO, tz= "GMT", format="%Y") #creo rdate1 (per  xlab)

#------- calcolo frazioni DOC complexed

fDOChg   <-DOChg$Oxic1/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg, na.rm=TRUE);plot(fDOChg*100)
fDOCmehg <-DOCmehg$Oxic1/mehgT$Oxic1
fDOChg0  <-DOChg0$Oxic1/hg0$Oxic1
fdhg0    <-dhg0$Oxic1/hg0$Oxic1

#-------- conc Hg species pM
Hg0_pM1<-hg0$Oxic1/200.59*1000; mean(hg0$Oxic1)
Hg0_pmols1<-Hg0_pM1*oxic_vol_L  # bulk of Hg0 in upper oxic layer

hgII<-(hg$Oxic1+DOChg$Oxic1+Phg$Oxic1) # total HgII (diss, DOC, part)
HgII_pM<-hgII/200.59*1000              # pM
HgII_pmols<-HgII_pM*oxic_vol_L          # bulk of HgII in oxic layer

mehg_<-mehgT$Oxic1              
mehg_pM<-mehg_/215*1000
MeHg_pmols<-mehg_pM*oxic_vol_L    # bulk of MeHg in upper oxic layer

hgII_ngL<-hgII
hg0_ngL<-hg0$Oxic1
mehg_ngL<-mehgT$Oxic1

mean(hg0_g_m3/hgII_g_m3*100) #hg0 %

# --------- fotoreactions out [1/d] /84600 -> 1/s; 
# --------- those rate are given by someting as -> kdeg (1/d) * fDOCmehg (-) adjusted for light intensity
#  
# skred = kred*LN(t)*[xdOC*hgII]*10^-6
ke<-0.2        #extintion coeff
e<-2.71828     #nepero 
d<-20       #box depth

L_ref<-350
ekde<-e^(-ke*d)
LNt_red<-(light_sur_w_m2/L_ref)*((1-ekde)/(ke*d))
str(LNt_red)
plot(LNt_red[12:24], type='l')

out_red_1_d  <-fotored$Oxic1; str(out_red_1_d); mean(out_red_1_d)
out_ox_1_d <-fotored$Oxic1*(kox/kred)
out_dem_1_d <-fotodem$Oxic1

kred_adj<- LNt_red[1:1968]*kred
skred<-kred_adj*fDOChg*100
mean(skred)  

mean(kred_adj)  
par(mfrow=c(1,2))
plot(out_red_1_d[3:50], type='l')    # and becomes on average 3E-4/day

plot(kred_adj[3:50], type='l')


#original kred (0.12 /day is corrected to the DOC fraction )

red_g_m3_day<-mean(kred_adj*hgII_ngL) # questo da stesso risultato di out_red in oxic1, quindi 

kred_adj2<- LNt_red[1:1968]*kred*(DOChg)

mean(out_red_1_d*hgII_ngL*10^-6)     # nell'output del modello sono già incluse le moltiplicazioni per 
                          # i ng/L 
red_pg_m3_day<-red_g_m3_day*10^12

LNt_red[1:1968]*kred*DOChg*10^-6



kox_adj<- LNt_red[1:1968]*kox*0.99*1e-6  #original kred (0.12 /day is corrected to the DOC fraction )
mean(kox_adj*hg0_g_m3[1:1968])
mean(out_ox_1_d)

fotox_1_s   <-(fotox/(24*60*60)) 
fotodem_1_s <-(fotodem$Oxic1/(24*60*60))
fotored_1_s <-(fotored$Oxic1/(24*60*60))

ef_red <-fotored_1_s/fDOChg ; mean(ef_red) # quindi questo dovrebbe restituire il tasso in input +  o meno
ef_ox  <-fotox_1_s          ;  mean(ef_ox)
ef_deg <-fotodem_1_s/fDOCmehg


#FOTORIDUZIONE
HgII_pmols<-HgII_pM*oxic_vol_L;
fotored_pmols_sec <-fotored_1_s* HgII_pmols
fotored_pmols_y <-fotored_pmols_sec*60*60*24*365
fotored_kmols_y<-fotored_pmols_y/10^15
fotored_kmols_y_media<-tapply(fotored_kmols_y,rep(1:(length(fotored_kmols_y)/12), each = 12), mean)
plot(fotored_kmols_y_media, type='b')

#FOTOSSIDAZIONE
Hg0_pmols1<-Hg0_pM1*oxic_vol_L 
fotox_pmol_s <- fotox_1_s*Hg0_pmols1
fotox_pmols_y <-fotox_pmol_s*60*60*24*365
fotox_kmols_y<-fotox_pmols_y/10^15
fotox_kmols_y_media<-tapply(fotox_kmols_y,rep(1:(length(fotox_kmols_y)/12), each = 12), mean)
fotox_kmols_y_media<-as.numeric(fotox_kmols_y_media)
plot(fotox_kmols_y_media)

#FOTODEG
MeHg_pmols <-mehg_pM*oxic_vol_L 
fotodem_pmol_s<-fotodem_1_s*MeHg_pmols
fotodem_pmols_y <-fotodem_pmol_s*60*60*24*365
fotodem_kmols_y<-fotodem_pmols_y/10^12
fotodem_kmols_y_media<-tapply(fotodem_kmols_y,rep(1:(length(fotodem_kmols_y)/12), each = 12), mean)
fotodem_kmols_y_media<-as.numeric(fotodem_kmols_y_media)
plot(fotodem_kmols_y_media)

output_kmol_y<-cbind(fotox_kmols_y, fotored_kmols_y, 
                     fotodem_kmols_y, 
                     Hg0_pM1, HgII_pM, mehg_pM, fotored_1_s,
                     ef_red, fotox_1_s, ef_ox,fotodem_1_s, ef_deg)

fotored_1_s_media<-tapply(fotored_1_s,rep(1:(length(fotored_1_s)/12), each = 12), mean)
fotored_1_s_media<-as.numeric(fotored_1_s_media)
ef_red_media     <-tapply(ef_red,rep(1:(length(ef_red)/12), each = 12), mean)
ef_red_media<-as.numeric(ef_red_media)
fotox_1_s_media<-tapply(fotox_1_s,rep(1:(length(fotox_1_s)/12), each = 12), mean)                          
fotox_1_s_media<-as.numeric(fotox_1_s_media)
ef_ox_media     <-tapply(ef_ox,rep(1:(length(ef_ox)/12), each = 12), mean)
ef_ox_media<-as.numeric(ef_ox_media)                          
fotodem_1_s_media<-tapply(fotodem_1_s,rep(1:(length(fotodem_1_s)/12), each = 12), mean)                          
fotodem_1_s_media<-as.numeric(fotodem_1_s_media)
ef_deg_media     <-tapply(ef_deg,rep(1:(length(ef_deg)/12), each = 12), mean)


Hg0_pM_media1<-tapply(Hg0_pM1,rep(1:(length(Hg0_pM1)/12), each = 12), mean)
HgII_pM_media<-tapply(HgII_pM,rep(1:(length(HgII_pM)/12), each = 12), mean)
mehg_pM_media<-tapply(mehg_pM,rep(1:(length(mehg_pM)/12), each = 12), mean)


output_kmol_y_media<-cbind(fotox_kmols_y_media, fotored_kmols_y_media, 
                           fotodem_kmols_y_media,
                           Hg0_pM_media1, HgII_pM_media, mehg_pM_media, fotored_1_s_media,
                           ef_red_media, fotox_1_s_media, ef_ox_media,fotodem_1_s_media, ef_deg_media)

write.csv(output_kmol_y, file="A_fotoreazioni1.csv")
write.csv(output_kmol_y_media , file="A_fotoreazioni_media1.csv")

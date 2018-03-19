#
# Mass Balance delle foto reazioni
# output fotoreactions indipendenti dalla massa
#
# evasion indipendente da massa hg in acque, 
# anche da conc atmosfera, a questi livelli....
# importante temp correction factor....
#
# 
# FORMULA OUTPUT:
# kred_adj<- LNt_red * kred * fd *(fDOChg*100)  [1/day]
# 
#kred * massa = massa/day
#  
# ok i calcoli, 
#fatto test !
#
# gen 2013-dic 2013 --> [1958:1969]
# 
# primo anno out ha 13 out, gli alti 12
#  2414 out/200 anni = 12.07
#  sim 1850 - 2050
#
setwd('C:/Users/gi/Google Drive/MERCURIO/BlackSea/implementazione')
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale2')

atm_hg<-read.table("atm_hg.txt", header = F); str(atm_hg)
atm_hg0<-atm_hg$V1   # --- atm conc of hg0 -
str(atm_hg0)
atm_hg0

light<-read.table("light_norm.txt", header = TRUE); names(light)<-'light' ; light_sur<-light$light
light_sur_w_m2<-read.table("light_w_m2.txt", header = TRUE); light_sur_w_m2<-light_sur_w_m2$wm2
fd<-read.table("frac_day.txt", header = F); 

kred<-0.16
kox<-0.57
kdeg<-3E-3

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin

evasion<-read.csv("Volatilization_Loss_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(evasion)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
evasion<-evasion [2:2413,1:13]
str(evasion)
cCC<-tail(evasion)

hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
str(hg$Oxic1)
hg<-hg [2:2413,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1, sep = ",")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,1:13]
str(hgT)
solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
solids<-solids [2:2413,1:13]

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-Phg [2:2413,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg [2:2413,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg [2:2413,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg [2:2413,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0 [2:2413,1:13]

dhg0<-read.csv("Dissolved_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(dhg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
dhg0<-dhg0 [2:2413,1:13]

DOChg0<-read.csv("DOC_Sorbed_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg0<-DOChg0 [2:2413,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehgT<-mehgT [2:2413,1:13]

fotored<-read.csv("Photo_Reduction_Divalent_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotored)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2");
fotored<-fotored [2:2413,1:13]
fotodem<-read.csv("Photo_Demethylation_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotodem)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
fotodem<-fotodem [2:2413,1:13]

silt<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3","Sed1","Sed2")
silt<-silt [2:2413,1:13]

POM<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
              "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
              "Anoxic3","Sed1","Sed2")
POM<-POM [2:2413,1:13]
str(POM$Time)

oxic_vol_m3<-5.9E+12
oxy_vol_L<-oxic_vol_m3*1000
Model_area  <-2.961E+11

time.steps <- hgT$Time     # leggo model timestep 
time.steps <- trunc(time.steps, 0)
time.steps <- time.steps*24*3600   # trasformo in sec
TEMPO <- as.POSIXct(time.steps, tz= "GMT", origin = "1850-01-01") # creo la var tempo
TEMPO[1:10]  # stringa con date
rdate1<-as.Date(TEMPO, tz= "GMT", format="%Y") #creo rdate1 (per  xlab)

#------- calcolo frazioni DOC complexed
siltOL<-silt$Oxic1/10^6
POMOL<-POM$Oxic1/10^6

fDOChg2   <-DOChg$Oxic1/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg, na.rm=TRUE);plot(fDOChg*100)
fDOChg <- (10^3*(2.9*10^-6))/(1+(10^3*(2.9*10^-6))+((siltOL*3000)+(POMOL*(5.1*10^5))))
#uguale a primam
fDOCmehg <-DOCmehg$Oxic1/mehgT$Oxic1
fDOChg0  <-DOChg0$Oxic1/hg0$Oxic1
fdhg0    <-dhg0$Oxic1/hg0$Oxic1

fdisshg2   <-(DOChg$Oxic1+hg$Oxic1)/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg2, na.rm=TRUE);plot(fDOChg*100)

#-------- conc Hg species pM
Hg0_pM1<-hg0$Oxic1/200.59*1000; mean(hg0$Oxic1)
Hg0_pmols1<-Hg0_pM1*oxic_vol_L  # bulk of Hg0 in upper oxic layer
Hg0_kmols1<-Hg0_pmols1/10^15
mean(Hg0_kmols1[1957:1968])
mean(Hg0_pM1[1957:1968])

mehg_<-mehgT$Oxic1              
mehg_pM<-mehg_/215*1000
MeHg_pmols<-mehg_pM*oxic_vol_L    # bulk of MeHg in upper oxic layer
MeHg_kmols1<-MeHg_pmols/10^15
mean(MeHg_kmols1[1957:1968])
mean(mehg_pM[1957:1968])

fDOChg2

hgII_DOC<-DOChg$Oxic1 # ngL total HgII (diss, DOC, part)
hgII_tot<-(hg$Oxic1+DOChg$Oxic1+Phg$Oxic1)
hgII_DOC/hgII_tot*100

hgII_DOC_pM<-hgII_DOC/200.59*1000
hgII_DOC_pmols <-hgII_DOC_pM*oxic_vol_L
HgII_DOC_kmols<-hgII_DOC_pmols/10^15

HgII_pM<-hgII_tot/200.59*1000              # pM

HgII_pmols<-HgII_pM*oxic_vol_L          # bulk of HgII in oxic layer

HgII_kmols<-HgII_pmols/10^15
mean(HgII_kmols1[1957:1968])
mean(HgII_pM[1957:1968])

HgP_pM<-Phg$Oxic1/200.59*1000; 
HgP_pmols1<-HgP_pM*oxic_vol_L  # bulk of Hg0 in upper oxic layer
HgP_kmols1<-HgP_pmols1/10^15

hgT<-hgT$Oxic1 # total Hg 
hgI<-(hgT-mehg_-hg0$Oxic1)/200.59*1000
hgI_pmols<-hgI*oxic_vol_L  # bulk of HgII in upper oxic layer

hgDOC<-(DOChg$Oxic1) 
hgDOC<-(DOChg$Oxic1) 

# ngL total HgII (diss, DOC, part)
HgDOC_pM<-hgDOC/200.59*1000              # pM
HgDOC_pmols<-HgDOC_pM*oxic_vol_L          # bulk of HgII in oxic layer

hgII_ngL<-hgII
hg0_ngL<-hg0$Oxic1
mehg_ngL<-mehgT$Oxic1

plot(Hg0_kmols1[1950:2029])
#mean(hg0_g_m3/hgII_g_m3*100) #hg0 %
# ---------
## [(f_Hg0_diss + f_Hg0_DOC) / f_HgII_DOC]
ef_red <-fotored_1_s/fdisshg2 ; mean(ef_red*60*60*24) 
mean(ef_red)# quindi questo dovrebbe restituire il tasso in input +  o meno
ef_ox  <-fotox_1_s  /fDOChg        ;  mean(ef_ox*60*60*24)
ef_deg <-fotodem_1_s/fDOCmehg;     mean(ef_deg*60*60*24)
# --------- fotoreactions out [1/d] /84600 -> 1/s; 
# --------- those rate are given by someting as -> kdeg (1/d) * fDOCmehg (-) adjusted for light intensity
#  
#    skred = kred *LN(t) * [xdOC*hgII] * 10^-6
ke<-0.2        #extintion coeff
e<-2.71828     #nepero 
d<-20 
fd<-0.42      #fraction daylight
fac1<-ke*d
#box depth
L_ref<-170
ekde<-e^-fac1
plot(ekde)
LNt_red<-(light_sur_w_m2/L_ref)*((1-ekde)/(fac1))
#str(LNt_red)
#plot(LNt_red[12:24], type='l')


skred = kred *LNt_red*fd*fdisshg2*hgT$Oxic1

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);

skred_ugd<-skred*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^8)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

plot(hg0_ngL)
mean( hg0_ngL[1957:1968])
mean( hg0_ngL[1977:1988])
mean( hg0_ngL[1977:1988])

skred_b = kred *LNt_red * (fDOChg2*hgII_tot)


skred_1 = kred *LNt_red* fDOChg2*fd *hgII_tot

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);  mean(skred_b[1957:1969]);mean(skred_1[1957:1969]);


skox = kox *LNt_red*fd
10^-2 ug d-1
mean(out_ox_1_d[1957:1969]);mean(skox[1957:1969]); 

hgII_DOC_fM<-hgII_DOC/200.59*10^6

# k_photooxidation = k_photoreduction * [k_photooxidation / k_photoreduction]* [(f_Hg0_diss + f_Hg0_DOC) /f_HgII_DOC ]


out_red_1_d  <-fotored$Oxic1; mean(out_red_1_d);
out_ox_1_d <-fotored$Oxic1*(kox/kred)*(fDOChg2); mean(out_ox_1_d)
out_dem_1_d <-fotodem$Oxic1; mean(out_dem_1_d[1900:1968])

rr<-(HgII_kmols)*out_red_1_d*365
mean(rr[1957:1968])
oo<-Hg0_kmols1*out_ox_1_d*365
mean(oo[1957:1968])
dmt<-(MeHg_kmols1)*out_dem_1_d*365
mean(dmt[1957:1968])


HgII_DOC_kmols*out_red_ugm3_d*365


kmol_d<-(skred*12)
kmol_y<-kmol_d*365

skred_ugd<-(fotored$Oxic1)*oxic_vol_m3  # ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^6)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

skox_ugd<-(fotored$Oxic1*(kred/kox))*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skox_moly<-skox_ugd*365/(200.59*10^6)
mean(skox_moly[1957:1968]/1000)  #bene ...meglio

mean(skred_moly[1957:1968]/1000)-mean(skox_moly[1957:1968]/1000)

skdem_ugd<-(out_dem_1_d)*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skdem_moly<-skdem_ugd*365/(200.59*10^6)
mean(skdem_moly[1957:1968]/1000)  #bene ...meglio

oxy_vol_L<-oxic_vol_m3*1000
#kred_adj<- LNt_red[1:1968]*fd$V1[1:1968]*kred*(fDOChg*100); mean(kred_adj)  
#mean(out_red_1_d)
#kox_adj<-kred_adj*(kox/kred); mean (kox_adj)
#kdem_adj<- (LNt_red[1:1968]*fd$V1[1:1968]*kdeg*(fDOCmehg*100))
#mean(kdem_adj[1900:1968]/20)  # mia formula qua stima di 20 volte?
#mean(out_dem_1_d[1900:1968])

N_kred_g_day<-out_red_1_d*oxy_vol_L/10^9  
N_kred_moly<-N_kred_g_day*365/200.59
N_kred_moly/1000


kred_g_m3_day<-(out_red_1_d*hgII)
kred_g_day<-kred_g_m3_day*5.9*10^12
kred_mol_y__<-kred_g_day*365/200.9

mean(kred_mol_y__[1957:1968])/1000

kox_mol_day<-(out_ox_1_d*Hg0_pmols1)/10^12; mean(kox_mol_day)
kdem_mol_day<-(out_dem_1_d*MeHg_pmols)/10^12; mean(kdem_mol_day)

out_red_g_d<-out_red_g_m3_d*5.9*10^12
out_red_mol_y<-out_red_g_d*365/200.9
mean(out_red_mol_y[1957:1968])/1000

# kmol trasformate all'anno
fotored_kmols_y<-kred_mol_day*365/1000; mean(fotored_kmols_y)
fotox_kmols_y<-kox_mol_day*365/1000;mean(fotox_kmols_y)
fotodem_kmols_y<- kdem_mol_day*365/1000;mean(fotodem_kmols_y)

mean(fotored_kmols_y[1957:1968])
mean(fotox_kmols_y[1957:1968])
mean(fotodem_kmols_y[1957:1968])

#FOTORIDUZIONE

fotored_1_s <-(fotored$Oxic1/(24*60*60))
fotox_1_s   <-(out_ox_1_d/(24*60*60)) 
fotodem_1_s <-(fotodem$Oxic1/(24*60*60))

fotored_kmols_y_media<-tapply(fotored_kmols_y,rep(1:(length(fotored_kmols_y)/12), each = 12), mean)
mean(fotored_kmols_y_media)
#FOTOSSIDAZIONE
fotox_kmols_y_media<-tapply(fotox_kmols_y,rep(1:(length(fotox_kmols_y)/12), each = 12), mean)
fotox_kmols_y_media<-as.numeric(fotox_kmols_y_media); mean(fotox_kmols_y_media)
#FOTODEG
fotodem_kmols_y_media<-tapply(fotodem_kmols_y,rep(1:(length(fotodem_kmols_y)/12), each = 12), mean)
fotodem_kmols_y_media<-as.numeric(fotodem_kmols_y_media)
mean(fotodem_kmols_y_media)

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


output_kmol_y_media<-cbind(fotox_kmols_y_media, fotored_kmols_y_media*100, 
                           fotodem_kmols_y_media,
                           Hg0_pM_media1, HgII_pM_media, mehg_pM_media, fotored_1_s_media,
                           ef_red_media, fotox_1_s_media, ef_ox_media,fotodem_1_s_media, ef_deg_media)

fotox_kmols_y_media - (fotored_kmols_y_media)
write.csv(output_kmol_y, file="A_fotoreazioni1_2050.csv")
write.csv(output_kmol_y_media , file="A_fotoreazioni_media1_2050.csv")








#VOLATILIZZAZIONE
H<-7.1*10^-3     # Henry's Law constant  
R<-8.206*10^-5   # Universal Gas constant  8.206??0-5 atm/molar-K
Tk<-288.15       # 15^C
divisore<-H/(R*Tk)

kvol_1_day_all<-evasion$Oxic1  # kvol ogni sim
tail(kvol_1_day_all)

kvol_1_day<-kvol_1_day_all #media kvol tutte sim

hg0_media_globale_pM<-Hg0_pM1

tail(hg0_media_globale_pM)
hg0_media_globale_ngL<-(hg0_media_globale_pM*200.59)/1000  #media Hg0 in ng/L (per conti)
hg0_g_m3<-hg0_media_globale_ngL/10^6; summary(hg0_g_m3)    #media Hg0 in g/m3

skvol<-kvol_1_day*(hg0_g_m3 - (atm_hg0/divisore))
#g/m3 day
volat_g_y<-skvol*oxic_vol_m3*365;
volat1_kmol_y<-volat_g_y/(200.59*1000); plot(volat1_kmol_y, type="l")

Volat1_kmol_y_media<-tapply(volat1_kmol_y,rep(1:(length(volat1_kmol_y)/12), each = 12),
                            mean); Volat1_kmol_y_media<-as.numeric(Volat1_kmol_y_media)
#str(atm_hg0)
#vol_2013<-rep(Volat1_kmol_y_media[164],36)
#Volat1_kmol_y_media<-c(Volat1_kmol_y_media,vol_2013)

Volat1_kmol_y_media<-Volat1_kmol_y_media
plot(tail(volat1_kmol_y,24), type="l"); 

volat1_kmol_y_cumul<-cumsum(Volat1_kmol_y_media); volat1_kmol_y_cumul<-as.numeric(volat1_kmol_y_cumul)
plot(volat1_kmol_y_cumul, type="l")

volatile<-data.frame(Volat1_kmol_y_media, volat1_kmol_y_cumul); str(volatile)
write.csv(volatile, file="volat_media_e_cum_2050.csv")
write.csv(volat1_kmol_y, file="volat_kmoly_2050.csv", row.names=F)

mean(tail(volat1_kmol_y,12), type="l"); 

plot(head(hg0_g_m3,24), type="l", col="blue", lwd=2)
par(new=TRUE)
plot(head(skvol,24), type="l")
par(new=TRUE)
plot(head(kvol_1_day,24), type="l", col='red')

#VOLATILIZZAZIONE2
hg0_res<- Hg0_pM1*oxic_vol_m3*1000
vvol_pM_day<-kvol_1_day*hg0_res

vvol_kmol_y<-vvol_pM_day*365/10^15
(vvol_kmol_y[1957:1968])

vvol_kmol_y_media<-tapply(vvol_kmol_y,rep(1:(length(vvol_kmol_y)/12), each = 12),
                          mean)

plot(tail(vvol_kmol_y_media,24), type="l"); 
plot(vvol_kmol_y_media, type="l"); 

Volat1_kmol_y_media[164];vvol_kmol_y_media[164]


setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin

evasion<-read.csv("Volatilization_Loss_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(evasion)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
evasion<-evasion [2:2413,1:13]
str(evasion)
cCC<-tail(evasion)

hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
str(hg$Oxic1)
hg<-hg [2:2413,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1, sep = ",")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,1:13]
str(hgT)
solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
solids<-solids [2:2413,1:13]

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-Phg [2:2413,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg [2:2413,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg [2:2413,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg [2:2413,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0 [2:2413,1:13]

dhg0<-read.csv("Dissolved_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(dhg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
dhg0<-dhg0 [2:2413,1:13]

DOChg0<-read.csv("DOC_Sorbed_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg0<-DOChg0 [2:2413,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehgT<-mehgT [2:2413,1:13]

fotored<-read.csv("Photo_Reduction_Divalent_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotored)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2");
fotored<-fotored [2:2413,1:13]
fotodem<-read.csv("Photo_Demethylation_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotodem)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
fotodem<-fotodem [2:2413,1:13]

silt<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3","Sed1","Sed2")
silt<-silt [2:2413,1:13]

POM<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
              "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
              "Anoxic3","Sed1","Sed2")
POM<-POM [2:2413,1:13]
str(POM$Time)

oxic_vol_m3<-5.9E+12
oxy_vol_L<-oxic_vol_m3*1000
Model_area  <-2.961E+11

time.steps <- hgT$Time     # leggo model timestep 
time.steps <- trunc(time.steps, 0)
time.steps <- time.steps*24*3600   # trasformo in sec
TEMPO <- as.POSIXct(time.steps, tz= "GMT", origin = "1850-01-01") # creo la var tempo
TEMPO[1:10]  # stringa con date
rdate1<-as.Date(TEMPO, tz= "GMT", format="%Y") #creo rdate1 (per  xlab)

#------- calcolo frazioni DOC complexed
siltOL<-silt$Oxic1/10^6
POMOL<-POM$Oxic1/10^6

fDOChg2   <-DOChg$Oxic1/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg, na.rm=TRUE);plot(fDOChg*100)
fDOChg <- (10^3*(2.9*10^-6))/(1+(10^3*(2.9*10^-6))+((siltOL*3000)+(POMOL*(5.1*10^5))))
#uguale a primam
fDOCmehg <-DOCmehg$Oxic1/mehgT$Oxic1
fDOChg0  <-DOChg0$Oxic1/hg0$Oxic1
fdhg0    <-dhg0$Oxic1/hg0$Oxic1

fdisshg2   <-(DOChg$Oxic1+hg$Oxic1)/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg2, na.rm=TRUE);plot(fDOChg*100)

#-------- conc Hg species pM
Hg0_pM1<-hg0$Oxic1/200.59*1000; mean(hg0$Oxic1)
Hg0_pmols1<-Hg0_pM1*oxic_vol_L  # bulk of Hg0 in upper oxic layer
Hg0_kmols1<-Hg0_pmols1/10^15
mean(Hg0_kmols1[1957:1968])
mean(Hg0_pM1[1957:1968])

mehg_<-mehgT$Oxic1              
mehg_pM<-mehg_/215*1000
MeHg_pmols<-mehg_pM*oxic_vol_L    # bulk of MeHg in upper oxic layer
MeHg_kmols1<-MeHg_pmols/10^15
mean(MeHg_kmols1[1957:1968])
mean(mehg_pM[1957:1968])

fDOChg2

hgII_DOC<-DOChg$Oxic1 # ngL total HgII (diss, DOC, part)
hgII_tot<-(hg$Oxic1+DOChg$Oxic1+Phg$Oxic1)
hgII_DOC/hgII_tot*100

hgII_DOC_pM<-hgII_DOC/200.59*1000
hgII_DOC_pmols <-hgII_DOC_pM*oxic_vol_L
HgII_DOC_kmols<-hgII_DOC_pmols/10^15

HgII_pM<-hgII_tot/200.59*1000              # pM

HgII_pmols<-HgII_pM*oxic_vol_L          # bulk of HgII in oxic layer

HgII_kmols<-HgII_pmols/10^15
mean(HgII_kmols1[1957:1968])
mean(HgII_pM[1957:1968])

HgP_pM<-Phg$Oxic1/200.59*1000; 
HgP_pmols1<-HgP_pM*oxic_vol_L  # bulk of Hg0 in upper oxic layer
HgP_kmols1<-HgP_pmols1/10^15

hgT<-hgT$Oxic1 # total Hg 
hgI<-(hgT-mehg_-hg0$Oxic1)/200.59*1000
hgI_pmols<-hgI*oxic_vol_L  # bulk of HgII in upper oxic layer

hgDOC<-(DOChg$Oxic1) 
hgDOC<-(DOChg$Oxic1) 

# ngL total HgII (diss, DOC, part)
HgDOC_pM<-hgDOC/200.59*1000              # pM
HgDOC_pmols<-HgDOC_pM*oxic_vol_L          # bulk of HgII in oxic layer

hgII_ngL<-hgII
hg0_ngL<-hg0$Oxic1
mehg_ngL<-mehgT$Oxic1

plot(Hg0_kmols1[1950:2029])
#mean(hg0_g_m3/hgII_g_m3*100) #hg0 %
# ---------
## [(f_Hg0_diss + f_Hg0_DOC) / f_HgII_DOC]
ef_red <-fotored_1_s/fdisshg2 ; mean(ef_red*60*60*24) 
mean(ef_red)# quindi questo dovrebbe restituire il tasso in input +  o meno
ef_ox  <-fotox_1_s  /fDOChg        ;  mean(ef_ox*60*60*24)
ef_deg <-fotodem_1_s/fDOCmehg;     mean(ef_deg*60*60*24)
# --------- fotoreactions out [1/d] /84600 -> 1/s; 
# --------- those rate are given by someting as -> kdeg (1/d) * fDOCmehg (-) adjusted for light intensity
#  
#    skred = kred *LN(t) * [xdOC*hgII] * 10^-6
ke<-0.2        #extintion coeff
e<-2.71828     #nepero 
d<-20 
fd<-0.42      #fraction daylight
fac1<-ke*d
#box depth
L_ref<-170
ekde<-e^-fac1
plot(ekde)
LNt_red<-(light_sur_w_m2/L_ref)*((1-ekde)/(fac1))
#str(LNt_red)
#plot(LNt_red[12:24], type='l')


skred = kred *LNt_red*fd*fdisshg2*hgT$Oxic1

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);

skred_ugd<-skred*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^8)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

plot(hg0_ngL)
mean( hg0_ngL[1957:1968])
mean( hg0_ngL[1977:1988])
mean( hg0_ngL[1977:1988])

skred_b = kred *LNt_red * (fDOChg2*hgII_tot)


skred_1 = kred *LNt_red* fDOChg2*fd *hgII_tot

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);  mean(skred_b[1957:1969]);mean(skred_1[1957:1969]);


skox = kox *LNt_red*fd
10^-2 ug d-1
mean(out_ox_1_d[1957:1969]);mean(skox[1957:1969]); 

hgII_DOC_fM<-hgII_DOC/200.59*10^6

# k_photooxidation = k_photoreduction * [k_photooxidation / k_photoreduction]* [(f_Hg0_diss + f_Hg0_DOC) /f_HgII_DOC ]


out_red_1_d  <-fotored$Oxic1; mean(out_red_1_d);
out_ox_1_d <-fotored$Oxic1*(kox/kred)*(fDOChg2); mean(out_ox_1_d)
out_dem_1_d <-fotodem$Oxic1; mean(out_dem_1_d[1900:1968])

rr<-(HgII_kmols)*out_red_1_d*365
mean(rr[1957:1968])
oo<-Hg0_kmols1*out_ox_1_d*365
mean(oo[1957:1968])
dmt<-(MeHg_kmols1)*out_dem_1_d*365
mean(dmt[1957:1968])


HgII_DOC_kmols*out_red_ugm3_d*365


kmol_d<-(skred*12)
kmol_y<-kmol_d*365

skred_ugd<-(fotored$Oxic1)*oxic_vol_m3  # ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^6)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

skox_ugd<-(fotored$Oxic1*(kred/kox))*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skox_moly<-skox_ugd*365/(200.59*10^6)
mean(skox_moly[1957:1968]/1000)  #bene ...meglio

mean(skred_moly[1957:1968]/1000)-mean(skox_moly[1957:1968]/1000)

skdem_ugd<-(out_dem_1_d)*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skdem_moly<-skdem_ugd*365/(200.59*10^6)
mean(skdem_moly[1957:1968]/1000)  #bene ...meglio

oxy_vol_L<-oxic_vol_m3*1000
#kred_adj<- LNt_red[1:1968]*fd$V1[1:1968]*kred*(fDOChg*100); mean(kred_adj)  
#mean(out_red_1_d)
#kox_adj<-kred_adj*(kox/kred); mean (kox_adj)
#kdem_adj<- (LNt_red[1:1968]*fd$V1[1:1968]*kdeg*(fDOCmehg*100))
#mean(kdem_adj[1900:1968]/20)  # mia formula qua stima di 20 volte?
#mean(out_dem_1_d[1900:1968])

N_kred_g_day<-out_red_1_d*oxy_vol_L/10^9  
N_kred_moly<-N_kred_g_day*365/200.59
N_kred_moly/1000


kred_g_m3_day<-(out_red_1_d*hgII)
kred_g_day<-kred_g_m3_day*5.9*10^12
kred_mol_y__<-kred_g_day*365/200.9

mean(kred_mol_y__[1957:1968])/1000

kox_mol_day<-(out_ox_1_d*Hg0_pmols1)/10^12; mean(kox_mol_day)
kdem_mol_day<-(out_dem_1_d*MeHg_pmols)/10^12; mean(kdem_mol_day)

out_red_g_d<-out_red_g_m3_d*5.9*10^12
out_red_mol_y<-out_red_g_d*365/200.9
mean(out_red_mol_y[1957:1968])/1000

# kmol trasformate all'anno
fotored_kmols_y<-kred_mol_day*365/1000; mean(fotored_kmols_y)
fotox_kmols_y<-kox_mol_day*365/1000;mean(fotox_kmols_y)
fotodem_kmols_y<- kdem_mol_day*365/1000;mean(fotodem_kmols_y)

mean(fotored_kmols_y[1957:1968])
mean(fotox_kmols_y[1957:1968])
mean(fotodem_kmols_y[1957:1968])

#FOTORIDUZIONE

fotored_1_s <-(fotored$Oxic1/(24*60*60))
fotox_1_s   <-(out_ox_1_d/(24*60*60)) 
fotodem_1_s <-(fotodem$Oxic1/(24*60*60))

fotored_kmols_y_media<-tapply(fotored_kmols_y,rep(1:(length(fotored_kmols_y)/12), each = 12), mean)
mean(fotored_kmols_y_media)
#FOTOSSIDAZIONE
fotox_kmols_y_media<-tapply(fotox_kmols_y,rep(1:(length(fotox_kmols_y)/12), each = 12), mean)
fotox_kmols_y_media<-as.numeric(fotox_kmols_y_media); mean(fotox_kmols_y_media)
#FOTODEG
fotodem_kmols_y_media<-tapply(fotodem_kmols_y,rep(1:(length(fotodem_kmols_y)/12), each = 12), mean)
fotodem_kmols_y_media<-as.numeric(fotodem_kmols_y_media)
mean(fotodem_kmols_y_media)

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


output_kmol_y_media<-cbind(fotox_kmols_y_media, fotored_kmols_y_media*100, 
                           fotodem_kmols_y_media,
                           Hg0_pM_media1, HgII_pM_media, mehg_pM_media, fotored_1_s_media,
                           ef_red_media, fotox_1_s_media, ef_ox_media,fotodem_1_s_media, ef_deg_media)

fotox_kmols_y_media - (fotored_kmols_y_media)
write.csv(output_kmol_y, file="A_fotoreazioni1_2050.csv")
write.csv(output_kmol_y_media , file="A_fotoreazioni_media1_2050.csv")


kvol_1_day_all<-evasion$Oxic1  # kvol ogni sim
tail(kvol_1_day_all)

kvol_1_day<-kvol_1_day_all #media kvol tutte sim

hg0_media_globale_pM<-Hg0_pM1

tail(hg0_media_globale_pM)
hg0_media_globale_ngL<-(hg0_media_globale_pM*200.59)/1000  #media Hg0 in ng/L (per conti)
hg0_g_m3<-hg0_media_globale_ngL/10^6; summary(hg0_g_m3)    #media Hg0 in g/m3

skvol<-kvol_1_day*(hg0_g_m3 - (atm_hg0/divisore))
#g/m3 day
volat_g_y<-skvol*oxic_vol_m3*365;
volat1_kmol_y<-volat_g_y/(200.59*1000); plot(volat1_kmol_y, type="l")

Volat1_kmol_y_media<-tapply(volat1_kmol_y,rep(1:(length(volat1_kmol_y)/12), each = 12),
                            mean); Volat1_kmol_y_media<-as.numeric(Volat1_kmol_y_media)
#str(atm_hg0)
#vol_2013<-rep(Volat1_kmol_y_media[164],36)
#Volat1_kmol_y_media<-c(Volat1_kmol_y_media,vol_2013)

Volat1_kmol_y_media<-Volat1_kmol_y_media
plot(tail(volat1_kmol_y,24), type="l"); 

volat1_kmol_y_cumul<-cumsum(Volat1_kmol_y_media); volat1_kmol_y_cumul<-as.numeric(volat1_kmol_y_cumul)
plot(volat1_kmol_y_cumul, type="l")

volatile<-data.frame(Volat1_kmol_y_media, volat1_kmol_y_cumul); str(volatile)
write.csv(volatile, file="volat_media_e_cum_2050.csv")
write.csv(volat1_kmol_y, file="volat_kmoly_2050.csv", row.names=F)

mean(tail(volat1_kmol_y,12), type="l"); 

plot(head(hg0_g_m3,24), type="l", col="blue", lwd=2)
par(new=TRUE)
plot(head(skvol,24), type="l")
par(new=TRUE)
plot(head(kvol_1_day,24), type="l", col='red')

#VOLATILIZZAZIONE2
hg0_res<- Hg0_pM1*oxic_vol_m3*1000
vvol_pM_day<-kvol_1_day*hg0_res

vvol_kmol_y<-vvol_pM_day*365/10^15
(vvol_kmol_y[1957:1968])

vvol_kmol_y_media<-tapply(vvol_kmol_y,rep(1:(length(vvol_kmol_y)/12), each = 12),
                          mean)

plot(tail(vvol_kmol_y_media,24), type="l"); 
plot(vvol_kmol_y_media, type="l"); 

Volat1_kmol_y_media[164];vvol_kmol_y_media[164]

setwd('C:/Users/gi/Google Drive/MERCURIO/BlackSea/implementazione')
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale2')

atm_hg<-read.table("atm_hg.txt", header = F); str(atm_hg)
atm_hg0<-atm_hg$V1   # --- atm conc of hg0 -
str(atm_hg0)
atm_hg0

light<-read.table("light_norm.txt", header = TRUE); names(light)<-'light' ; light_sur<-light$light
light_sur_w_m2<-read.table("light_w_m2.txt", header = TRUE); light_sur_w_m2<-light_sur_w_m2$wm2
fd<-read.table("frac_day.txt", header = F); 

kred<-0.16
kox<-0.57
kdeg<-3E-3

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim1')#Fminmin

evasion<-read.csv("Volatilization_Loss_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(evasion)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
evasion<-evasion [2:2413,1:13]
str(evasion)
cCC<-tail(evasion)

hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
str(hg$Oxic1)
hg<-hg [2:2413,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1, sep = ",")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,1:13]
str(hgT)
solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
solids<-solids [2:2413,1:13]

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-Phg [2:2413,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg [2:2413,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg [2:2413,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg [2:2413,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0 [2:2413,1:13]

dhg0<-read.csv("Dissolved_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(dhg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
dhg0<-dhg0 [2:2413,1:13]

DOChg0<-read.csv("DOC_Sorbed_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg0<-DOChg0 [2:2413,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehgT<-mehgT [2:2413,1:13]

fotored<-read.csv("Photo_Reduction_Divalent_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotored)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2");
fotored<-fotored [2:2413,1:13]
fotodem<-read.csv("Photo_Demethylation_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotodem)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
fotodem<-fotodem [2:2413,1:13]

silt<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3","Sed1","Sed2")
silt<-silt [2:2413,1:13]

POM<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
              "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
              "Anoxic3","Sed1","Sed2")
POM<-POM [2:2413,1:13]
str(POM$Time)

oxic_vol_m3<-5.9E+12
oxy_vol_L<-oxic_vol_m3*1000
Model_area  <-2.961E+11

time.steps <- hgT$Time     # leggo model timestep 
time.steps <- trunc(time.steps, 0)
time.steps <- time.steps*24*3600   # trasformo in sec
TEMPO <- as.POSIXct(time.steps, tz= "GMT", origin = "1850-01-01") # creo la var tempo
TEMPO[1:10]  # stringa con date
rdate1<-as.Date(TEMPO, tz= "GMT", format="%Y") #creo rdate1 (per  xlab)

#------- calcolo frazioni DOC complexed
siltOL<-silt$Oxic1/10^6
POMOL<-POM$Oxic1/10^6

fDOChg2   <-DOChg$Oxic1/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg, na.rm=TRUE);plot(fDOChg*100)
fDOChg <- (10^3*(2.9*10^-6))/(1+(10^3*(2.9*10^-6))+((siltOL*3000)+(POMOL*(5.1*10^5))))
#uguale a primam
fDOCmehg <-DOCmehg$Oxic1/mehgT$Oxic1
fDOChg0  <-DOChg0$Oxic1/hg0$Oxic1
fdhg0    <-dhg0$Oxic1/hg0$Oxic1

fdisshg2   <-(DOChg$Oxic1+hg$Oxic1)/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg2, na.rm=TRUE);plot(fDOChg*100)

#-------- conc Hg species pM
Hg0_pM1<-hg0$Oxic1/200.59*1000; mean(hg0$Oxic1)
Hg0_pmols1<-Hg0_pM1*oxic_vol_L  # bulk of Hg0 in upper oxic layer
Hg0_kmols1<-Hg0_pmols1/10^15
mean(Hg0_kmols1[1957:1968])
mean(Hg0_pM1[1957:1968])

mehg_<-mehgT$Oxic1              
mehg_pM<-mehg_/215*1000
MeHg_pmols<-mehg_pM*oxic_vol_L    # bulk of MeHg in upper oxic layer
MeHg_kmols1<-MeHg_pmols/10^15
mean(MeHg_kmols1[1957:1968])
mean(mehg_pM[1957:1968])

fDOChg2

hgII_DOC<-DOChg$Oxic1 # ngL total HgII (diss, DOC, part)
hgII_tot<-(hg$Oxic1+DOChg$Oxic1+Phg$Oxic1)
hgII_DOC/hgII_tot*100

hgII_DOC_pM<-hgII_DOC/200.59*1000
hgII_DOC_pmols <-hgII_DOC_pM*oxic_vol_L
HgII_DOC_kmols<-hgII_DOC_pmols/10^15

HgII_pM<-hgII_tot/200.59*1000              # pM

HgII_pmols<-HgII_pM*oxic_vol_L          # bulk of HgII in oxic layer

HgII_kmols<-HgII_pmols/10^15
mean(HgII_kmols1[1957:1968])
mean(HgII_pM[1957:1968])

HgP_pM<-Phg$Oxic1/200.59*1000; 
HgP_pmols1<-HgP_pM*oxic_vol_L  # bulk of Hg0 in upper oxic layer
HgP_kmols1<-HgP_pmols1/10^15

hgT<-hgT$Oxic1 # total Hg 
hgI<-(hgT-mehg_-hg0$Oxic1)/200.59*1000
hgI_pmols<-hgI*oxic_vol_L  # bulk of HgII in upper oxic layer

hgDOC<-(DOChg$Oxic1) 
hgDOC<-(DOChg$Oxic1) 

# ngL total HgII (diss, DOC, part)
HgDOC_pM<-hgDOC/200.59*1000              # pM
HgDOC_pmols<-HgDOC_pM*oxic_vol_L          # bulk of HgII in oxic layer

hgII_ngL<-hgII
hg0_ngL<-hg0$Oxic1
mehg_ngL<-mehgT$Oxic1

plot(Hg0_kmols1[1950:2029])
#mean(hg0_g_m3/hgII_g_m3*100) #hg0 %
# ---------
## [(f_Hg0_diss + f_Hg0_DOC) / f_HgII_DOC]
ef_red <-fotored_1_s/fdisshg2 ; mean(ef_red*60*60*24) 
mean(ef_red)# quindi questo dovrebbe restituire il tasso in input +  o meno
ef_ox  <-fotox_1_s  /fDOChg        ;  mean(ef_ox*60*60*24)
ef_deg <-fotodem_1_s/fDOCmehg;     mean(ef_deg*60*60*24)
# --------- fotoreactions out [1/d] /84600 -> 1/s; 
# --------- those rate are given by someting as -> kdeg (1/d) * fDOCmehg (-) adjusted for light intensity
#  
#    skred = kred *LN(t) * [xdOC*hgII] * 10^-6
ke<-0.2        #extintion coeff
e<-2.71828     #nepero 
d<-20 
fd<-0.42      #fraction daylight
fac1<-ke*d
#box depth
L_ref<-170
ekde<-e^-fac1
plot(ekde)
LNt_red<-(light_sur_w_m2/L_ref)*((1-ekde)/(fac1))
#str(LNt_red)
#plot(LNt_red[12:24], type='l')


skred = kred *LNt_red*fd*fdisshg2*hgT$Oxic1

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);

skred_ugd<-skred*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^8)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

plot(hg0_ngL)
mean( hg0_ngL[1957:1968])
mean( hg0_ngL[1977:1988])
mean( hg0_ngL[1977:1988])

skred_b = kred *LNt_red * (fDOChg2*hgII_tot)


skred_1 = kred *LNt_red* fDOChg2*fd *hgII_tot

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);  mean(skred_b[1957:1969]);mean(skred_1[1957:1969]);


skox = kox *LNt_red*fd
10^-2 ug d-1
mean(out_ox_1_d[1957:1969]);mean(skox[1957:1969]); 

hgII_DOC_fM<-hgII_DOC/200.59*10^6

# k_photooxidation = k_photoreduction * [k_photooxidation / k_photoreduction]* [(f_Hg0_diss + f_Hg0_DOC) /f_HgII_DOC ]


out_red_1_d  <-fotored$Oxic1; mean(out_red_1_d);
out_ox_1_d <-fotored$Oxic1*(kox/kred)*(fDOChg2); mean(out_ox_1_d)
out_dem_1_d <-fotodem$Oxic1; mean(out_dem_1_d[1900:1968])

rr<-(HgII_kmols)*out_red_1_d*365
mean(rr[1957:1968])
oo<-Hg0_kmols1*out_ox_1_d*365
mean(oo[1957:1968])
dmt<-(MeHg_kmols1)*out_dem_1_d*365
mean(dmt[1957:1968])


HgII_DOC_kmols*out_red_ugm3_d*365


kmol_d<-(skred*12)
kmol_y<-kmol_d*365

skred_ugd<-(fotored$Oxic1)*oxic_vol_m3  # ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^6)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

skox_ugd<-(fotored$Oxic1*(kred/kox))*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skox_moly<-skox_ugd*365/(200.59*10^6)
mean(skox_moly[1957:1968]/1000)  #bene ...meglio

mean(skred_moly[1957:1968]/1000)-mean(skox_moly[1957:1968]/1000)

skdem_ugd<-(out_dem_1_d)*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skdem_moly<-skdem_ugd*365/(200.59*10^6)
mean(skdem_moly[1957:1968]/1000)  #bene ...meglio

oxy_vol_L<-oxic_vol_m3*1000
#kred_adj<- LNt_red[1:1968]*fd$V1[1:1968]*kred*(fDOChg*100); mean(kred_adj)  
#mean(out_red_1_d)
#kox_adj<-kred_adj*(kox/kred); mean (kox_adj)
#kdem_adj<- (LNt_red[1:1968]*fd$V1[1:1968]*kdeg*(fDOCmehg*100))
#mean(kdem_adj[1900:1968]/20)  # mia formula qua stima di 20 volte?
#mean(out_dem_1_d[1900:1968])

N_kred_g_day<-out_red_1_d*oxy_vol_L/10^9  
N_kred_moly<-N_kred_g_day*365/200.59
N_kred_moly/1000


kred_g_m3_day<-(out_red_1_d*hgII)
kred_g_day<-kred_g_m3_day*5.9*10^12
kred_mol_y__<-kred_g_day*365/200.9

mean(kred_mol_y__[1957:1968])/1000

kox_mol_day<-(out_ox_1_d*Hg0_pmols1)/10^12; mean(kox_mol_day)
kdem_mol_day<-(out_dem_1_d*MeHg_pmols)/10^12; mean(kdem_mol_day)

out_red_g_d<-out_red_g_m3_d*5.9*10^12
out_red_mol_y<-out_red_g_d*365/200.9
mean(out_red_mol_y[1957:1968])/1000

# kmol trasformate all'anno
fotored_kmols_y<-kred_mol_day*365/1000; mean(fotored_kmols_y)
fotox_kmols_y<-kox_mol_day*365/1000;mean(fotox_kmols_y)
fotodem_kmols_y<- kdem_mol_day*365/1000;mean(fotodem_kmols_y)

mean(fotored_kmols_y[1957:1968])
mean(fotox_kmols_y[1957:1968])
mean(fotodem_kmols_y[1957:1968])

#FOTORIDUZIONE

fotored_1_s <-(fotored$Oxic1/(24*60*60))
fotox_1_s   <-(out_ox_1_d/(24*60*60)) 
fotodem_1_s <-(fotodem$Oxic1/(24*60*60))

fotored_kmols_y_media<-tapply(fotored_kmols_y,rep(1:(length(fotored_kmols_y)/12), each = 12), mean)
mean(fotored_kmols_y_media)
#FOTOSSIDAZIONE
fotox_kmols_y_media<-tapply(fotox_kmols_y,rep(1:(length(fotox_kmols_y)/12), each = 12), mean)
fotox_kmols_y_media<-as.numeric(fotox_kmols_y_media); mean(fotox_kmols_y_media)
#FOTODEG
fotodem_kmols_y_media<-tapply(fotodem_kmols_y,rep(1:(length(fotodem_kmols_y)/12), each = 12), mean)
fotodem_kmols_y_media<-as.numeric(fotodem_kmols_y_media)
mean(fotodem_kmols_y_media)

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


output_kmol_y_media<-cbind(fotox_kmols_y_media, fotored_kmols_y_media*100, 
                           fotodem_kmols_y_media,
                           Hg0_pM_media1, HgII_pM_media, mehg_pM_media, fotored_1_s_media,
                           ef_red_media, fotox_1_s_media, ef_ox_media,fotodem_1_s_media, ef_deg_media)

fotox_kmols_y_media - (fotored_kmols_y_media)
write.csv(output_kmol_y, file="A_fotoreazioni1_2050.csv")
write.csv(output_kmol_y_media , file="A_fotoreazioni_media1_2050.csv")








#VOLATILIZZAZIONE
H<-7.1*10^-3     # Henry's Law constant  
R<-8.206*10^-5   # Universal Gas constant  8.206??0-5 atm/molar-K
Tk<-288.15       # 15^C
divisore<-H/(R*Tk)

kvol_1_day_all<-evasion$Oxic1  # kvol ogni sim
tail(kvol_1_day_all)

kvol_1_day<-kvol_1_day_all #media kvol tutte sim

hg0_media_globale_pM<-Hg0_pM1

tail(hg0_media_globale_pM)
hg0_media_globale_ngL<-(hg0_media_globale_pM*200.59)/1000  #media Hg0 in ng/L (per conti)
hg0_g_m3<-hg0_media_globale_ngL/10^6; summary(hg0_g_m3)    #media Hg0 in g/m3

skvol<-kvol_1_day*(hg0_g_m3 - (atm_hg0/divisore))
#g/m3 day
volat_g_y<-skvol*oxic_vol_m3*365;
volat1_kmol_y<-volat_g_y/(200.59*1000); plot(volat1_kmol_y, type="l")

Volat1_kmol_y_media<-tapply(volat1_kmol_y,rep(1:(length(volat1_kmol_y)/12), each = 12),
                            mean); Volat1_kmol_y_media<-as.numeric(Volat1_kmol_y_media)
#str(atm_hg0)
#vol_2013<-rep(Volat1_kmol_y_media[164],36)
#Volat1_kmol_y_media<-c(Volat1_kmol_y_media,vol_2013)

Volat1_kmol_y_media<-Volat1_kmol_y_media
plot(tail(volat1_kmol_y,24), type="l"); 

volat1_kmol_y_cumul<-cumsum(Volat1_kmol_y_media); volat1_kmol_y_cumul<-as.numeric(volat1_kmol_y_cumul)
plot(volat1_kmol_y_cumul, type="l")

volatile<-data.frame(Volat1_kmol_y_media, volat1_kmol_y_cumul); str(volatile)
write.csv(volatile, file="volat_media_e_cum_2050.csv")
write.csv(volat1_kmol_y, file="volat_kmoly_2050.csv", row.names=F)

mean(tail(volat1_kmol_y,12), type="l"); 

plot(head(hg0_g_m3,24), type="l", col="blue", lwd=2)
par(new=TRUE)
plot(head(skvol,24), type="l")
par(new=TRUE)
plot(head(kvol_1_day,24), type="l", col='red')

#VOLATILIZZAZIONE2
hg0_res<- Hg0_pM1*oxic_vol_m3*1000
vvol_pM_day<-kvol_1_day*hg0_res

vvol_kmol_y<-vvol_pM_day*365/10^15
(vvol_kmol_y[1957:1968])

vvol_kmol_y_media<-tapply(vvol_kmol_y,rep(1:(length(vvol_kmol_y)/12), each = 12),
                          mean)

plot(tail(vvol_kmol_y_media,24), type="l"); 
plot(vvol_kmol_y_media, type="l"); 

Volat1_kmol_y_media[164];vvol_kmol_y_media[164]

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
evasion<-read.csv("Volatilization_Loss_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(evasion)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
evasion<-evasion [2:2413,1:13]
str(evasion)
cCC<-tail(evasion)

hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
str(hg$Oxic1)
hg<-hg [2:2413,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1, sep = ",")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,1:13]
str(hgT)
solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
solids<-solids [2:2413,1:13]

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-Phg [2:2413,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg [2:2413,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg [2:2413,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg [2:2413,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0 [2:2413,1:13]

dhg0<-read.csv("Dissolved_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(dhg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
dhg0<-dhg0 [2:2413,1:13]

DOChg0<-read.csv("DOC_Sorbed_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg0<-DOChg0 [2:2413,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehgT<-mehgT [2:2413,1:13]

fotored<-read.csv("Photo_Reduction_Divalent_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotored)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2");
fotored<-fotored [2:2413,1:13]
fotodem<-read.csv("Photo_Demethylation_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotodem)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
fotodem<-fotodem [2:2413,1:13]

silt<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3","Sed1","Sed2")
silt<-silt [2:2413,1:13]

POM<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
              "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
              "Anoxic3","Sed1","Sed2")
POM<-POM [2:2413,1:13]
str(POM$Time)

oxic_vol_m3<-5.9E+12
oxy_vol_L<-oxic_vol_m3*1000
Model_area  <-2.961E+11

time.steps <- hgT$Time     # leggo model timestep 
time.steps <- trunc(time.steps, 0)
time.steps <- time.steps*24*3600   # trasformo in sec
TEMPO <- as.POSIXct(time.steps, tz= "GMT", origin = "1850-01-01") # creo la var tempo
TEMPO[1:10]  # stringa con date
rdate1<-as.Date(TEMPO, tz= "GMT", format="%Y") #creo rdate1 (per  xlab)

#------- calcolo frazioni DOC complexed
siltOL<-silt$Oxic1/10^6
POMOL<-POM$Oxic1/10^6

fDOChg2   <-DOChg$Oxic1/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg, na.rm=TRUE);plot(fDOChg*100)
fDOChg <- (10^3*(2.9*10^-6))/(1+(10^3*(2.9*10^-6))+((siltOL*3000)+(POMOL*(5.1*10^5))))
#uguale a primam
fDOCmehg <-DOCmehg$Oxic1/mehgT$Oxic1
fDOChg0  <-DOChg0$Oxic1/hg0$Oxic1
fdhg0    <-dhg0$Oxic1/hg0$Oxic1

fdisshg2   <-(DOChg$Oxic1+hg$Oxic1)/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg2, na.rm=TRUE);plot(fDOChg*100)

#-------- conc Hg species pM
Hg0_pM1<-hg0$Oxic1/200.59*1000; mean(hg0$Oxic1)
Hg0_pmols1<-Hg0_pM1*oxic_vol_L  # bulk of Hg0 in upper oxic layer
Hg0_kmols1<-Hg0_pmols1/10^15
mean(Hg0_kmols1[1957:1968])
mean(Hg0_pM1[1957:1968])

mehg_<-mehgT$Oxic1              
mehg_pM<-mehg_/215*1000
MeHg_pmols<-mehg_pM*oxic_vol_L    # bulk of MeHg in upper oxic layer
MeHg_kmols1<-MeHg_pmols/10^15
mean(MeHg_kmols1[1957:1968])
mean(mehg_pM[1957:1968])

fDOChg2

hgII_DOC<-DOChg$Oxic1 # ngL total HgII (diss, DOC, part)
hgII_tot<-(hg$Oxic1+DOChg$Oxic1+Phg$Oxic1)
hgII_DOC/hgII_tot*100

hgII_DOC_pM<-hgII_DOC/200.59*1000
hgII_DOC_pmols <-hgII_DOC_pM*oxic_vol_L
HgII_DOC_kmols<-hgII_DOC_pmols/10^15

HgII_pM<-hgII_tot/200.59*1000              # pM

HgII_pmols<-HgII_pM*oxic_vol_L          # bulk of HgII in oxic layer

HgII_kmols<-HgII_pmols/10^15
mean(HgII_kmols1[1957:1968])
mean(HgII_pM[1957:1968])

HgP_pM<-Phg$Oxic1/200.59*1000; 
HgP_pmols1<-HgP_pM*oxic_vol_L  # bulk of Hg0 in upper oxic layer
HgP_kmols1<-HgP_pmols1/10^15

hgT<-hgT$Oxic1 # total Hg 
hgI<-(hgT-mehg_-hg0$Oxic1)/200.59*1000
hgI_pmols<-hgI*oxic_vol_L  # bulk of HgII in upper oxic layer

hgDOC<-(DOChg$Oxic1) 
hgDOC<-(DOChg$Oxic1) 

# ngL total HgII (diss, DOC, part)
HgDOC_pM<-hgDOC/200.59*1000              # pM
HgDOC_pmols<-HgDOC_pM*oxic_vol_L          # bulk of HgII in oxic layer

hgII_ngL<-hgII
hg0_ngL<-hg0$Oxic1
mehg_ngL<-mehgT$Oxic1

plot(Hg0_kmols1[1950:2029])
#mean(hg0_g_m3/hgII_g_m3*100) #hg0 %
# ---------
## [(f_Hg0_diss + f_Hg0_DOC) / f_HgII_DOC]
ef_red <-fotored_1_s/fdisshg2 ; mean(ef_red*60*60*24) 
mean(ef_red)# quindi questo dovrebbe restituire il tasso in input +  o meno
ef_ox  <-fotox_1_s  /fDOChg        ;  mean(ef_ox*60*60*24)
ef_deg <-fotodem_1_s/fDOCmehg;     mean(ef_deg*60*60*24)
# --------- fotoreactions out [1/d] /84600 -> 1/s; 
# --------- those rate are given by someting as -> kdeg (1/d) * fDOCmehg (-) adjusted for light intensity
#  
#    skred = kred *LN(t) * [xdOC*hgII] * 10^-6
ke<-0.2        #extintion coeff
e<-2.71828     #nepero 
d<-20 
fd<-0.42      #fraction daylight
fac1<-ke*d
#box depth
L_ref<-170
ekde<-e^-fac1
plot(ekde)
LNt_red<-(light_sur_w_m2/L_ref)*((1-ekde)/(fac1))
#str(LNt_red)
#plot(LNt_red[12:24], type='l')


skred = kred *LNt_red*fd*fdisshg2*hgT$Oxic1

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);

skred_ugd<-skred*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^8)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

plot(hg0_ngL)
mean( hg0_ngL[1957:1968])
mean( hg0_ngL[1977:1988])
mean( hg0_ngL[1977:1988])

skred_b = kred *LNt_red * (fDOChg2*hgII_tot)


skred_1 = kred *LNt_red* fDOChg2*fd *hgII_tot

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);  mean(skred_b[1957:1969]);mean(skred_1[1957:1969]);


skox = kox *LNt_red*fd
10^-2 ug d-1
mean(out_ox_1_d[1957:1969]);mean(skox[1957:1969]); 

hgII_DOC_fM<-hgII_DOC/200.59*10^6

# k_photooxidation = k_photoreduction * [k_photooxidation / k_photoreduction]* [(f_Hg0_diss + f_Hg0_DOC) /f_HgII_DOC ]


out_red_1_d  <-fotored$Oxic1; mean(out_red_1_d);
out_ox_1_d <-fotored$Oxic1*(kox/kred)*(fDOChg2); mean(out_ox_1_d)
out_dem_1_d <-fotodem$Oxic1; mean(out_dem_1_d[1900:1968])

rr<-(HgII_kmols)*out_red_1_d*365
mean(rr[1957:1968])
oo<-Hg0_kmols1*out_ox_1_d*365
mean(oo[1957:1968])
dmt<-(MeHg_kmols1)*out_dem_1_d*365
mean(dmt[1957:1968])


HgII_DOC_kmols*out_red_ugm3_d*365


kmol_d<-(skred*12)
kmol_y<-kmol_d*365

skred_ugd<-(fotored$Oxic1)*oxic_vol_m3  # ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^6)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

skox_ugd<-(fotored$Oxic1*(kred/kox))*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skox_moly<-skox_ugd*365/(200.59*10^6)
mean(skox_moly[1957:1968]/1000)  #bene ...meglio

mean(skred_moly[1957:1968]/1000)-mean(skox_moly[1957:1968]/1000)

skdem_ugd<-(out_dem_1_d)*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skdem_moly<-skdem_ugd*365/(200.59*10^6)
mean(skdem_moly[1957:1968]/1000)  #bene ...meglio

oxy_vol_L<-oxic_vol_m3*1000
#kred_adj<- LNt_red[1:1968]*fd$V1[1:1968]*kred*(fDOChg*100); mean(kred_adj)  
#mean(out_red_1_d)
#kox_adj<-kred_adj*(kox/kred); mean (kox_adj)
#kdem_adj<- (LNt_red[1:1968]*fd$V1[1:1968]*kdeg*(fDOCmehg*100))
#mean(kdem_adj[1900:1968]/20)  # mia formula qua stima di 20 volte?
#mean(out_dem_1_d[1900:1968])

N_kred_g_day<-out_red_1_d*oxy_vol_L/10^9  
N_kred_moly<-N_kred_g_day*365/200.59
N_kred_moly/1000


kred_g_m3_day<-(out_red_1_d*hgII)
kred_g_day<-kred_g_m3_day*5.9*10^12
kred_mol_y__<-kred_g_day*365/200.9

mean(kred_mol_y__[1957:1968])/1000

kox_mol_day<-(out_ox_1_d*Hg0_pmols1)/10^12; mean(kox_mol_day)
kdem_mol_day<-(out_dem_1_d*MeHg_pmols)/10^12; mean(kdem_mol_day)

out_red_g_d<-out_red_g_m3_d*5.9*10^12
out_red_mol_y<-out_red_g_d*365/200.9
mean(out_red_mol_y[1957:1968])/1000

# kmol trasformate all'anno
fotored_kmols_y<-kred_mol_day*365/1000; mean(fotored_kmols_y)
fotox_kmols_y<-kox_mol_day*365/1000;mean(fotox_kmols_y)
fotodem_kmols_y<- kdem_mol_day*365/1000;mean(fotodem_kmols_y)

mean(fotored_kmols_y[1957:1968])
mean(fotox_kmols_y[1957:1968])
mean(fotodem_kmols_y[1957:1968])

#FOTORIDUZIONE

fotored_1_s <-(fotored$Oxic1/(24*60*60))
fotox_1_s   <-(out_ox_1_d/(24*60*60)) 
fotodem_1_s <-(fotodem$Oxic1/(24*60*60))

fotored_kmols_y_media<-tapply(fotored_kmols_y,rep(1:(length(fotored_kmols_y)/12), each = 12), mean)
mean(fotored_kmols_y_media)
#FOTOSSIDAZIONE
fotox_kmols_y_media<-tapply(fotox_kmols_y,rep(1:(length(fotox_kmols_y)/12), each = 12), mean)
fotox_kmols_y_media<-as.numeric(fotox_kmols_y_media); mean(fotox_kmols_y_media)
#FOTODEG
fotodem_kmols_y_media<-tapply(fotodem_kmols_y,rep(1:(length(fotodem_kmols_y)/12), each = 12), mean)
fotodem_kmols_y_media<-as.numeric(fotodem_kmols_y_media)
mean(fotodem_kmols_y_media)

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


output_kmol_y_media<-cbind(fotox_kmols_y_media, fotored_kmols_y_media*100, 
                           fotodem_kmols_y_media,
                           Hg0_pM_media1, HgII_pM_media, mehg_pM_media, fotored_1_s_media,
                           ef_red_media, fotox_1_s_media, ef_ox_media,fotodem_1_s_media, ef_deg_media)

fotox_kmols_y_media - (fotored_kmols_y_media)
write.csv(output_kmol_y, file="A_fotoreazioni1_2050.csv")
write.csv(output_kmol_y_media , file="A_fotoreazioni_media1_2050.csv")








#VOLATILIZZAZIONE
H<-7.1*10^-3     # Henry's Law constant  
R<-8.206*10^-5   # Universal Gas constant  8.206??0-5 atm/molar-K
Tk<-288.15       # 15^C
divisore<-H/(R*Tk)

kvol_1_day_all<-evasion$Oxic1  # kvol ogni sim
tail(kvol_1_day_all)

kvol_1_day<-kvol_1_day_all #media kvol tutte sim

hg0_media_globale_pM<-Hg0_pM1

tail(hg0_media_globale_pM)
hg0_media_globale_ngL<-(hg0_media_globale_pM*200.59)/1000  #media Hg0 in ng/L (per conti)
hg0_g_m3<-hg0_media_globale_ngL/10^6; summary(hg0_g_m3)    #media Hg0 in g/m3

skvol<-kvol_1_day*(hg0_g_m3 - (atm_hg0/divisore))
#g/m3 day
volat_g_y<-skvol*oxic_vol_m3*365;
volat1_kmol_y<-volat_g_y/(200.59*1000); plot(volat1_kmol_y, type="l")

Volat1_kmol_y_media<-tapply(volat1_kmol_y,rep(1:(length(volat1_kmol_y)/12), each = 12),
                            mean); Volat1_kmol_y_media<-as.numeric(Volat1_kmol_y_media)
#str(atm_hg0)
#vol_2013<-rep(Volat1_kmol_y_media[164],36)
#Volat1_kmol_y_media<-c(Volat1_kmol_y_media,vol_2013)

Volat1_kmol_y_media<-Volat1_kmol_y_media
plot(tail(volat1_kmol_y,24), type="l"); 

volat1_kmol_y_cumul<-cumsum(Volat1_kmol_y_media); volat1_kmol_y_cumul<-as.numeric(volat1_kmol_y_cumul)
plot(volat1_kmol_y_cumul, type="l")

volatile<-data.frame(Volat1_kmol_y_media, volat1_kmol_y_cumul); str(volatile)
write.csv(volatile, file="volat_media_e_cum_2050.csv")
write.csv(volat1_kmol_y, file="volat_kmoly_2050.csv", row.names=F)

mean(tail(volat1_kmol_y,12), type="l"); 

plot(head(hg0_g_m3,24), type="l", col="blue", lwd=2)
par(new=TRUE)
plot(head(skvol,24), type="l")
par(new=TRUE)
plot(head(kvol_1_day,24), type="l", col='red')

#VOLATILIZZAZIONE2
hg0_res<- Hg0_pM1*oxic_vol_m3*1000
vvol_pM_day<-kvol_1_day*hg0_res

vvol_kmol_y<-vvol_pM_day*365/10^15
(vvol_kmol_y[1957:1968])

vvol_kmol_y_media<-tapply(vvol_kmol_y,rep(1:(length(vvol_kmol_y)/12), each = 12),
                          mean)

plot(tail(vvol_kmol_y_media,24), type="l"); 
plot(vvol_kmol_y_media, type="l"); 

Volat1_kmol_y_media[164];vvol_kmol_y_media[164]


setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin

evasion<-read.csv("Volatilization_Loss_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(evasion)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
evasion<-evasion [2:2413,1:13]
str(evasion)
cCC<-tail(evasion)

hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
str(hg$Oxic1)
hg<-hg [2:2413,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1, sep = ",")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,1:13]
str(hgT)
solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
solids<-solids [2:2413,1:13]

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-Phg [2:2413,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg [2:2413,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg [2:2413,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg [2:2413,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0 [2:2413,1:13]

dhg0<-read.csv("Dissolved_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(dhg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
dhg0<-dhg0 [2:2413,1:13]

DOChg0<-read.csv("DOC_Sorbed_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg0<-DOChg0 [2:2413,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehgT<-mehgT [2:2413,1:13]

fotored<-read.csv("Photo_Reduction_Divalent_Hg.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotored)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2");
fotored<-fotored [2:2413,1:13]
fotodem<-read.csv("Photo_Demethylation_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(fotodem)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
fotodem<-fotodem [2:2413,1:13]

silt<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3","Sed1","Sed2")
silt<-silt [2:2413,1:13]

POM<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
              "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
              "Anoxic3","Sed1","Sed2")
POM<-POM [2:2413,1:13]
str(POM$Time)

oxic_vol_m3<-5.9E+12
oxy_vol_L<-oxic_vol_m3*1000
Model_area  <-2.961E+11

time.steps <- hgT$Time     # leggo model timestep 
time.steps <- trunc(time.steps, 0)
time.steps <- time.steps*24*3600   # trasformo in sec
TEMPO <- as.POSIXct(time.steps, tz= "GMT", origin = "1850-01-01") # creo la var tempo
TEMPO[1:10]  # stringa con date
rdate1<-as.Date(TEMPO, tz= "GMT", format="%Y") #creo rdate1 (per  xlab)

#------- calcolo frazioni DOC complexed
siltOL<-silt$Oxic1/10^6
POMOL<-POM$Oxic1/10^6

fDOChg2   <-DOChg$Oxic1/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg, na.rm=TRUE);plot(fDOChg*100)
fDOChg <- (10^3*(2.9*10^-6))/(1+(10^3*(2.9*10^-6))+((siltOL*3000)+(POMOL*(5.1*10^5))))
#uguale a primam
fDOCmehg <-DOCmehg$Oxic1/mehgT$Oxic1
fDOChg0  <-DOChg0$Oxic1/hg0$Oxic1
fdhg0    <-dhg0$Oxic1/hg0$Oxic1

fdisshg2   <-(DOChg$Oxic1+hg$Oxic1)/(DOChg$Oxic1+hg$Oxic1+Phg$Oxic1); mean(fDOChg2, na.rm=TRUE);plot(fDOChg*100)

#-------- conc Hg species pM
Hg0_pM1<-hg0$Oxic1/200.59*1000; mean(hg0$Oxic1)
Hg0_pmols1<-Hg0_pM1*oxic_vol_L  # bulk of Hg0 in upper oxic layer
Hg0_kmols1<-Hg0_pmols1/10^15
mean(Hg0_kmols1[1957:1968])
mean(Hg0_pM1[1957:1968])

mehg_<-mehgT$Oxic1              
mehg_pM<-mehg_/215*1000
MeHg_pmols<-mehg_pM*oxic_vol_L    # bulk of MeHg in upper oxic layer
MeHg_kmols1<-MeHg_pmols/10^15
mean(MeHg_kmols1[1957:1968])
mean(mehg_pM[1957:1968])

fDOChg2

hgII_DOC<-DOChg$Oxic1 # ngL total HgII (diss, DOC, part)
hgII_tot<-(hg$Oxic1+DOChg$Oxic1+Phg$Oxic1)
hgII_DOC/hgII_tot*100

hgII_DOC_pM<-hgII_DOC/200.59*1000
hgII_DOC_pmols <-hgII_DOC_pM*oxic_vol_L
HgII_DOC_kmols<-hgII_DOC_pmols/10^15

HgII_pM<-hgII_tot/200.59*1000              # pM

HgII_pmols<-HgII_pM*oxic_vol_L          # bulk of HgII in oxic layer

HgII_kmols<-HgII_pmols/10^15
mean(HgII_kmols1[1957:1968])
mean(HgII_pM[1957:1968])

HgP_pM<-Phg$Oxic1/200.59*1000; 
HgP_pmols1<-HgP_pM*oxic_vol_L  # bulk of Hg0 in upper oxic layer
HgP_kmols1<-HgP_pmols1/10^15

hgT<-hgT$Oxic1 # total Hg 
hgI<-(hgT-mehg_-hg0$Oxic1)/200.59*1000
hgI_pmols<-hgI*oxic_vol_L  # bulk of HgII in upper oxic layer

hgDOC<-(DOChg$Oxic1) 
hgDOC<-(DOChg$Oxic1) 

# ngL total HgII (diss, DOC, part)
HgDOC_pM<-hgDOC/200.59*1000              # pM
HgDOC_pmols<-HgDOC_pM*oxic_vol_L          # bulk of HgII in oxic layer

hgII_ngL<-hgII
hg0_ngL<-hg0$Oxic1
mehg_ngL<-mehgT$Oxic1

plot(Hg0_kmols1[1950:2029])
#mean(hg0_g_m3/hgII_g_m3*100) #hg0 %
# ---------
## [(f_Hg0_diss + f_Hg0_DOC) / f_HgII_DOC]
ef_red <-fotored_1_s/fdisshg2 ; mean(ef_red*60*60*24) 
mean(ef_red)# quindi questo dovrebbe restituire il tasso in input +  o meno
ef_ox  <-fotox_1_s  /fDOChg        ;  mean(ef_ox*60*60*24)
ef_deg <-fotodem_1_s/fDOCmehg;     mean(ef_deg*60*60*24)
# --------- fotoreactions out [1/d] /84600 -> 1/s; 
# --------- those rate are given by someting as -> kdeg (1/d) * fDOCmehg (-) adjusted for light intensity
#  
#    skred = kred *LN(t) * [xdOC*hgII] * 10^-6
ke<-0.2        #extintion coeff
e<-2.71828     #nepero 
d<-20 
fd<-0.42      #fraction daylight
fac1<-ke*d
#box depth
L_ref<-170
ekde<-e^-fac1
plot(ekde)
LNt_red<-(light_sur_w_m2/L_ref)*((1-ekde)/(fac1))
#str(LNt_red)
#plot(LNt_red[12:24], type='l')


skred = kred *LNt_red*fd*fdisshg2*hgT$Oxic1

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);

skred_ugd<-skred*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^8)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

plot(hg0_ngL)
mean( hg0_ngL[1957:1968])
mean( hg0_ngL[1977:1988])
mean( hg0_ngL[1977:1988])

skred_b = kred *LNt_red * (fDOChg2*hgII_tot)


skred_1 = kred *LNt_red* fDOChg2*fd *hgII_tot

mean(out_red_1_d[1957:1969]);mean(skred[1957:1969]);  mean(skred_b[1957:1969]);mean(skred_1[1957:1969]);


skox = kox *LNt_red*fd
10^-2 ug d-1
mean(out_ox_1_d[1957:1969]);mean(skox[1957:1969]); 

hgII_DOC_fM<-hgII_DOC/200.59*10^6

# k_photooxidation = k_photoreduction * [k_photooxidation / k_photoreduction]* [(f_Hg0_diss + f_Hg0_DOC) /f_HgII_DOC ]


out_red_1_d  <-fotored$Oxic1; mean(out_red_1_d);
out_ox_1_d <-fotored$Oxic1*(kox/kred)*(fDOChg2); mean(out_ox_1_d)
out_dem_1_d <-fotodem$Oxic1; mean(out_dem_1_d[1900:1968])

rr<-(HgII_kmols)*out_red_1_d*365
mean(rr[1957:1968])
oo<-Hg0_kmols1*out_ox_1_d*365
mean(oo[1957:1968])
dmt<-(MeHg_kmols1)*out_dem_1_d*365
mean(dmt[1957:1968])


HgII_DOC_kmols*out_red_ugm3_d*365


kmol_d<-(skred*12)
kmol_y<-kmol_d*365

skred_ugd<-(fotored$Oxic1)*oxic_vol_m3  # ug/m3d*m3 
skred_moly<-skred_ugd*365/(200.59*10^6)
mean(skred_moly[1957:1968]/1000)  #bene ...meglio

skox_ugd<-(fotored$Oxic1*(kred/kox))*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skox_moly<-skox_ugd*365/(200.59*10^6)
mean(skox_moly[1957:1968]/1000)  #bene ...meglio

mean(skred_moly[1957:1968]/1000)-mean(skox_moly[1957:1968]/1000)

skdem_ugd<-(out_dem_1_d)*oxic_vol_m3  # 10^-2 ug/m3d*m3 
skdem_moly<-skdem_ugd*365/(200.59*10^6)
mean(skdem_moly[1957:1968]/1000)  #bene ...meglio

oxy_vol_L<-oxic_vol_m3*1000
#kred_adj<- LNt_red[1:1968]*fd$V1[1:1968]*kred*(fDOChg*100); mean(kred_adj)  
#mean(out_red_1_d)
#kox_adj<-kred_adj*(kox/kred); mean (kox_adj)
#kdem_adj<- (LNt_red[1:1968]*fd$V1[1:1968]*kdeg*(fDOCmehg*100))
#mean(kdem_adj[1900:1968]/20)  # mia formula qua stima di 20 volte?
#mean(out_dem_1_d[1900:1968])

N_kred_g_day<-out_red_1_d*oxy_vol_L/10^9  
N_kred_moly<-N_kred_g_day*365/200.59
N_kred_moly/1000


kred_g_m3_day<-(out_red_1_d*hgII)
kred_g_day<-kred_g_m3_day*5.9*10^12
kred_mol_y__<-kred_g_day*365/200.9

mean(kred_mol_y__[1957:1968])/1000

kox_mol_day<-(out_ox_1_d*Hg0_pmols1)/10^12; mean(kox_mol_day)
kdem_mol_day<-(out_dem_1_d*MeHg_pmols)/10^12; mean(kdem_mol_day)

out_red_g_d<-out_red_g_m3_d*5.9*10^12
out_red_mol_y<-out_red_g_d*365/200.9
mean(out_red_mol_y[1957:1968])/1000

# kmol trasformate all'anno
fotored_kmols_y<-kred_mol_day*365/1000; mean(fotored_kmols_y)
fotox_kmols_y<-kox_mol_day*365/1000;mean(fotox_kmols_y)
fotodem_kmols_y<- kdem_mol_day*365/1000;mean(fotodem_kmols_y)

mean(fotored_kmols_y[1957:1968])
mean(fotox_kmols_y[1957:1968])
mean(fotodem_kmols_y[1957:1968])

#FOTORIDUZIONE

fotored_1_s <-(fotored$Oxic1/(24*60*60))
fotox_1_s   <-(out_ox_1_d/(24*60*60)) 
fotodem_1_s <-(fotodem$Oxic1/(24*60*60))

fotored_kmols_y_media<-tapply(fotored_kmols_y,rep(1:(length(fotored_kmols_y)/12), each = 12), mean)
mean(fotored_kmols_y_media)
#FOTOSSIDAZIONE
fotox_kmols_y_media<-tapply(fotox_kmols_y,rep(1:(length(fotox_kmols_y)/12), each = 12), mean)
fotox_kmols_y_media<-as.numeric(fotox_kmols_y_media); mean(fotox_kmols_y_media)
#FOTODEG
fotodem_kmols_y_media<-tapply(fotodem_kmols_y,rep(1:(length(fotodem_kmols_y)/12), each = 12), mean)
fotodem_kmols_y_media<-as.numeric(fotodem_kmols_y_media)
mean(fotodem_kmols_y_media)

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


output_kmol_y_media<-cbind(fotox_kmols_y_media, fotored_kmols_y_media*100, 
                           fotodem_kmols_y_media,
                           Hg0_pM_media1, HgII_pM_media, mehg_pM_media, fotored_1_s_media,
                           ef_red_media, fotox_1_s_media, ef_ox_media,fotodem_1_s_media, ef_deg_media)

fotox_kmols_y_media - (fotored_kmols_y_media)
write.csv(output_kmol_y, file="A_fotoreazioni1_2050.csv")
write.csv(output_kmol_y_media , file="A_fotoreazioni_media1_2050.csv")








#VOLATILIZZAZIONE
H<-7.1*10^-3     # Henry's Law constant  
R<-8.206*10^-5   # Universal Gas constant  8.206??0-5 atm/molar-K
Tk<-288.15       # 15^C
divisore<-H/(R*Tk)

kvol_1_day_all<-evasion$Oxic1  # kvol ogni sim
tail(kvol_1_day_all)

kvol_1_day<-kvol_1_day_all #media kvol tutte sim

hg0_media_globale_pM<-Hg0_pM1

tail(hg0_media_globale_pM)
hg0_media_globale_ngL<-(hg0_media_globale_pM*200.59)/1000  #media Hg0 in ng/L (per conti)
hg0_g_m3<-hg0_media_globale_ngL/10^6; summary(hg0_g_m3)    #media Hg0 in g/m3

skvol<-kvol_1_day*(hg0_g_m3 - (atm_hg0/divisore))
#g/m3 day
volat_g_y<-skvol*oxic_vol_m3*365;
volat1_kmol_y<-volat_g_y/(200.59*1000); plot(volat1_kmol_y, type="l")

Volat1_kmol_y_media<-tapply(volat1_kmol_y,rep(1:(length(volat1_kmol_y)/12), each = 12),
                            mean); Volat1_kmol_y_media<-as.numeric(Volat1_kmol_y_media)
#str(atm_hg0)
#vol_2013<-rep(Volat1_kmol_y_media[164],36)
#Volat1_kmol_y_media<-c(Volat1_kmol_y_media,vol_2013)

Volat1_kmol_y_media<-Volat1_kmol_y_media
plot(tail(volat1_kmol_y,24), type="l"); 

volat1_kmol_y_cumul<-cumsum(Volat1_kmol_y_media); volat1_kmol_y_cumul<-as.numeric(volat1_kmol_y_cumul)
plot(volat1_kmol_y_cumul, type="l")

volatile<-data.frame(Volat1_kmol_y_media, volat1_kmol_y_cumul); str(volatile)
write.csv(volatile, file="volat_media_e_cum_2050.csv")
write.csv(volat1_kmol_y, file="volat_kmoly_2050.csv", row.names=F)

mean(tail(volat1_kmol_y,12), type="l"); 

plot(head(hg0_g_m3,24), type="l", col="blue", lwd=2)
par(new=TRUE)
plot(head(skvol,24), type="l")
par(new=TRUE)
plot(head(kvol_1_day,24), type="l", col='red')

#VOLATILIZZAZIONE2
hg0_res<- Hg0_pM1*oxic_vol_m3*1000
vvol_pM_day<-kvol_1_day*hg0_res

vvol_kmol_y<-vvol_pM_day*365/10^15
(vvol_kmol_y[1957:1968])

vvol_kmol_y_media<-tapply(vvol_kmol_y,rep(1:(length(vvol_kmol_y)/12), each = 12),
                          mean)

plot(tail(vvol_kmol_y_media,24), type="l"); 
plot(vvol_kmol_y_media, type="l"); 

Volat1_kmol_y_media[164];vvol_kmol_y_media[164]


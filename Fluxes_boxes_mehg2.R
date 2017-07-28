
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale/Anne1e_morehg_tris')
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e_morehg_tris")

#  FLUSSI TRA BOX
#Leggi dati e taglia gli ultimi anni dopo il 2013 hg<-hg[1:1968,]

Pmehgs<-read.csv("Total_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Pmehgs)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); Pmehgs<-Pmehgs[1:1968,1:13]
## Phg ngL

SEDhg<-read.csv("Total_Sorbed_Divalent_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(SEDhg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); SEDhg<-SEDhg[1:1968,1:13]
## Sedhg ngg

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); mehg<-mehg[1:1968,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOCmehg<-DOCmehg[1:1968,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); mehgT<-mehgT[1:1968,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg0<-hg0[1:1968,1:13]

solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); solids<-solids[1:1968,1:13]
tail(solids)

POM_depos<-read.csv("POM_Dep_Vel.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM_depos)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                    "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                    "Anoxic3","Sed1","Sed2")
POM_depos<-POM_depos[1:1968,1:13]

silt_depos<-read.csv("Silt_Dep_Vel.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt_depos)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                     "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                     "Anoxic3","Sed1","Sed2")
silt_depos<-silt_depos[1:1968,1:13]

silts<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silts)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                "Anoxic3","Sed1","Sed2")
silts<-silts[1:1968,1:13]

POMs<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POMs)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1", "Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3", "Sed1","Sed2")
POMs <-POMs[1:1968,1:13]

OL1_vol_m3 <-5.9E+12; 			OL1_vol_L  <-OL1_vol_m3*1000
CIL_vol_m3 <-4.5E+12; 			CIL_vol_L  <-CIL_vol_m3*1000
oxy_vol_m3 <-5.9E+12; 			oxy_vol_L  <-oxy_vol_m3*1000
SOL_vol_m3 <-7.4E+12; 			SOL_vol_L  <-SOL_vol_m3*1000
UAL1_vol_m3 <-5.3E+13; 			UAL1_vol_L  <-UAL1_vol_m3*1000
DAOL_vol_m3 <-2.9E+14; 			DAOL_vol_L  <-DAOL_vol_m3*1000
BBL_vol_m3 <-1E+14; 			BBL_vol_L  <-BBL_vol_m3*1000
Sed1_vol<-8.8*10^9
Sed2_vol<-2*10^10

mcy<-305*10^9 #km3y
adv_ugy<-mcy*mehgT$Oxycline
adv_gy<-adv_ugy/10^6
adv_moly<-adv_gy/200.59
adv_kmoly<-adv_moly/1000
mean(tail(adv_kmoly,12))

adv2_ugy<-mcy*mehgT$Suboxic1
adv2_gy<-adv2_ugy/10^6
adv2_moly<-adv2_gy/200.59
adv2_kmoly<-adv2_moly/1000
mean(tail(adv2_kmoly,12))
mean(tail(adv_kmoly,12))-mean(tail(adv2_kmoly,12))

diss_mehg<-DOCmehg+mehg
diss_mehg_pM<-diss_mehg/215*1000
mehgtot_pM<-mehgT/215*1000

### ....diffusion .....
area<-2.961E+11
sed_diff<-10^-9 *60*60*24
eddy_d_OL<-(9.5*10^-6) *60*60*24 #m2/s
eddy_d_SOL<-(9.5*10^-6) *60*60*24
eddy_d_BBL<-(8.7^-6) *60*60*24

lenght_OL_SOL<-10
lenght_AOL_SOL<-10
lenght_AOL_Sed<-0.05

MeHg_OL_g_L<-mehgT$Oxycline /10^9    #OL4
MeHg_SOL_g_L<-mehgT$Suboxic1/10^9       #  SOL
MeHg_AOL_g_L<-mehgT$Suboxic2/10^9     # AOL1
MeHgD_BBL_g_L<-diss_mehg$Anoxic3 /10^9  #AOL4
MeHgD_Sed_g_L<-diss_mehg$Sed1 /10^9      # sEd

MeHg_OL_g_m3<-MeHg_OL_g_L*1000
MeHg_SOL_g_m3<-MeHg_SOL_g_L*1000;mean(tail(HgD_SOL_g_m3,12))
MeHg_AOL_g_m3<-MeHg_AOL_g_L*1000;mean(tail(HgD_AOL_g_m3,12))
MeHgD_BBL_g_m3<-MeHgD_BBL_g_L*1000
MeHgD_Sed_g_m3<-MeHgD_Sed_g_L*1000

1968/163
2013-1850
A<-(eddy_d_OL *area)
B<-(eddy_d_SOL *area)
C<-(sed_diff*area)

conc_grad1<-(MeHg_SOL_g_m3-MeHg_OL_g_m3) #g/m3
conc_grad2<-(MeHg_AOL_g_m3-MeHg_SOL_g_m3) #g/m3
conc_grad3<-(MeHgD_BBL_g_m3-(MeHgD_Sed_g_m3/0.95)) #g/m3

diff_OL<- (A/lenght_OL_SOL)*conc_grad1;

diff_OL   #g/d
diff_SOL<-(B/lenght_AOL_SOL)*conc_grad2;diff_SOL
#diff_AOL<-((eddy_d_AOL*area)/(lenght_AOL_Sed/0.9))*(HgD_Sed/0.9-HgD_AOL) #0.9 porosity
diff_Sed<-(C/(lenght_AOL_Sed/0.95))*conc_grad3 #g/d


diff_OL_mol_y<-(diff_OL/200.59)*365
diff_OL_kmol_y<-diff_OL_mol_y/10^3

diff_SOL_mol_y<-(diff_SOL/200.59)*365
diff_SOL_kmol_y<-diff_SOL_mol_y/10^3

diff_Sed_mol_d<-(diff_Sed/200.59)
diff_Sed_mol_y<-diff_Sed_mol_d*365
diff_Sed_kmol_y<-diff_Sed_mol_y/10^3


#variazione conc OL kmol/y
str(diff_OL_kmol_y)
mean(tail(diff_OL_kmol_y,12)); summary(tail(diff_OL_kmol_y,12))
#variazione SOL kmol/y
mean(tail(diff_SOL_kmol_y,12)); summary(tail(diff_SOL_kmol_y,12))

mean(tail(diff_Sed_kmol_y,12)); summary(tail(diff_Sed_kmol_y,12))

# solidi ai boundaries ta OL-SOL e sOL_AOL e aOL - SED
###  g/m3 = mg/L

kd_silt<-10^3
kd_POM<-3*10^5

Pmehg_OL <-Pmehgs$Oxycline ;  #ngL

POMs_kgL<-POMs/10^6   #mgL/10^6 -> kgL
silts_kgL<-silts/10^6 

mehgCl_gm3<-mehg/10^6   #ngL/10^6 ->mgL 

mehgPOM_gm3<-mehgCl_gm3*POMs_kgL*kd_POM
mehgsilt_gm3<-mehgCl_gm3*silts_kgL*kd_silt

mehgPOM_ngL<- mehgPOM_gm3*10^6
mehgsilt_ngL<-  mehgsilt_gm3*10^6
tail(mehgPOM_ngL$Oxycline)  
tail(mehgsilt_ngL$Oxycline)
mehgp<-(mehgPOM_gm3+mehgsilt_gm3)*10^6

solids_OL  <-solids$Oxycline     
solids_SOL  <-solids$Suboxic1
solids_AOL  <-solids$Anoxic3
solids_sed1  <-solids$Sed1
solids_sed2  <-solids$Sed2

# Hg ug/m3
Pmehg_OL <-Pmehgs$Oxycline
Pmehg_SOL <-Pmehgs$Suboxic1       # Hg ug/m3
Pmehg_AOL <-Pmehgs$Anoxic3       # Hg ug/m3

#DEPOSIZIONE Pmehg AOL -> Sed

## .... settling OL - SOL.....
POM_OLdepo_1_day<-POM_depos$Oxycline/20     #depo m/day * !!! depth(m) --> 1/day (0.003 /d)
silt_OLdepo_1_day<-silt_depos$Oxycline/20  # depo silt m/day  (0.014 /d)
fPOM_OL<-mean(POMs$Oxycline/solids_OL, na.rm=TRUE)
fsilt_OL<-mean(silts$Oxycline/solids_OL, na.rm=TRUE)

#  Vd OL

depo_OLmedia2<-POM_OLdepo_1_day  #approssimazione migliore che depo1 (tolto)
depo_OLmedia2 #

OLdepo_g_m3_d<-(mehgPOM_gm3$Oxycline*POM_OLdepo_1_day)+(mehgsilt_gm3$Oxycline*silt_OLdepo_1_day)
OLdepo_g_d_ok<-OLdepo_g_m3_d*oxy_vol_m3  #g/d
OLdepo_mol_d_ok<-OLdepo_g_d_ok/200.59    
OLdepo_kmol_y_ok<-(OLdepo_mol_d_ok/1000)*365  
mediaok_depoOL_kmol_y <-tapply(OLdepo_kmol_y_ok,rep(1:(length(OLdepo_kmol_y_ok)/12),each = 12), mean)


## .... settling SOL - AOL.....
POM_SOLdepo_1_day<-POM_depos$Suboxic1 /25    #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_SOLdepo_1_day<-silt_depos$Suboxic1/25   # depo silt m/day  (0.014 /d)
fPOM_SOL<-mean(POMs$Suboxic1/solids_SOL, na.rm=TRUE)
fsilt_SOL<-mean(silts$Suboxic1/solids_SOL, na.rm=TRUE)
#  Vd SOL
SOLdepo_g_m3_d<-(mehgPOM_gm3$Suboxic1*POM_SOLdepo_1_day)+(mehgsilt_gm3$Suboxic1*silt_SOLdepo_1_day)
SOLdepo_g_d_ok<-SOLdepo_g_m3_d*SOL_vol_m3  #g/d
SOLdepo_mol_d_ok<-SOLdepo_g_d_ok/200.59    
SOLdepo_kmol_y_ok<-(SOLdepo_mol_d_ok/1000)*365  
mediaok_depoSOL_kmol_y <-tapply(SOLdepo_kmol_y_ok,rep(1:(length(SOLdepo_kmol_y_ok)/12),each = 12), mean)

depo_SOLmedia2<-POM_SOLdepo_1_day
depo_SOLmedia2 #
str(Pmehg_SOL)
depo_SOLPmehg_ug_m3_d<-depo_SOLmedia2*Pmehg_SOL        # 1/day *ug/m3 -> ug/m3d
depo_SOLPmehg_g_d <-(depo_SOLPmehg_ug_m3_d*SOL_vol_m3)/10^6   # g/d
depo_SOLPmehg_mol_d <-depo_SOLPmehg_g_d/200.59               # mol/d
depo_SOLPmehg_kmol_y <-(depo_SOLPmehg_mol_d/1000)*365        # kmol/y
#OK
media1_depoSOL_kmol_y <-tapply(depo_SOLPmehg_kmol_y,rep(1:(length(depo_SOLPmehg_kmol_y)/12),each = 12), mean)

#DEPOSIZIONE Pmehg AOL -> Sed
#depo m/day * g/m3 --> g/m2d
Vol_anox3<-1E+14
POM_AOLdepo_1_day<-POM_depos$Anoxic3/350     #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_AOLdepo_1_day<-silt_depos$Anoxic3/350   # depo silt m/day  (0.014 /d)
fPOM_AOL<-mean(POMs$Anoxic3/solids_AOL, na.rm=TRUE)
fsilt_AOL<-mean(silts$Anoxic3/solids_AOL, na.rm=TRUE)
#  Vd

AOLdepo_g_m3_d<-(mehgPOM_gm3$Anoxic3*POM_AOLdepo_1_day)+(mehgsilt_gm3$Anoxic3*silt_AOLdepo_1_day)
AOLdepo_g_d_ok<-AOLdepo_g_m3_d*Vol_anox3  #g/d
AOLdepo_mol_d_ok<-AOLdepo_g_d_ok/200.59    
AOLdepo_kmol_y_ok<-(AOLdepo_mol_d_ok/1000)*365  
mediaok_depoAOL_kmol_y <-tapply(AOLdepo_kmol_y_ok,rep(1:(length(AOLdepo_kmol_y_ok)/12),each = 12), mean)
tail(mediaok_depoAOL_kmol_y)
depo_AOLmedia2<-POM_AOLdepo_1_day
depo_AOLmedia2 #

depo_AOLPmehg_ug_m3_d<-depo_AOLmedia2*Pmehg_AOL       # 1/day *ug/m3 -> ug/m3d
depo_AOLPmehg_g_d <-(depo_AOLPmehg_ug_m3_d*Vol_anox3)/10^6   # g/d
depo_AOLPmehg_mol_d <-depo_AOLPmehg_g_d/200.59               # mol/d
depo_AOLPmehg_kmol_y <-(depo_AOLPmehg_mol_d/1000)*365        # kmol/y

media1_depoAOL_kmol_y <-tapply(depo_AOLPmehg_kmol_y,rep(1:(length(depo_AOLPmehg_kmol_y)/12),each = 12), mean)


tail(mediaok_depoOL_kmol_y,1);tail(mediaok_depoSOL_kmol_y,1);tail(mediaok_depoAOL_kmol_y,1)

summary(tail(OLdepo_kmol_y_ok,12)); 

summary(tail(mediaok_depoSOL_kmol_y,12)); 

tail(mediaok_depoOL_kmol_y,12)
tail(media1_depoSOL_kmol_y,12)
tail(media1_depoAOL_kmol_y,12)


#variazione conc OL kmol/y
str(diff_OL_kmol_y)
mean(tail(diff_OL_kmol_y,12)); summary(tail(diff_OL_kmol_y,12))
#variazione SOL kmol/y
mean(tail(diff_SOL_kmol_y,12)); summary(tail(diff_SOL_kmol_y,12))
#sed diff
mean(tail(diff_Sed_kmol_y,12)); summary(tail(diff_Sed_kmol_y,12))

## SOL_Vol
## AO

setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e_morehg")

#Leggi dati e taglia gli ultimi anni dopo il 2013 hg<-hg[1:1968,]
hg<-read.csv("Dissolved_Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg<-hg[1:1968,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hgT<-hgT[1:1968,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip =1, sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOChg<-DOChg[1:1968,1:13]

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); Phg<-Phg[1:1968,1:13]

SEDhg<-read.csv("Total_Sorbed_Divalent_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(SEDhg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); SEDhg<-SEDhg[1:1968,1:13]

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
POM_depos<-POM_depos[1:1968,1:12]

silt_depos<-read.csv("Silt_Dep_Vel.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt_depos)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                     "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                     "Anoxic3","Sed1","Sed2")
silt_depos<-silt_depos[1:1968,1:12]

silts<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silts)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                "Anoxic3","Sed1","Sed2")
silts<-silts[1:1968,1:12]

POMs<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POMs)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1", "Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3", "Sed1","Sed2")
POMs <-POMs[1:1968,1:12]



OL1_vol_m3 <-5.9E+12; 			OL1_vol_L  <-OL1_vol_m3*1000
CIL_vol_m3 <-4.5E+12; 			CIL_vol_L  <-CIL_vol_m3*1000
oxy_vol_m3 <-5.9E+12; 			oxy_vol_L  <-oxy_vol_m3*1000
SOL_vol_m3 <-7.4E+12; 			SOL_vol_L  <-SOL_vol_m3*1000
UAL1_vol_m3 <-5.3E+13; 			UAL1_vol_L  <-UAL1_vol_m3*1000
DAOL_vol_m3 <-2.9E+14; 			DAOL_vol_L  <-DAOL_vol_m3*1000
BBL_vol_m3 <-1E+14; 			BBL_vol_L  <-BBL_vol_m3*1000
Sed1_vol<-8.8*10^9
Sed2_vol<-2*10^10


diss_hg<-hg+DOChg+DOCmehg+mehg+hg0; str(diss_hg);tail(diss_hg)
diss_hg_pM<-diss_hg/200.59*1000

# solidi ai boundaries ta OL-SOL e sOL_AOL e aOL - SED
solids_OL  <-solids$Oxycline     
solids_SOL  <-solids$Suboxic1
solids_AOL  <-solids$Anoxic3

SEDhg_OL   <-SEDhg$Oxycline  # Hg ng/g-> SEDhg*solid_sed --> PHg ug/m3
SEDhg_SOL   <-SEDhg$Suboxic1
SEDhg_AOL   <-SEDhg$Anoxic3

Phg_OL <-Phgs$Oxycline       # Hg ug/m3
Phg_SOL <-Phgs$Suboxic1       # Hg ug/m3
Phg_AOL <-Phgs$Anoxic3       # Hg ug/m3

HgT_sed1_ngm3 <- solids_sed1 *SEDhg_sed1  #  ng/g*g/m3 -> ng/m3
HgT_sed2_ngm3 <- solids_sed2 *SEDhg_sed2 
HgT_sed1_gm3 <-HgT_sed1_ngm3/10^9         #   mg/m3->g/m3 hgP
HgT_sed2_gm3  <-HgT_sed2_ngm3/10^9


#DEPOSIZIONE Phg AOL -> Sed
#depo m/day * g/m3 --> g/m2d
Vol_anox3<-1E+14
POM_depo_1_day<-POM_depos$Anoxic3/350     #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_depo_1_day<-silt_depos$Anoxic3/350   # depo silt m/day  (0.014 /d)
fPOM<-mean(POMs$Anoxic3/TOTs$Anoxic3, na.rm=TRUE)
fsilt<-mean(silts$Anoxic3/TOTs$Anoxic3, na.rm=TRUE)
#  Vd
depo_media1<-((POM_depo_1_day*fPOM)+(silt_depo_1_day*fsilt))/2  #1/day
depo_media1 # 0.005 /d

depo_Phg_ug_m3_d<-depo_media1*Phgs$Anoxic3        # 1/day *ug/m3 -> ug/m3d
depo_Phg_g_d <-(depo_Phg_ug_m3_d*Vol_anox3)/10^6   # g/d
depo_Phg_mol_d <-depo_Phg_g_d/200.59               # mol/d
depo_Phg_kmol_y <-(depo_Phg_mol_d/1000)*365        # kmol/y
plot(depo_Phg_kmol_y)

media1_depoAOL_kmol_y <-tapply(depo_Phg_kmol_y,rep(1:(length(depo_Phg_kmol_y)/12),each = 12), mean)
plot(media1_depo_kmol_y)


media1_depoAOL_kmol_y
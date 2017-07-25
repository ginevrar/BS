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

diss_hg_inor<-hg+DOChg+hg0
diss_mehg<-DOCmehg+mehg

diss_mehg_pM<-diss_mehg/215*1000
diss_hgIpM<-diss_hg_inor/200.59*1000
diss_hg_pM<-diss_hgIpM+diss_mehg_pM

### ....diffusion .....
area<-
  sed_diff<-  
eddy_d_OL<-9.5*10^-6  #m2/s
eddy_d_SOL<-9.5*10^-6
eddy_d_AOL<-10^-5
eddy_d_BBL<-8.7^-6

HgD_OL<-diss_hg_pM$Oxycline *oxy_vol_L #pM OL4
HgD_SOL<-diss_hg_pM$Suboxic1*SOL_vol_L #pM SOL
HgD_AOL<-diss_hg_pM$Suboxic1*UAL1_vol_L #pM AOL1
HgD_BBL<-diss_hg_pM$Anoxic3 *BBL_vol_L #pM AOL4
HgD_Sed<-diss_hg_pM$Sed1 *BBL_vol_L #pM AOL4

#check in the model how is it ... only one way?
diff_OL<-(eddy_d_OL*area)/lenght_OL_SOL*(HgD_SOL-HgD_OL)
diff_SOL1<-(eddy_d_SOL*area)/lenght_OL_SOL*(HgD_SOL-HgD_OL)
diff_SOL2<-(eddy_d_OL*area)/lenght_OL_SOL*(HgD_SOL-HgD_OL)

diff_AOL<-((eddy_d_AOL*area)/(lenght_AOL_Sed/0.9))*(HgD_Sed/0.9-HgD_AOL) #0.9 porosity
diff_Sed<-(sed_diff*area)/(lenght_AOL_Sed/0.9)*(HgD_AOL-HgD_Sed/0.9)





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

## .... settling OL - SOL.....
POM_OLdepo_1_day<-POM_depos$Oxycline/350     #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_OLdepo_1_day<-silt_depos$Oxycline/350   # depo silt m/day  (0.014 /d)
fPOM_OL<-mean(POMs$Oxycline/solids_OL, na.rm=TRUE)
fsilt_OL<-mean(silts$Oxycline/solids_OL, na.rm=TRUE)
#  Vd OL
depo_OLmedia1<-((POM_OLdepo_1_day*fPOM_OL)+(silt_OLdepo_1_day*fsilt_OL))/2  #1/day
depo_OLmedia1 # 0.005 /d

depo_OLPhg_ug_m3_d<-depo_OLmedia1*Phg_OL        # 1/day *ug/m3 -> ug/m3d
depo_OLPhg_g_d <-(depo_OLPhg_ug_m3_d*oxy_vol_m3)/10^6   # g/d
depo_OLPhg_mol_d <-depo_OLPhg_g_d/200.59               # mol/d
depo_OLPhg_kmol_y <-(depo_OLPhg_mol_d/1000)*365        # kmol/y

media1_depoOL_kmol_y <-tapply(depo_OLPhg_kmol_y,rep(1:(length(depo_OLPhg_kmol_y)/12),each = 12), mean)

## .... settling SOL - AOL.....
POM_SOLdepo_1_day<-POM_depos$Suboxic1 /350     #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_SOLdepo_1_day<-silt_depos$Suboxic1/350   # depo silt m/day  (0.014 /d)
fPOM_SOL<-mean(POMs$Suboxic1/solids_SOL, na.rm=TRUE)
fsilt_SOL<-mean(silts$Suboxic1/solids_SOL, na.rm=TRUE)
#  Vd SOL
depo_SOLmedia1<-((POM_SOLdepo_1_day*fPOM_SOL)+(silt_SOLdepo_1_day*fsilt_SOL))/2  #1/day
depo_SOLmedia1 # 

depo_SOLPhg_ug_m3_d<-depo_SOLmedia1*Phg_SOL        # 1/day *ug/m3 -> ug/m3d
depo_SOLPhg_g_d <-(depo_SOLPhg_ug_m3_d*SOL_vol_m3)/10^6   # g/d
depo_SOLPhg_mol_d <-depo_SOLPhg_g_d/200.59               # mol/d
depo_SOLPhg_kmol_y <-(depo_SOLPhg_mol_d/1000)*365        # kmol/y

media1_depoSOL_kmol_y <-tapply(depo_SOLPhg_kmol_y,rep(1:(length(depo_SOLPhg_kmol_y)/12),each = 12), mean)


#DEPOSIZIONE Phg AOL -> Sed
#depo m/day * g/m3 --> g/m2d
Vol_anox3<-1E+14
POM_AOLdepo_1_day<-POM_depos$Anoxic3/350     #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_AOLdepo_1_day<-silt_depos$Anoxic3/350   # depo silt m/day  (0.014 /d)
fPOM_AOL<-mean(POMs$Anoxic3/solids_AOL, na.rm=TRUE)
fsilt_AOL<-mean(silts$Anoxic3/solids_AOL, na.rm=TRUE)
#  Vd
depo_AOLmedia1<-((POM_AOLdepo_1_day*fPOM_AOL)+(silt_AOLdepo_1_day*fsilt_AOL))/2  #1/day
depo_AOLmedia1 # 0.005 /d

depo_AOLPhg_ug_m3_d<-depo_media1*Phg_AOL       # 1/day *ug/m3 -> ug/m3d
depo_AOLPhg_g_d <-(depo_AOLPhg_ug_m3_d*Vol_anox3)/10^6   # g/d
depo_AOLPhg_mol_d <-depo_AOLPhg_g_d/200.59               # mol/d
depo_AOLPhg_kmol_y <-(depo_AOLPhg_mol_d/1000)*365        # kmol/y

media1_depoAOL_kmol_y <-tapply(depo_AOLPhg_kmol_y,rep(1:(length(depo_AOLPhg_kmol_y)/12),each = 12), mean)



summary(media1_depoOL_kmol_y); str(media1_depoOL_kmol_y);tail(media1_depoOL_kmol_y)
summary(media1_depoSOL_kmol_y); str(media1_depoSOL_kmol_y);tail(media1_depoSOL_kmol_y)
summary(media1_depoAOL_kmol_y); str(media1_depoAOL_kmol_y);tail(media1_depoAOL_kmol_y)



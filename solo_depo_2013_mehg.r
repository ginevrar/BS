setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2/0.1")

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); 
mehg<-mehg[59536:59900,1:13]

Pmehgs<-read.csv("Total_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Pmehgs)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); 
Pmehgs<-Pmehgs[59536:59900,1:13]

SEDmehg<-read.csv("Total_Sorbed_Methyl_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(SEDmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); 
SEDhg<-SEDhg[59536:59900,1:13]

silts<-read.csv("Silts_fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silts)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2");
silts<-silts[59536:59900,1:13]
tail(silts)

POM_depos<-read.csv("POM_Dep_Vel.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM_depos)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                    "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                    "Anoxic3","Sed1","Sed2")
POM_depos<-POM_depos[59536:59900,1:13]

silt_depos<-read.csv("Silt_Dep_Vel.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt_depos)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                     "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                     "Anoxic3","Sed1","Sed2")
silt_depos<-silt_depos[59536:59900,1:13]

silts<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silts)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                "Anoxic3","Sed1","Sed2")
silts<-silts[59536:59900,1:13]

POMs<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POMs)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1", "Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3", "Sed1","Sed2")
str(POMs)
POMs <-POMs[59536:59900,1:13]
# solidi ai boundaries ta OL-SOL e sOL_AOL e aOL - SED
###  g/m3 = mg/L

kd_silt<-3*10^3
kd_POM<-5.5*10^5

POMs_kgL<-POMs/10^6   #mgL/10^6 -> kgL
silts_kgL<-silts/10^6 
mehgCl_gm3<-mehg/10^6   #ngL/10^6 ->mgL 

str(mehgCl_gm3)
a<-c(1,2,3)
b<-c(4,5,6)
df1<-data.frame(a,b)

mehgPOM_gm3<-mehgCl_gm3*POMs_kgL*kd_POM
mehgsilt_gm3<-mehgCl_gm3*silts_kgL*kd_silt

mehgp<-(mehgPOM_gm3+mehgsilt_gm3)*10^6

Pmehg_OL <-Pmehgs$Oxycline; tail(Pmehg_OL) #ngL
mehgp_OL <-mehgp$Oxycline;   tail(mehgp_OL)

str(mehgp_OL)
str(Pmehg_OL)

mehgPOM_ngL<-  mehgPOM_gm3*10^6
mehgsilt_ngL<-  mehgsilt_gm3*10^6

tail(mehgPOM_ngL$Oxycline)  
tail(mehgsilt_ngL$Oxycline)

# mehg ug/m3
Pmehg_OL <-Pmehgs$Oxycline
Pmehg_SOL <-Pmehgs$Suboxic1       # mehg ug/m3
Pmehg_AOL <-Pmehgs$Anoxic3       # mehg ug/m3

#DEPOSIZIONE Pmehg AOL -> Sed
## .... settling OL - SOL.....
fPOM_OL<POMs$Oxycline/solids_OL
fsilt_OL<-silts$Oxycline/solids_OL

OLdepo_g_m2_d  <-(mehgPOM_gm3$Oxycline*POM_depos$Oxycline)+   #gm3*md ->gm2d
                 (mehgsilt_gm3$Oxycline*silt_depos$Oxycline)
OLdepo_g_d_ok  <-OLdepo_g_m2_d* area  #g/d
OLdepo_mol_d_ok<-OLdepo_g_d_ok/200.59    
OLdepo_kmol_y_ok<-(OLdepo_mol_d_ok/1000)*365  

tail(rdate,365)

## .... settling SOL - AOL.....
POM_SOLdepo_m_day<-POM_depos$Suboxic1     #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_SOLdepo_m_day<-silt_depos$Suboxic1   # depo silt m/day  (0.014 /d)
fPOM_SOL<-mean(POMs$Suboxic1/solids_SOL, na.rm=TRUE)
fsilt_SOL<-mean(silts$Suboxic1/solids_SOL, na.rm=TRUE)
#  Vd SOL
SOLdepo_g_m2_d<-(mehgPOM_gm3$Suboxic1*POM_SOLdepo_m_day)+
  (mehgsilt_gm3$Suboxic1*silt_SOLdepo_m_day)
SOLdepo_g_d_ok<-SOLdepo_g_m2_d*area  #g/d
SOLdepo_mol_d_ok<-SOLdepo_g_d_ok/200.59    
SOLdepo_kmol_y_ok<-(SOLdepo_mol_d_ok/1000)*365  

mean(tail(SOLdepo_kmol_y_ok,365))

depo_SOLmedia2<-POM_SOLdepo_m_day
depo_SOLmedia2 #

depo_SOLPmehg_ug_m3_d<-depo_SOLmedia2*Pmehg_SOL        # 1/day *ug/m3 -> ug/m3d
depo_SOLPmehg_g_d <-(depo_SOLPmehg_ug_m3_d*area)/10^6   # g/d
depo_SOLPmehg_mol_d <-depo_SOLPmehg_g_d/200.59               # mol/d
depo_SOLPmehg_kmol_y <-(depo_SOLPmehg_mol_d/1000)*365        # kmol/y
#OK

mean(depo_SOLPmehg_kmol_y)

#DEPOSIZIONE Pmehg AOL -> Sed
#depo m/day * g/m3 --> g/m2d
Vol_anox3<-1E+14
POM_AOLdepo_m_day<-POM_depos$Anoxic3   #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_AOLdepo_m_day<-silt_depos$Anoxic3   # depo silt m/day  (0.014 /d)
fPOM_AOL<-mean(POMs$Anoxic3/solids_AOL, na.rm=TRUE)
fsilt_AOL<-mean(silts$Anoxic3/solids_AOL, na.rm=TRUE)

#  Vd
AOLdepo_g_m2_d<-(mehgPOM_gm3$Anoxic3*POM_AOLdepo_m_day)+
  (mehgsilt_gm3$Anoxic3*silt_AOLdepo_m_day)
AOLdepo_g_d_ok<-AOLdepo_g_m2_d*area  #g/d
AOLdepo_mol_d_ok<-AOLdepo_g_d_ok/200.59    
AOLdepo_kmol_y_ok<-(AOLdepo_mol_d_ok/1000)*365  

mean(tail(AOLdepo_kmol_y_ok,365))

depo_AOLmedia2<-POM_AOLdepo_m_day
depo_AOLmedia2 #

depo_AOLPmehg_ug_m3_d<-depo_AOLmedia2*Pmehg_AOL       # 1/day *ug/m3 -> ug/m3d
depo_AOLPmehg_g_d <-(depo_AOLPmehg_ug_m3_d*area)/10^6   # g/d
depo_AOLPmehg_mol_d <-depo_AOLPmehg_g_d/200.59               # mol/d
depo_AOLPmehg_kmol_y <-(depo_AOLPmehg_mol_d/1000)*365        # kmol/y

mean(tail(OLdepo_kmol_y_ok,365))
mean(tail(SOLdepo_kmol_y_ok,365))
mean(tail(AOLdepo_kmol_y_ok,365))

depoomehgp<-data.frame(rdate,OLdepo_kmol_y_ok,SOLdepo_kmol_y_ok,AOLdepo_kmol_y_ok)
write.csv(depoomehgp, file='depoomehgp.csv')


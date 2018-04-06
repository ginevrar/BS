#setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2/0.1")
area<-2.916E+11

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c")
setwd("C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6")

2414/201
164*12

hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); 
hg<-hg[1958:1969,1:13]

Phgs<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phgs)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); 
Phgs<-Phgs[1958:1969,1:13]

SEDhg<-read.csv("Total_Sorbed_Divalent_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(SEDhg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); 
SEDhg<-SEDhg[1958:1969,1:13]

silts<-read.csv("Silts_fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silts)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2");
silts<-silts[1958:1969,1:13]
tail(silts)

POM_depos<-read.csv("POM_Dep_Vel.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM_depos)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                    "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                    "Anoxic3","Sed1","Sed2")
POM_depos<-POM_depos[1958:1969,1:13]

silt_depos<-read.csv("Silt_Dep_Vel.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt_depos)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                     "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                     "Anoxic3","Sed1","Sed2")
silt_depos<-silt_depos[1958:1969,1:13]

silts<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silts)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                "Anoxic3","Sed1","Sed2")
silts<-silts[1958:1969,1:13]

POMs<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POMs)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1", "Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3", "Sed1","Sed2")
str(POMs)
POMs <-POMs[1958:1969,1:13]
# solidi ai boundaries ta OL-SOL e sOL_AOL e aOL - SED
###  g/m3 = mg/L

kd_silt<-3*10^3
kd_POM<-5.5*10^5

POMs_kgL<-POMs/10^6   #mgL/10^6 -> kgL
silts_kgL<-silts/10^6 
hgCl_gm3<-hg/10^6   #ngL/10^6 ->mgL 

str(hgCl_gm3)
a<-c(1,2,3)
b<-c(4,5,6)
df1<-data.frame(a,b)

time.steps <- Phgs[,1]
time.steps3 <- time.steps*24*3600
TEMPO <- as.POSIXct(time.steps3, tz= "GMT", origin = "1850-01-01")
TEMPO[1:12]
rdate<-as.Date(TEMPO, tz= "GMT", format="%Y")
tail(rdate,365)
hgPOM_gm3<-hgCl_gm3*POMs_kgL*kd_POM
hgsilt_gm3<-hgCl_gm3*silts_kgL*kd_silt

hgp<-(hgPOM_gm3+hgsilt_gm3)*10^6

Phg_OL <-Phgs$Oxycline; tail(Phg_OL) #ngL
hgp_OL <-hgp$Oxycline;   tail(hgp_OL)

str(hgp_OL)
str(Phg_OL)

hgPOM_ngL<-  hgPOM_gm3*10^6
hgsilt_ngL<-  hgsilt_gm3*10^6

tail(hgPOM_ngL$Oxycline)  
tail(hgsilt_ngL$Oxycline)

# hg ug/m3
Phg_OL <-Phgs$Oxycline
Phg_SOL <-Phgs$Suboxic1       # hg ug/m3
Phg_AOL <-Phgs$Anoxic3       # hg ug/m3

#DEPOSIZIONE Phg AOL -> Sed
## .... settling OL - SOL.....
fPOM_OL<-POMs$Oxycline/(POMs$Oxycline+silts$Oxycline)
fsilt_OL<-silts$Oxycline/(POMs$Oxycline+silts$Oxycline)

OLdepo_g_m2_d  <-(hgPOM_gm3$Oxycline*POM_depos$Oxycline)+   #gm3*md ->gm2d
                 (hgsilt_gm3$Oxycline*silt_depos$Oxycline)
OLdepo_g_d_ok  <-OLdepo_g_m2_d* area  #g/d
OLdepo_mol_d_ok<-OLdepo_g_d_ok/200.59    
OLdepo_kmol_y_ok<-(OLdepo_mol_d_ok/1000)*365  

tail(rdate,365)

## .... settling SOL - AOL.....
POM_SOLdepo_m_day<-POM_depos$Suboxic1     #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_SOLdepo_m_day<-silt_depos$Suboxic1   # depo silt m/day  (0.014 /d)
fPOM_SOL<-mean(POMs$Suboxic1/(POMs$Suboxic1+silts$Suboxic1), na.rm=TRUE)
fsilt_SOL<-mean(silts$Suboxic1/(POMs$Suboxic1+silts$Suboxic1), na.rm=TRUE)
#  Vd SOL
SOLdepo_g_m2_d<-(hgPOM_gm3$Suboxic1*POM_SOLdepo_m_day)+
  (hgsilt_gm3$Suboxic1*silt_SOLdepo_m_day)
SOLdepo_g_d_ok<-SOLdepo_g_m2_d*area  #g/d
SOLdepo_mol_d_ok<-SOLdepo_g_d_ok/200.59    
SOLdepo_kmol_y_ok<-(SOLdepo_mol_d_ok/1000)*365  

mean(tail(SOLdepo_kmol_y_ok,365))

depo_SOLmedia2<-POM_SOLdepo_m_day
depo_SOLmedia2 #

depo_SOLPhg_ug_m3_d<-depo_SOLmedia2*Phg_SOL        # 1/day *ug/m3 -> ug/m3d
depo_SOLPhg_g_d <-(depo_SOLPhg_ug_m3_d*area)/10^6   # g/d
depo_SOLPhg_mol_d <-depo_SOLPhg_g_d/200.59               # mol/d
depo_SOLPhg_kmol_y <-(depo_SOLPhg_mol_d/1000)*365        # kmol/y
#OK

mean(depo_SOLPhg_kmol_y)

#DEPOSIZIONE Phg AOL -> Sed
#depo m/day * g/m3 --> g/m2d
Vol_anox3<-1E+14
POM_AOLdepo_m_day<-POM_depos$Anoxic3   #depo m/day * depth(m) --> 1/day (0.003 /d)
silt_AOLdepo_m_day<-silt_depos$Anoxic3   # depo silt m/day  (0.014 /d)
fPOM_AOL<-mean(POMs$Anoxic3/(POMs$Anoxic3+silts$Anoxic3), na.rm=TRUE)
fsilt_AOL<-mean(silts$Anoxic3/(POMs$Anoxic3+silts$Anoxic3), na.rm=TRUE)

#  Vd
AOLdepo_g_m2_d<-(hgPOM_gm3$Anoxic3*POM_AOLdepo_m_day)+
  (hgsilt_gm3$Anoxic3*silt_AOLdepo_m_day)
AOLdepo_g_d_ok<-AOLdepo_g_m2_d*area  #g/d
AOLdepo_mol_d_ok<-AOLdepo_g_d_ok/200.59    
AOLdepo_kmol_y_ok<-(AOLdepo_mol_d_ok/1000)*365  

mean(tail(AOLdepo_kmol_y_ok,365))

depo_AOLmedia2<-POM_AOLdepo_m_day
depo_AOLmedia2 #

depo_AOLPhg_ug_m3_d<-depo_AOLmedia2*Phg_AOL       # 1/day *ug/m3 -> ug/m3d
depo_AOLPhg_g_d <-(depo_AOLPhg_ug_m3_d*area)/10^6   # g/d
depo_AOLPhg_mol_d <-depo_AOLPhg_g_d/200.59               # mol/d
depo_AOLPhg_kmol_y <-(depo_AOLPhg_mol_d/1000)*365        # kmol/y

mean(tail(OLdepo_kmol_y_ok,365))
mean(tail(SOLdepo_kmol_y_ok,365))
mean(tail(AOLdepo_kmol_y_ok,365))

depoohgp<-data.frame(rdate,OLdepo_kmol_y_ok,SOLdepo_kmol_y_ok,AOLdepo_kmol_y_ok)
write.csv(depoohgp, file='depoohgp.csv')

colMeans(depoohgp[2:4])

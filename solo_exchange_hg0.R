
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale/Anne1e_morehg_tris')
#  FLUSSI TRA BOX
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2/0.1")
#Anne1e_morehg_tris_pristine2
#Leggi dati e taglia gli ultimi anni dopo il 2013 hg<-hg[59536:59900,]
##il 2017 hg<-hg[59536:59900,]

hg<-read.csv("Dissolved_Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg<-hg[59536:59900,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hgT<-hgT[59536:59900,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip =1, sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOChg<-DOChg[59536:59900,1:13]

Phgs<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phgs)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); Phgs<-Phgs[59536:59900,1:13]
## Phg ngL

SEDhg<-read.csv("Total_Sorbed_Divalent_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(SEDhg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); SEDhg<-SEDhg[59536:59900,1:13]
## Sedhg ngg

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); mehg<-mehg[59536:59900,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOCmehg<-DOCmehg[59536:59900,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); mehgT<-mehgT[59536:59900,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg0<-hg0[59536:59900,1:13]

solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); solids<-solids[59536:59900,1:13]
tail(solids)

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

time.steps <- POMs[,1]
time.steps3 <- time.steps*24*3600
TEMPO <- as.POSIXct(time.steps3, tz= "GMT", origin = "1850-01-01")
TEMPO[1:10]
rdate<-as.Date(TEMPO, tz= "GMT", format="%Y")
tail(rdate,12)

OL1_vol_m3 <-5.9E+12; 			OL1_vol_L  <-OL1_vol_m3*1000
CIL_vol_m3 <-4.5E+12; 			CIL_vol_L  <-CIL_vol_m3*1000
oxy_vol_m3 <-5.9E+12; 			oxy_vol_L  <-oxy_vol_m3*1000
SOL_vol_m3 <-7.4E+12; 			SOL_vol_L  <-SOL_vol_m3*1000
UAL1_vol_m3 <-5.3E+13; 			UAL1_vol_L  <-UAL1_vol_m3*1000
DAOL_vol_m3 <-2.9E+14; 			DAOL_vol_L  <-DAOL_vol_m3*1000
BBL_vol_m3 <-1E+14; 			BBL_vol_L  <-BBL_vol_m3*1000
Sed1_vol<-8.8*10^9
Sed2_vol<-2*10^10

#   advection
9.513E-3
9.6715E-3*10^6*(60*60*24*365)

mcy<-305*10^9               # km3y *10^9-->m3/y
adv_gy<-mcy*(hgT$Oxycline/10^6)   # m3/y * g/m3   --> gy
adv_moly<-adv_gy/200.59
adv_kmoly<-adv_moly/1000
mean(tail(adv_kmoly,12))
plot(tail(adv_kmoly,12))

adv2_ugy<-mcy*hgT$Suboxic1
adv2_gy<-adv2_ugy/10^6
adv2_moly<-adv2_gy/200.59
adv2_kmoly<-adv2_moly/1000
mean(tail(adv2_kmoly,365))
mean(tail(adv_kmoly,365))-mean(tail(adv2_kmoly,365))

hgII<-hgT-hg0-mehg

diss_hgII<-hg+DOChg
diss_mehg<-DOCmehg+mehg
diss_hg_inor<-diss_hgII+hg0

ionic_hg_pM<-hg/200.59*1000
hgII_pM<-hgII/200.59*1000


### ....diffusion ..... 291600 
area<-296100000000
sed_diff<-10^-9 *60*60*24  #m2/s --> m2/d
eddy_d_OL<-(9.5*10^-6)*60*60*24 #m2/s-> m2/d
eddy_d_SOL<-(9.5*10^-6) *60*60*24
eddy_d_BBL<-(8.7^-6) *60*60*24

lenght_OL_SOL<-10
lenght_AOL_SOL<-10
lenght_AOL_Sed<-0.05

diss_hg_inor$Oxycline

HgT_OL_g_m3<-hg0$Oxycline/10^6    #OL4
HgT_SOL_g_m3<-hg0$Suboxic1/10^6       #  SOL
HgT_AOL_g_m3<-hg0$Suboxic2/10^6     # AOL1
HgT_BBL_g_m3<-hg0$Anoxic3 /10^6  #AOL4
HgD_BBL_g_m3<-hg0$Anoxic3 /10^6  #AOL4
HgD_Sed_g_m3<-hg0$Sed1 /10^6      # sEd

1968/163
2013-1850
A<-(eddy_d_OL *area)    #m2/d *m2  --> 1/d
B<-(eddy_d_SOL*area)   #m2/d *m2  --> 1/d
C<-(sed_diff  *area)     

conc_grad1<-(HgT_SOL_g_m3-HgT_OL_g_m3) #g/m3
conc_grad2<-(HgT_AOL_g_m3-HgT_SOL_g_m3) #g/m3
conc_grad3<-(HgD_BBL_g_m3-(HgD_Sed_g_m3/0.95)) #g/m3

diff_OL<- (A/lenght_OL_SOL)*conc_grad1;   ## g/d
diff_SOL<-(B/lenght_AOL_SOL)*conc_grad2;diff_SOL
#diff_AOL<-((eddy_d_AOL*area)/(lenght_AOL_Sed/0.9))*(HgD_Sed/0.9-HgD_AOL) #0.9 porosity
diff_Sed<-(C/(lenght_AOL_Sed/0.95))*conc_grad3 #g/d


diff_OL_mol_y<-(diff_OL*365)/200.59
diff_OL_kmol_y<-diff_OL_mol_y/10^3

mean(diff_OL_kmol_y)

diff_SOL_mol_y<-(diff_SOL/200.59)*365
diff_SOL_kmol_y<-diff_SOL_mol_y/10^3
mean(diff_SOL_kmol_y)

diff_Sed_mol_d<-(diff_Sed/200.59)
diff_Sed_mol_y<-diff_Sed_mol_d*365

diff_Sed_kmol_y<-diff_Sed_mol_y/10^3
mean(tail(diff_Sed_kmol_y,12))

#variazione conc OL kmol/y
str(diff_OL_kmol_y)

summary(tail(diff_OL_kmol_y,12))

plot(diff_OL_kmol_y)

#variazione SOL kmol/y
mean((diff_OL_kmol_y));
mean((diff_SOL_kmol_y)); 
mean((diff_Sed_kmol_y))

exchange<-data.frame(rdate,diff_OL_kmol_y,diff_SOL_kmol_y,diff_Sed_kmol_y)
write.csv(exchange, file='exchange_hg0.csv')




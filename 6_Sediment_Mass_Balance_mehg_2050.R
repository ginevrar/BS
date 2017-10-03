#setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e_morehg_tris")
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale/Anne1e_morehg_tris')
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2")

hg<-read.csv("Dissolved_Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
str(hg)
hg<-hg[3:2414,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT[3:2414,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip =1, sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg[3:2414,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg[3:2414,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg[3:2414,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0[3:2414,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehgT<-mehgT[3:2414,1:13]

POM_depos<-read.csv("POM_Dep_Vel.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POM_depos)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                    "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                    "Anoxic3","Sed1","Sed2")
POM_depos<-POM_depos[3:2414,1:13]

silt_depos<-read.csv("Silt_Dep_Vel.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silt_depos)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                     "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                     "Anoxic3","Sed1","Sed2")
silt_depos<-silt_depos[3:2414,1:13]

silts<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(silts)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                "Anoxic3","Sed1","Sed2")
silts<-silts[3:2414,1:13]

POMs<-read.csv("Organic_Matter.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(POMs)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
               "Suboxic1", "Suboxic2", "Anoxic1", "Anoxic2",
               "Anoxic3", "Sed1","Sed2")
POMs <-POMs[3:2414,1:13]

Pmehgs<-read.csv("Total_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Pmehgs)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Pmehgs <-Pmehgs[3:2414,1:13] #ng/L

TOTs<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(TOTs)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
TOTs <-TOTs[3:2414,1:13]

burial<-read.csv("Sediment_Burial_Velocity.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(burial)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                 "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                 "Anoxic3","Sed1","Sed2")
burial<-burial[3:2414,1:13]

volumes<-read.csv("Segment_Volume.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(volumes)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                  "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                  "Anoxic3","Sed1","Sed2")
volumes<-volumes[3:2414,1:13]

SEDmehg<-read.csv("Total_Sorbed_Methyl_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(SEDmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
SEDmehg<-SEDmehg[3:2414,1:13]  #ng/g

bulkD<-read.csv("Sediment_Bulk_Density.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(bulkD)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", 
                "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2",
                "Anoxic3","Sed1","Sed2")
bulkD<-bulkD[3:2414,1:13]


# unisco matrici del diss Hg
diss_mehg    <- DOCmehg+mehg
diss_mehg_pM <- diss_mehg/215*1000

# BILANCIO BURIAL g/m3 * ng/g  --> ng/m3
Model_area  <-2.961E+11

solids_sed1  <-TOTs$Sed1;       solids_sed2 <-TOTs$Sed2
SEDmehg_sed1 <-SEDmehg$Sed1;    SEDmehg_sed2   <-SEDmehg$Sed2   # SEDmehg (ng/g) * solid_sed (g/m3) --> PMeHg ng/m3
Pmehg_sed1     <-Pmehgs$Sed1;   Pmehg_sed2 <-Pmehgs$Sed2 #ng/L   or ug/m3
burial_sed1  <-burial$Sed1;     burial_sed2 <-burial$Sed2  #cm/y

solids_w  <-TOTs$Anoxic3

MeHg_sed1_ngm3  <- solids_sed1 *SEDmehg_sed1  #ng/g*g/m3
MeHg_sed2_ngm3  <- solids_sed2 *SEDmehg_sed2 
MeHg_sed1_gm3   <-MeHg_sed1_ngm3/10^9         #mg/m3->g/m3 hgP
MeHg_sed2_gm3   <-MeHg_sed2_ngm3/10^9

burial_sed1_m_y<-burial_sed1/10^2 ; str(burial_sed1_m_y)#cm/y-->m/y
burial_sed2_m_y<-burial_sed2/10^2 #cm/y-->m/y
burial_sed1_mm_y<-burial_sed1 *10 ; str(burial_sed1_mm_y)#cm/y-->mm/y
burial_sed2_mm_y<-burial_sed2 *10 ; str(burial_sed2_mm_y)#cm/y-->mm/y

MeHg_burial_sed1_g_m2_y<-MeHg_sed1_gm3*burial_sed1_m_y    #g/m3*m/y<-g/m2y
MeHg_burial_sed2_g_m2_y<-MeHg_sed2_gm3*burial_sed2_m_y

burial1_g_y<-MeHg_burial_sed1_g_m2_y*Model_area  #g/M2y*m2 -> g/y
burial2_g_y<-MeHg_burial_sed2_g_m2_y*Model_area

burial1_mol_y<-burial1_g_y/215; burial1_kmol_y<-burial1_mol_y/1000
burial2_kmol_y<-burial2_g_y/(215*1000)

burial1_media<-tapply(burial1_kmol_y,rep(1:(length(burial1_kmol_y)/12),each = 12), mean)
burial2_media<-tapply(burial2_kmol_y,rep(1:(length(burial2_kmol_y)/12),each = 12), mean)

burial1_cumul<-cumsum(burial1_media)
burial2_cumul<-cumsum(burial2_media)
summary(burial1_cumul);summary(burial2_cumul)
bb<-cbind(burial1_cumul,burial2_cumul)

#DEPOSIZIONE Phg
#depo m/day * depth(m) --> 1/day

Vol_anox3<-1E+14
POM_depo_1_day<-POM_depos$Anoxic3/350
silt_depo_1_day<-silt_depos$Anoxic3/350
fPOM<-mean(POMs$Anoxic3/TOTs$Anoxic3, na.rm=TRUE)
fsilt<-mean(silts$Anoxic3/TOTs$Anoxic3, na.rm=TRUE)

depo_media1<-POM_depo_1_day
mean(depo_media1) # 0.005 /d

depo_Pmehg_ug_m3_d <-depo_media1*Pmehgs$Anoxic3    #1/day *ug/m3 ->ug/m3d
depo_Pmehg_g_d     <-(depo_Pmehg_ug_m3_d*Vol_anox3)/10^6   #ug/m3d
depo_Pmehg_mol_d   <-depo_Pmehg_g_d/215
depo_Pmehg_kmol_y  <-(depo_Pmehg_mol_d/1000)*365;mean(depo_Pmehg_kmol_y[1957:1968])
plot(depo_Pmehg_kmol_y)


media1_depo_kmol_y <-tapply(depo_Pmehg_kmol_y,rep(1:(length(depo_Pmehg_kmol_y)/12),each = 12), mean)
plot(media1_depo_kmol_y)

#DIFFUSIONE
Oxic1_vol_m3 <- 5.9E+12  
Oxic1_vol_L <-Oxic1_vol_m3*1000
Vol_Sed1_m3<-volumes$Sed1 *10^6;  str(Vol_Sed1_m3)
Vol_Sed2_m3<-volumes$Sed2 *10^6;  str(Vol_Sed2_m3); 

Sed1_g_m3  <- TOTs$Sed1;              	Sed2_g_m3 <- TOTs$Sed2
Sed1_g     <-Sed1_g_m3*Vol_Sed1_m3;     Sed2_g<-Sed2_g_m3*Vol_Sed2_m3
cm3_sed1   <-Sed1_g/2.43;               cm3_sed2<-Sed2_g/2.43
m3_sed1    <-cm3_sed1/10^6;             m3_sed2<-cm3_sed2/10^6
m3_PW1     <-Vol_Sed1_m3-m3_sed1;       m3_PW2<-Vol_Sed2_m3-m3_sed2
PW1_L      <- m3_PW1*1000;              PW2_L<- m3_PW2*1000

mehg_kg_s1<-tail(MeHg_sed1_ngm3*m3_sed1/10^12)
mehg_kg_s2<-tail(MeHg_sed2_ngm3*m3_sed2/10^12)

mehg_kmol_s1<-mehg_kg_s1/215
mehg_kmol_s2<-hg_kg_s2/215;mehg_kmol_s2
mehg_kmol_s2+mehg_kmol_s1

bulk1<-bulkD$Sed1;bulk2<-bulkD$Sed2
dryd1<-0.097;dryd2<-0.2425

porosity1<-bulk1-dryd1;porosity2<-bulk2-dryd2

Diffusion_coeff<-10^-9             #m2/s
DF<-Diffusion_coeff*60*60*24       #m2/day
#     ng/L to g/m3
deep_w_mehg<- diss_mehg$Anoxic3      #diss hg ngL Bottom water
deep_w_mehg_gm3<-deep_w_mehg/10^6 

PWmehg1_ngL<-diss_mehg$Sed1; PWmehg2_ngL<-diss_mehg$Sed2  #diss hg ngL SED
PWmehg1_ngm3<-PWmehg1_ngL*PW1_L/Vol_Sed1_m3
PWmehg2_ngm3<-PWmehg2_ngL*PW2_L/Vol_Sed2_m3
PWmehg1_gm3<-PWmehg1_ngm3/10^9; PWmehg2_gm3<-PWmehg2_ngm3/10^9

par(mfrow=c(1,1))
plot(deep_w_mehg, col="darkblue",type="l", ylim=c(0,1.3), ylab="ng/L")
par(new=TRUE)
plot(PWmehg1_ngL, col="orange",type="l", ylim=c(0,1.3), ylab="ng/L")
par(new=TRUE)
plot(PWmehg2_ngL, col="brown",type="l", ylim=c(0,1.3), ylab="ng/L")
legend(0,1.2,pch=19, col=c("darkblue", "orange", "brown"), 
       legend=c("deep w", "PW1", "PW2"))
	   
PWmehg1_ng<-PWmehg1_ngL*PW1_L
PWmehg2_ng<-PWmehg2_ngL*PW2_L
PWmehg1_g<-PWmehg1_ng/10^9
PWmehg2_g<-PWmehg2_ng/10^9
PWmehg1_kmol<-PWmehg1_g/(215*1000)
PWmehg2_kmol<-PWmehg2_g/(215*1000)
tail (PWmehg1_kmol)
tail (PWmehg2_kmol)   
# per mol di diffusione importante Length of exchange (=depth sediment..?)
#diffusione >0 --> verso h20 (su)
#      diff <0 --> verso sedimento     (giu)
term1<-(DF*Model_area*porosity1)/(0.03/porosity1)  # m2/day*m2/m -->m3/day
term2<-(PWmehg1_gm3/porosity1)-(deep_w_mehg_gm3)       # g/m3
diffusion_g_day<-term1*term2; plot(diffusion_g_day)                       # m3/day*g/m3--> g/day   
diffusion_g_m2_day<-diffusion_g_day/Model_area
diffusion_mol_m2_day<-diffusion_g_m2_day/215
diffusion_umol_m2_y<-diffusion_mol_m2_day*10^6*365; summary(diffusion_umol_m2_y); diffusion_kmol_day<-diffusion_g_day/(215*1000)
diffusion_kmol_y<-diffusion_kmol_day*365
diffusion_kmol_y_media<-tapply(diffusion_kmol_y,rep(1:(length(diffusion_kmol_y)/12),each = 12), mean)
diffusion_kmol_cumul<-cumsum(diffusion_kmol_y_media)
tail(diffusion_kmol_cumul)
plot(diffusion_kmol_y_media); tail(diffusion_kmol_y_media,3)

term1b<-(DF*Model_area*porosity2)/(0.05/porosity2)
term2b<-(PWmehg2_gm3/porosity2)-(PWmehg1_gm3/porosity1)  #sempre < 0 (giu - da sed1 a sed2)
diffusion_sed_to_sed_g_day<-term1b*term2b   #g/day

diffusion_sed_to_sed_kmol_day<-diffusion_sed_to_sed_g_day/(215*1000)
diffusion_sed_to_sed_kmol_y<-diffusion_sed_to_sed_kmol_day*365
diffusion_sed_to_sed_kmol_y_media<-tapply(diffusion_sed_to_sed_kmol_y,rep(1:(length(diffusion_sed_to_sed_kmol_y)/12),each = 12), mean)
diffusion_sed_to_sed_kmol_cumul<-cumsum(diffusion_sed_to_sed_kmol_y_media)
tail(diffusion_sed_to_sed_kmol_cumul)

sed_balance<-cbind(media1_depo_kmol_y,burial1_media,
                   burial2_media,diffusion_kmol_y_media,diffusion_sed_to_sed_kmol_y_media)

sed_balance_long<-cbind(depo_Pmehg_kmol_y, burial1_kmol_y, burial2_kmol_y,
                        diffusion_kmol_y, diffusion_sed_to_sed_kmol_y)
getwd()
write.csv(sed_balance, file="aasediment_input_output_medie_mehg_2050.csv")
write.csv(sed_balance_long , file="aasediment_input_output_mehg_2050.csv")




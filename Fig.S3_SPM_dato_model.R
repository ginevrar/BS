
setwd("C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/implementazione/nuovi_script")
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale2')
Clean_data<-read.table('Dataset_Finale_new_no_bosforo.txt', header=T)
str(Clean_data)
#Bac(670) = 0.992*Bac(660)-0.0039 (Karageorgis et al., 2008)
##PM = 1.01998*cpm + 0.07261 (Karageorgis & Anagnostou, 2003)
TSM_mgL1<-Clean_data$BAC**0.992-0.0039
TSM_mgL<-TSM_mgL1*1.09104+0.08045

A<-data.frame(TSM_mgL, Clean_data$sigma, Clean_data$Station)
names(A)<-c("TSM","Density", "Station")
summary(TSM_mgL)
summary(Clean_data$sigma)
sed_rate_calvert_mm_y<-15.9/100
Accum_rate_calvert_g_m2_y<-(38.7+35.7)/2
OC_perc<-(6.04+5.07)/2
OM_perc<-OC_perc*1.88
org_accum_rate_gC_m2_y<-(2.16+1.81)/2

#----MODELLO
#setwd("C:/Users/Ginevra/Google Drive/BlackSea/14_giugno_RUNS/RUN_OM_settling_oxidation/LAST/new_met/FInale_inorganicB")
#setwd("C:/Users/Ginevra/Google Drive/BlackSea/model_9layer/anox2/tris")
#setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0/lower/new4")
setwd("C:\\Users\\Ginevra\\Desktop\\new_sim_BS\\19_luglio\\SIM_finale2\\Anne1e_morehg_tris")
#lower/new4")
setwd("C:\\Users\\gi\\Documents\\Lavoro\\SIM_finale2\\Anne1e_morehg_tris")

SPM<-read.csv("Total_Solids.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(SPM)<-c("Time","Oxic1","Oxic2","CIL","Oxycline", 
              "Suboxic1","Suboxic2","Anoxic1","Anoxic2",
              "Anoxic3","Sed1","Sed2")
fine_SPM<-tail(SPM,54)

silt<-read.csv("Silts_Fines.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(silt)<-c("Time","Oxic1","Oxic2","CIL","Oxycline", 
               "Suboxic1","Suboxic2","Anoxic1","Anoxic2",
               "Anoxic3","Sed1","Sed2")

vol<-read.csv("Segment_Volume.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(vol)<-c("Time","Oxic1","Oxic2","CIL","Oxycline", 
              "Suboxic1","Suboxic2","Anoxic1","Anoxic2",
              "Anoxic3","Sed1","Sed2")

plot(vol$Sed1, type='l')
plot(vol$Sed2, type='l')



solidi <-c(layer1<-mean(fine_SPM$Oxic1, na.rm=TRUE),
           layer2<-mean(fine_SPM$Oxic2, na.rm=TRUE),
           layer3<-mean(fine_SPM$CIL, na.rm=TRUE),
           layer4<-mean(fine_SPM$Oxycline, na.rm=TRUE),
           layer5<-mean(fine_SPM$Suboxic1, na.rm=TRUE),
           layer6<-mean(fine_SPM$Suboxic2, na.rm=TRUE),
           layer7<-mean(fine_SPM$Anoxic1, na.rm=TRUE),
           layer8<-mean(fine_SPM$Anoxic2, na.rm=TRUE),
           layer9<-mean(fine_SPM$Anoxic3, na.rm=TRUE))
str(solidi)
OM<-read.csv("Organic_Matter.csv",
             header=FALSE, skip = 1,sep = ",", dec=".")

names(OM)<-c("Time","Oxic1","Oxic2","CIL","Oxycline", 
             "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2", 
             "Anoxic3","Sed1","Sed2")

fine_OM<-tail(OM,54)

om <-c(layer1<-mean(fine_OM$Oxic1),
       layer2<-mean(fine_OM$Oxic2),
       layer3<-mean(fine_OM$CIL),
       layer4<-mean(fine_OM$Oxycline),
       layer5<-mean(fine_OM$Suboxic1),
       layer6<-mean(fine_OM$Suboxic2),
       layer7<-mean(fine_OM$Anoxic1),
       layer8<-mean(fine_OM$Anoxic2),
       layer9<-mean(fine_OM$Anoxic3))

prof<-c(11.4525,
        13.3275,
        14.715,
        15.41,
        15.92,
        16.41,
        16.83,
        17.14,
        17.24346653)

sand<-read.csv("Sands.csv",
               header=FALSE, skip = 1,sep = ",", dec=".")

names(sand)<-c("Time","Oxic1","Oxic2","CIL","Oxycline", 
               "Suboxic1","Suboxic2", "Anoxic1", "Anoxic2", 
               "Anoxic3","Sed1","Sed2")

#conc g/m3 * m/day -> g/m2d
OM_acc_rate<-OM$Anoxic3*1      #g/m2d
silt_acc_rate<-silt$Anoxic3*5  #g/m2d
OM_acc_g_m2_y<-OM_acc_rate*365
silt_acc_g_m2_y<-silt_acc_rate*365
TOT_acc_rate<-cbind(silt_acc_g_m2_y,OM_acc_g_m2_y)

tail(OM_acc_g_m2_y)
tail(silt_acc_g_m2_y)

sed_rate_calvert_mm_y<-15.9/100
Accum_rate_calvert_g_m2_y<-(38.7+35.7)/2
organic_perc<-(6.04+5.07)/2
org_accum_rate_gC_m2_y<-(2.16+1.81)/2

#12.495  average density for layers
#14.71
#15.005
#15.69
#16.15
#16.465
#16.785
#17.125

layer<-data.frame(solidi,prof)
str(prof)

y2<-c(10.5,11.5,12.5,13.5,14.5,15.5,
      16.5,17, 17.5)
y<-c(11,12,13,14,15,16,17)

setwd("C:\\Users\\gi\\Desktop")
tiff('SPM_dato_model.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), cex.axis=1.2, cex.lab=1.3,
    cex.main=1.4,mar=c(5.1, 5.5, 3.1, 1.1), bty='n')

plot(A$TSM, A$Density, ylim=c(17.25,10.5),  type="p", xlim=c(0,.7),yaxt='n',
     ylab='', xlab=" ",cex=2.6,xaxt='n',
     pch=21, col="#008224", bg="#00822422")
abline(h=15.64,   lty=2, col='grey60')
abline(h=16.2,   lty=2, col='grey60')
par(new=TRUE)
plot(layer$solidi, layer$prof, col="black",ylim=c(17.25,10.5),
     main="Suspended Particulate Matter", lty=3,yaxt='n',
     cex.axis=1.8, cex.main=1.8,
     type="b",pch=17,cex=4, bty='n', xlim=c(0,.7),
     ylab=" ", xlab=" ")
legend(0.5,10.6, cex=1.8,col=c("#008224","black"),pt.bg=c("#00822433",'black'),
       legend=c( "estimated \n from BAC","model"), pch=c(21,17))
text(.5,13,'OL', cex=2, font=2)
text(.5,15.9,'SOL', cex=2, font=2)
text(.5,16.6,'AOL', cex=2, font=2)
axis(2, at=y,line=0, col="black", cex.axis=1.8 )
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.8)
mtext(expression(paste(sigma[theta]*'  (kg m'^-3*')')), 2, line=3,
      at=14,col="black", cex=2)
#abline(h=13,lty=3,col='gray')
mtext(expression('mg L'^-1), 1, line=4,at=.35,col="black", cex=1.8)
dev.off()
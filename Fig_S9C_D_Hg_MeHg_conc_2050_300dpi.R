getwd()
#wd('C:/Users/gi/Dropbox/29_Luglio/Anoxic3c/ore17')
setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")

hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg<-hg [3:2414,1:12]; str(hg$Time)
solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-Phg [3:2414,1:12]
DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg [3:2414,1:12]
mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg [3:2414,1:12]
DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg [3:2414,1:12]
hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0 [3:2414,1:12]
mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehgT<-mehgT [3:2414,1:12]
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [3:2414,1:12]
Temp<-read.csv('Segment_Temperature.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(Temp)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Temp<-Temp [3:2414,1:12]

Temp<-tail(Temp,36)

hg0_fM<-tail(hg0,36)/200.59*10^6
hg0a<-mean(hg0_fM$Oxic1)
hg0b<-mean(hg0_fM$Oxic2)
hg0c<-mean(hg0_fM$CIL)
hg0d<-mean(hg0_fM$Oxicline)
hg0e<-mean(hg0_fM$Suboxic1)
hg0f<-mean(hg0_fM$Suboxic2)
hg0h<-mean(hg0_fM$Anoxic)
hg0i<-mean(hg0_fM$Anoxic2)
hg0l<-mean(hg0_fM$Anoxic3)
hg0_layer<-c(hg0a,hg0b,hg0c,hg0d,hg0e,hg0f,hg0h,hg0i,hg0l)
plot(hg0_layer)

range(hg0_fM$Oxic1)
plot(hg0_fM$Oxic1, xlim=c(0,36), col='red')
par(new=T)
plot(Temp$Oxic1, type='b',xlim=c(0,36), col='red')
par(new=T)
plot(tail(hgdiss_pM$Oxic1,36),xlim=c(0,36), col='royalblue', type='b')
par(new=T)
plot(tail(mehgdiss_pM$Oxic1,36),xlim=c(0,36), col='hotpink', type='b')
par(new=T)
plot(tail(mehgT$Oxic1,36),xlim=c(0,36), col='orange', type='b')

plot(Temp$Oxic1, type='b',xlim=c(0,36), col='red')
par(new=T)
plot(tail(mehgT$Oxic2,36),xlim=c(0,36), col='orange', type='b')
par(new=T)
plot(tail(mehgT$Oxic1,36),xlim=c(0,36), col='hotpink', type='b')
par(new=T)
plot(tail(mehgT$CIL,36),xlim=c(0,36), col='blue', type='b')
par(new=T)
plot(tail(mehgT$Suboxic1,36),xlim=c(0,36), col='green', type='b')
par(new=T)
plot(tail(mehgT$Anoxic,36),xlim=c(0,36), col='darkgreen', type='b')

a<-c(2.1,2,3)
ax2<-(seq(1850,2050,by=1))
str(ax2)

setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/BlackSea_IIDraft/submission_figures")

tiff('Fig.7d_mEHg_conc.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1)) 
plot(mehgT$Oxic1/215*1000, col="deepskyblue", ylab=" ", ylim=c(0,0.8),
     xlab=" ", main=expression("MeHg"[T]*" concentrations in the model layers"),
     cex.main=1.5, type="l",lwd=1.5,lty=1, xaxt='n', cex.axis=1.4)
par(new=TRUE)
plot(mehgT$Oxic2/215*1000, ylim=c(0,0.8), col="dodgerblue", 
     ylab="MeHg (pM)", cex.lab=1.4, xlab="year", yaxt='n',type="l",lwd=1.5,lty=2, xaxt='n')
par(new=TRUE)
plot(mehgT$CIL/215*1000, ylim=c(0,0.8), col="#feb24c", ylab=" ", 
     xlab=" ", type="l",lwd=1.5, yaxt='n',lty=3,  xaxt='n')
par(new=TRUE)
plot(mehgT$Oxycline/215*1000, ylim=c(0,0.8), col="#225ea8", 
     ylab=" ", xlab=" ", type="l",yaxt='n',lwd=1.5,lty=4,  xaxt='n')
par(new=TRUE) 
plot(mehgT$Suboxic1/215*1000, ylim=c(0,0.8), col="#addd8e", 
     ylab="   ", xlab="   ", xaxt='n', type="l",lwd=1.5,yaxt='n',lty=5) 
par(new=TRUE)
plot(mehgT$Suboxic2/215*1000, ylim=c(0,0.8), col="lightslategray", 
     ylab=" ", xlab=" ", type="l", xaxt='n',lwd=1.5,yaxt='n',lty=1) 
par(new=TRUE)
plot(mehgT$Anoxic/215*1000, ylim=c(0,0.8), col="darkslategray", 
     ylab=" ", xlab=" ", type="l",lwd=1.5,lty=2, yaxt='n',xaxt='n')
par(new=TRUE)
plot(mehgT$Anoxic2/215*1000,  ylim=c(0,0.8), col="#fc4e2a", 
     ylab=" ", xlab=" ", type="l",lwd=1.5,lty=3, yaxt='n',xaxt='n')
par(new=TRUE)
plot(mehgT$Anoxic3/215*1000, ylim=c(0,0.8), col="#800026", 
     ylab=" ", xlab=" ", type="l",lwd=1.5,lty=4, yaxt='n',xaxt='n')

text(950,.19,'PHOT1', col='deepskyblue', cex=1.6,font=3)
text(950,.04,'PHOT2', col='dodgerblue', cex=1.6,font=3)
text(1500,0.09,'CIL', col='#feb24c', cex=1.6,font=3)
text(2100,0.04,'OXCL', col='#225ea8', cex=1.6,font=3)
text(2100,.28,'SOL', col='#addd8e', cex=1.6,font=3)
text(1800,.45,'UAOL1', col='lightslategray', cex=1.6,font=3)
text(2200,.55,'UAOL2', col='darkslategray', cex=1.6,font=3)
text(1400,.7,'DAOL', col='#fc4e2a', cex=1.6,font=3)
text(1800,.8,'BBL', col='#800026', cex=1.6,font=3)
#
dev.off()
#end(50,1, pch=19,legend=c("Euphotic1","Euphotic2","CIL",'Oxycline',
 #                                "SOL" ,"UAOL1", "UAOL2",
  #                               "DAOL", "BBL"),
   ##    col=c('deepskyblue', 'dodgerblue','#225ea8','#bdbdbd',
     #        '#addd8e','#41ab5d','#feb24c','#fc4e2a','#800026'), 
      # lty=c(1,2,3,4,5,1,2,3,4))
#abline(v=1970,col='red')
#abline(v=2013)
tiff('Fig.7C_Hgt_conc.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1)) 
plot(hgT$Oxic1/200.59*1000, col="deepskyblue",ylim=c(0,4),
     ylab="Hg (pM)", xlab="year",
     main=expression("Hg"[T]*" concentrations in the model layers"),
     cex.lab=1.4, cex.main=1.5,cex.axis=1.3,
     type="l",lwd=1.5,lty=1, xaxt='n')
par(new=TRUE)
plot(hgT$Oxic2/200.59*1000, ylim=c(0,4), col="dodgerblue",  ylab=" ", xlab="",
      type="l",lwd=1.5,lty=2,yaxt='n', xaxt='n')
par(new=TRUE)
plot(hgT$CIL/200.59*1000, ylim=c(0,4), col='#feb24c', ylab=" ", 
     xlab=" ", type="l",lwd=1.5,lty=3, yaxt='n', xaxt='n')
par(new=TRUE)
plot(hgT$Oxycline/200.59*1000, ylim=c(0,4), col="#225ea8", 
     ylab=" ", xlab="",cex.lab=1.2, type="l",lwd=1.5,lty=4, yaxt='n', xaxt='n')
par(new=TRUE) 
plot(hgT$Suboxic1/200.59*1000, ylim=c(0,4), col="#addd8e", 
     ylab="   ", xlab="   ", xaxt='n',yaxt='n', type="l",lwd=1.5,lty=5) 
par(new=TRUE)
plot(hgT$Suboxic2/200.59*1000, ylim=c(0,4), col="lightslategray",yaxt='n', 
     ylab=" ", xlab=" ", type="l", xaxt='n',lwd=1.5,lty=1) 
par(new=TRUE)
plot(hgT$Anoxic/200.59*1000, ylim=c(0,4), col="darkslategray", 
     ylab=" ", xlab=" ", type="l",lwd=1.5,lty=2, yaxt='n',xaxt='n')
par(new=TRUE)
plot(hgT$Anoxic2/200.59*1000,  ylim=c(0,4), col="#fc4e2a", 
     ylab=" ", xlab=" ", type="l",lwd=1.5,yaxt='n',lty=3, xaxt='n')
par(new=TRUE)
plot(hgT$Anoxic3/200.59*1000, ylim=c(0,4), col="#800026", 
     ylab=" ", xlab=" ", xaxt='n',yaxt='n', type="l",lwd=1.5,lty=4)

text(160,1.7,'PHOT1', col='deepskyblue', cex=1.6,font=3)
text(800,2.3,'PHOT2', col='dodgerblue', cex=1.6,font=3)
text(600,0.4,'CIL', col='#feb24c', cex=1.6,font=3)
text(1000,0.7,'OXCL', col='#225ea8', cex=1.6,font=3)
text(1600,1.5,'SOL', col='#addd8e', cex=1.6,font=3)
text(1300,3.5,'UAOL1', col='lightslategray', cex=1.6,font=3)
text(2200,2.7,'UAOL2', col='darkslategray', cex=1.6,font=3)
text(1800,3.7,'DAOL', col='#fc4e2a', cex=1.6,font=3)
text(2200,3.95,'BBL', col='#800026', cex=1.6,font=3)
#
#
dev.off()









#legend(-1,4.1, pch=19,legend=c("Euphotic1","Euphotic2","CIL",'Oxycline',
   #                              "SOL" ,"UAOL1", "UAOL2",
    #                             "DAOL", "BBL"),
      # col=c('deepskyblue', 'dodgerblue','#225ea8','#bdbdbd',
        #     '#addd8e','#41ab5d','#feb24c','#fc4e2a','#800026'),
 #      cex=1.15)



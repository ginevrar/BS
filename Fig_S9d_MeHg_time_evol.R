setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")

hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg<-hg[2:1969,1:12]
solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-Phg[2:1969,1:12]
DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg[2:1969,1:12]
mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg[2:1969,1:12]
DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg[2:1969,1:12]
hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0[2:1969,1:12]

hgdiss<-(mehg+DOCmehg)   #DOChg+hg+ hg0
str(hgdiss$Oxic1)
 hgdiss_pM<-hgdiss/215*1000
 hgdiss_pM<-hgdiss_pM[1:dim(hgdiss_pM)[1],]
str(hgdiss_pM$Oxic1)

hgdiss_pM <- cbind(hgdiss_pM, class=rep(1:(dim(hgdiss_pM)[1]/12), each =12))
str(hgdiss_pM$Oxic1)
summary(hgdiss_pM)

hgdiss_pM_mean<-aggregate(hgdiss_pM[,1:((dim(hgdiss_pM)[2])-2)], by=list(hgdiss_pM$class),mean)

hgdiss_pM_mean$Oxic1

#plot(hgdiss_pM_mean$Oxic1, type='l')        

summary(DOChg)
summary(hg)
ax2<-(seq(1850,2013,by=1))
str(ax2)


dev.new()
par(mfrow=c(1,1)) 
plot(ax2, hgdiss_pM_mean$Oxic1, col="deepskyblue", ylab=" ", ylim=c(0,.9),
     xlab=" ", main=expression("Concentrations of MeHg"[D]*" in the model layers"),
     type="l",lwd=2,lty=1, xaxt='n', yaxt='n')
par(new=TRUE)
plot(ax2, hgdiss_pM_mean$Oxic2, ylim=c(0,.9), col="dodgerblue", 
     ylab="MeHg (pM)", xlab=" ", type="l",lwd=2,lty=2, xaxt='n', yaxt='n')
par(new=TRUE)
plot(ax2, hgdiss_pM_mean$CIL, ylim=c(0,.9), col="#225ea8", ylab=" ", 
     xlab=" ", type="l",lwd=2,lty=3, xaxt='n', yaxt='n')
par(new=TRUE)
plot(ax2, hgdiss_pM_mean$Oxycline, ylim=c(0,.9), col="#bdbdbd", 
     ylab=" ", xlab="Time (years)", type="l",lwd=2,lty=4, xaxt='n', yaxt='n')
par(new=TRUE) 
plot(ax2, hgdiss_pM_mean$Suboxic1, ylim=c(0,.9), col="#addd8e", 
     ylab="   ", xlab="   ", type="l",lwd=2,lty=5, xaxt='n', yaxt='n') 
par(new=TRUE)
plot(ax2, hgdiss_pM_mean$Suboxic2, ylim=c(0,.9), col="#41ab5d", 
     ylab=" ", xlab=" ", type="l",lwd=2,lty=1, xaxt='n', yaxt='n') 
par(new=TRUE)
plot(ax2, hgdiss_pM_mean$Anoxic, ylim=c(0,.9), col="#feb24c", 
     ylab=" ", xlab=" ", type="l",lwd=2,lty=2, xaxt='n', yaxt='n')
par(new=TRUE)
plot(ax2, hgdiss_pM_mean$Anoxic2,  ylim=c(0,.9), col="#fc4e2a", 
     ylab=" ", xlab=" ", type="l",lwd=2,lty=3, xaxt='n', yaxt='n')
par(new=TRUE)
plot(ax2, hgdiss_pM_mean$Anoxic3, ylim=c(0,.9), col="#800026", 
     ylab=" ", xlab=" ", type="l",lwd=2,lty=4)

legend(1850,.85, pch=19,legend=c("Euphotic1","Euphotic2","CIL",'Oxycline',
                                 "SOL" ,"UAOL1", "UAOL2",
                               "DAOL", "BBL"),
       col=c('deepskyblue', 'dodgerblue','#225ea8','#bdbdbd',
             '#addd8e','#41ab5d','#feb24c','#fc4e2a','#800026'), 
       lty=c(1,2,3,4,5,1,2,3,4))
#abline(v=1970)
#abline(v=2000, col=2)
#abline(h=0.598687)
#as.numeric(tapply(river_mehg_kmol_y,rep(1:(length(river_mehg_kmol_y)/12), each = 12), mean))

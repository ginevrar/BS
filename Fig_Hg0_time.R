getwd()
#wd('C:/Users/gi/Dropbox/29_Luglio/Anoxic3c/ore17')

setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine")

hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg<-hg [2:2413,]; str(hg)
solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Phg<-Phg [2:2413,]
DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg [2:2413,]
mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg [2:2413,]
DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg [2:2413,]
hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hg0<-hg0 [2:2413,]
mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehgT<-mehgT [2:2413,]
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
Temp<-read.csv('Segment_Temperature.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(Temp)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Temp<-Temp [2:2413,]

Temp<-tail(Temp,36)

hg0_pM<-(hg0)/200.59*10^3


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

#setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/BlackSea_IIDraft/submission_figures")
ax2<-(seq(1850,2050, by=.08291874))

tiff('Fig_Hg0_conc.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(4.5,5,4,1), bty='n') 
plot(ax2,hg0_pM$Oxic1, col="deepskyblue", ylab=" ", ylim=c(0,0.4),
     xlab=" ", main=expression("Hg"^0*" concentrations in the model layers"),
     cex.main=2.5,type="l",lwd=1.5,lty=1, xaxt='n', cex.axis=2)
par(new=TRUE)
plot(ax2,hg0_pM$Oxic2, ylim=c(0,0.4), col="dodgerblue", 
     ylab="pM", cex.lab=2, xlab="year", yaxt='n',type="l",lwd=1.5,lty=2, xaxt='n')
par(new=TRUE)
plot(ax2,hg0_pM$CIL, ylim=c(0,0.4), col="#feb24c", ylab=" ", 
     xlab=" ", type="l",lwd=1.5, yaxt='n',lty=3,  xaxt='n')
par(new=TRUE)
plot(ax2,hg0_pM$Oxycline, ylim=c(0,0.4), col="#225ea8", 
     ylab=" ", xlab=" ", type="l",yaxt='n',lwd=1.5,lty=4,  xaxt='n')
par(new=TRUE) 
plot(ax2,hg0_pM$Suboxic1, ylim=c(0,0.4), col="#addd8e", 
     ylab="   ", xlab="   ", xaxt='n', type="l",lwd=1.5,yaxt='n',lty=5) 
par(new=TRUE)
plot(ax2,hg0_pM$Suboxic2, ylim=c(0,0.4), col="lightslategray", 
     ylab=" ", xlab=" ", type="l", xaxt='n',lwd=1.5,yaxt='n',lty=1) 
par(new=TRUE)
plot(ax2,hg0_pM$Anoxic, ylim=c(0,0.4), col="darkslategray", 
     ylab=" ", xlab=" ", type="l",lwd=1.5,lty=2, yaxt='n',xaxt='n')
par(new=TRUE)
plot(ax2,hg0_pM$Anoxic2,  ylim=c(0,0.4), col="#fc4e2a", 
     ylab=" ", xlab=" ", type="l",lwd=1.5,lty=3, yaxt='n',xaxt='n')
par(new=TRUE)
plot(ax2,hg0_pM$Anoxic3, ylim=c(0,0.4), col="#800026", 
     ylab=" ", xlab=" ", type="l",lwd=1.5,lty=4, yaxt='n',xaxt='n')

axis(1,at=c(1850,1900,1950,2000,2050),labels=T, cex.axis=2)

text((1850+95.0-10),.19,'PHOT1', col='deepskyblue', cex=2.5,font=3)
text((1850+95.0-10),.01,'PHOT2', col='dodgerblue', cex=2.5,font=3)
text((1850+150.0-20),0.07,'CIL', col='#feb24c', cex=2.5,font=3)
text((1850+210.0-40),0.02,'OXCL', col='#225ea8', cex=2.5,font=3)
text((1850+210.0-40),.31,'SOL', col='#addd8e', cex=2.5,font=3)
text((1850+60.0-40),.45,'UAOL1', col='lightslategray', cex=2.5,font=3)
text((1850+200.0-30),.45,'UAOL2', col='darkslategray', cex=2.5,font=3)
text((1850+100.0-20),.6,'DAOL', col='#fc4e2a', cex=2.5,font=3)
text((1850+150.0-20),.79,'BBL', col='#800026', cex=2.5,font=3)
#
dev.off()



oxic_conc_pM1<-data.frame(hg0_pM$Oxic1,hg0_pM$Oxic2,hg0_pM$CIL,hg0_pM$Oxycline)
oxic_conc_pM<-rowMeans(oxic_conc_pM1)
sd_ox<-apply( oxic_conc_pM1, 1, sd ) 
dat<-data.frame(ax2,oxic_conc_pM,sd_ox)
ses<-oxic_conc_pM+outer(sd_ox, c(1,-1))

anoxic_conc_pM1<-data.frame(hg0_pM$Suboxic2,hg0_pM$Anoxic,hg0_pM$Anoxic2,hg0_pM$Anoxic3)
anoxic_conc_pM<-rowMeans(anoxic_conc_pM1)
sd_anox<-apply( anoxic_conc_pM1, 1, sd ) 
dat2<-data.frame(ax2,anoxic_conc_pM,sd_anox)
ses2<-anoxic_conc_pM+outer(sd_anox, c(1,-1))

oc<-mean(oxic_conc_pM[1957:1968])
empty_v1<-rep('NA',2412)
empty_v1[1957]<- oc

sub_pM<-hg0_pM$Suboxic1
sc<-mean(sub_pM[1957:1968])
empty_v2<-rep('NA',2412)
empty_v2[1957]<- sc

ac<-mean(anoxic_conc_pM[1957:1968])
empty_v3<-rep('NA',2412)
empty_v3[1957]<- ac
str(empty_v3)



oxic_conc_pM_media   <-tapply(oxic_conc_pM,rep(1:(length(oxic_conc_pM)/12),each = 12), mean)
suboxic_conc_pM_media   <-tapply(sub_pM,rep(1:(length(sub_pM)/12),each = 12), mean)
anoxic_conc_pM_media   <-tapply(anoxic_conc_pM,rep(1:(length(anoxic_conc_pM)/12),each = 12), mean)

  all<-data.frame(oxic_conc_pM_media,suboxic_conc_pM_media,anoxic_conc_pM_media)
as.numeric(oxic_conc_pM_media[164] )-as.numeric(oxic_conc_pM_media[165] )
as.numeric(oxic_conc_pM_media[165] )-as.numeric(oxic_conc_pM_media[166] )


write.table(all, 'hgo_pM.txt')

tiff('Fig.Hg0_3layer.tiff', height=14.5, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(4.5,5,4,1), bty='n') 
with(dat, 
     plot(ax2, oxic_conc_pM, type="l",col='#00BFFF', lwd=2,cex.main=2.3, ylim=c(0,0.4),ylab='',xlab='',
          main=expression("Modeled Hg"^0*" concentrations"),xaxt='n',yaxt='n', panel.first=polygon(c(ax2,rev(ax2)), c(ses[,1],rev(ses[,2])),border=NA, col="#7fdfff")))
par(new=TRUE)
plot(ax2,empty_v1, type='p', xlab= " ", ylab= "pM ", pch=23, cex=4.5,  cex.axis=2, cex.lab=2,
     ylim=c(0,0.4), bg='#0098cc',col='black')
par(new=TRUE)
plot(ax2,hg0_pM$Suboxic1, ylim=c(0,0.4), col="chartreuse3", lwd=2,
     ylab="   ", xlab="   ", xaxt='n', type="l",yaxt='n',lty=1) 
par(new=TRUE)
plot(ax2,empty_v2, type='p', xlab= " ", ylab= " ", pch=23, cex=4.5, xaxt='n',yaxt='n', 
     ylim=c(0,0.4), bg='chartreuse4',col='black')
par(new=TRUE)
with(dat2, plot(ax2, anoxic_conc_pM, lwd=2,type="l",xaxt='n',yaxt='n', col='#800026', ylim=c(0,0.4),ylab='',xlab='',
                panel.first=polygon(c(ax2,rev(ax2)), c(ses2[,1],rev(ses2[,2])),border=NA, col="#99325177")))
par(new=TRUE)
plot(ax2,empty_v3, type='p', xlab= " ", ylab= " ", pch=23, cex=4.5, xaxt='n',yaxt='n', ylim=c(0,0.4), bg='#800026',col='black')
text(1980,.18,'OL',col='#0098cc', cex=3)
text(1980,.3,'SOL',col='chartreuse4', cex=3)
text(1940,.5,'AOL',col='#800026', cex=3)
dev.off()


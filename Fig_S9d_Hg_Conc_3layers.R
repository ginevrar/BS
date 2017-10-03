
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2")

ax2<-(seq(1850,2050, by=.08291874))

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

plot(hgT$Sed1)

oxic_conc<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_conc_pM<-rowMeans(oxic_conc)/215*1000
sd_ox<-apply( oxic_conc, 1, sd ) 
dat1<-data.frame(ax2,oxic_conc_pM,sd_ox)
ses1<-oxic_conc_pM+outer(sd_ox, c(1,-1))

anoxic_conc<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_conc_pM<-rowMeans(anoxic_conc)/215*1000
sd_anox<-apply( anoxic_conc, 1, sd ) 
dat2<-data.frame(ax2,anoxic_conc_pM,sd_anox)
ses2<-anoxic_conc_pM+outer(sd_anox, c(1,-1))

om<-mean(oxic_conc_pM[1957:1968])
empty_v1<-rep('NA',2412)
empty_v1[1957]<- om

sub_pM<-hgT$Suboxic1/215*1000
os<-mean(sub_pM[1957:1968])
empty_v2<-rep('NA',2412)
empty_v2[1957]<- os

oa<-mean(anoxic_conc_pM[1957:1968])
empty_v3<-rep('NA',2412)
empty_v3[1957]<- oa

ax<-(1850:2050)

sub_conc_pM<-hgT$Suboxic1/215*1000

oxic_conc_pM_media   <-tapply(oxic_conc_pM,rep(1:(length(oxic_conc_pM)/12),each = 12), mean)
suboxic_conc_pM_media   <-tapply(sub_conc_pM,rep(1:(length(sub_conc_pM)/12),each = 12), mean)
anoxic_conc_pM_media   <-tapply(anoxic_conc_pM,rep(1:(length(anoxic_conc_pM)/12),each = 12), mean)

as.numeric(oxic_conc_pM_media[164] )-as.numeric(oxic_conc_pM_media[165] )
as.numeric(oxic_conc_pM_media[165] )-as.numeric(oxic_conc_pM_media[166] )

vol_OL<-((5.9*10^12)*2)+4.5*10^12+5.9*10^12
vol_OL_L<-vol_OL*1000
OLinc<- -0.0016 *vol_OL_L #pmol/y
OLinc_kmol<-OLinc/10^15 #kmol/y
OLinc_kmol

as.numeric(suboxic_conc_pM_media[164] )-as.numeric(suboxic_conc_pM_media[165] )
as.numeric(suboxic_conc_pM_media[165] )-as.numeric(suboxic_conc_pM_media[166] )

vol_SOL<-7.4*10^12
vol_SOL_L<-vol_SOL*1000
SOLinc<- -0.003 *vol_SOL_L #pmol/y
SOLinc_kmol<-SOLinc/10^15 #kmol/y
SOLinc_kmol


as.numeric(anoxic_conc_pM_media[164] )-as.numeric(anoxic_conc_pM_media[165] )
as.numeric(anoxic_conc_pM_media[165] )-as.numeric(anoxic_conc_pM_media[166] )

vol_AOL<-((5.3*10^13)*2)+(2.9*10^14)+(10^14)
vol_AOL_L<-vol_AOL*1000

AOLinc<-0.01 *vol_AOL_L #pmol/y
AOLinc_kmol<-AOLinc/10^15 #kmol/y
AOLinc_kmol




as.numeric(anoxic_conc_pM_media[164] )
as.numeric(anoxic_conc_pM_media[165] )
as.numeric(anoxic_conc_pM_media[166] )

vol_AOL<-(5.3*10^13)*2+(2.9*10^14)+(10^14)
vol_AOL_L<-vol_AOL*1000

inc<-0.01 *vol_AOL_L #pmol/y
inc_kmol<-inc/10^15 #kmol/y
inc_kmol





plot(as.numeric(anoxic_conc_pM_media ))

tiff('Fig.7D_HgConc.tiff', height=14.5, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(4.5,5,4,1), bty='n') 
with(dat1, 
     plot(ax2, oxic_conc_pM, type="l",col='#00BFFF', lwd=2, cex.axis=2, cex.lab=2,cex.main=2.3, ylim=c(0,4),ylab='pM',xlab='',
          main=expression("Modeled Hg"[T]*" concentrations"), panel.first=polygon(c(ax2,rev(ax2)), c(ses1[,1],rev(ses1[,2])),border=NA, col="#7fdfff")))
par(new=TRUE)
plot(ax2,empty_v1, type='p', xlab= " ", ylab= " ", pch=23, ce=4.5, xaxt='n',yaxt='n', ylim=c(0,4), bg='#0098cc',col='black')
par(new=TRUE)
plot(ax2,hgT$Suboxic1/215*1000, ylim=c(0,4), col="chartreuse3", lwd=2,
     ylab="   ", xlab="   ", xaxt='n', type="l",yaxt='n',lty=1) 
par(new=TRUE)
plot(ax2,empty_v2, type='p', xlab= " ", ylab= " ", pch=23, ce=4.5, xaxt='n',yaxt='n', ylim=c(0,4), bg='chartreuse4',col='black')
par(new=TRUE)
with(dat2, plot(ax2, anoxic_conc_pM, lwd=2,type="l",xaxt='n',yaxt='n', col='#800026', ylim=c(0,4),ylab='',xlab='',
                panel.first=polygon(c(ax2,rev(ax2)), c(ses2[,1],rev(ses2[,2])),border=NA, col="#99325177")))
par(new=TRUE)
plot(ax2,empty_v3, type='p', xlab= " ", ylab= " ", pch=23, cex=4.5, xaxt='n',yaxt='n', ylim=c(0,4), bg='#800026',col='black')
text(1878,1.6,'OL',col='#0098cc', cex=2.7)
text(1985,1.8,'SOL',col='chartreuse4', cex=2.7)
text(1995,3.5,'AOL',col='#800026', cex=2.7)
dev.off()


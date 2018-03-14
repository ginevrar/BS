setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/Data')
data<-read.table("data_from_MedBlack_NA.txt",header=TRUE)
summary(data$Station)
summary(data$sigma)
str(data)
names(data)<-c('Station','type','data','lon','lat','btl','pres','Temp','cosm','Flc','Par','Spar','depsm',
               'Sal','ox_mLl','ox_mg_L','ox_mgkg','Ox_uM','dens','sigma','Pot_t',
               'HS','NH4','NO2','NO3','PO4','Si','Fe','Depth','Hg','MeHg')
uc5_hr <-data[(data$Station=='UCC5_4'),];str(uc5_hr)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/implementazione/nuovi_script')
old_data<-read.csv("full_data_w_sigma.csv",header=TRUE, sep=',')
summary(old_data$Station);summary(old_data$sigma)

uc52 <-old_data[(old_data$Station=='UCC5_1'),]
summary(uc52$Mn)

Mn_data<-data.frame(old_data$Mn, old_data$sigma,old_data$Station)
names(Mn_data)<-c('Mn','sigma','Station')

(Mn_data$Station)
str(data)
str(Mn_data)

all_data<- merge(data, Mn_data, by=c("Station","sigma"),all=TRUE)

uc5_hr <-all_data[(all_data$Station=='UCC5_4'),]
str(uc5_hr)
summary(uc5_hr$MeHg)
summary(uc5_hr$Depth)
summary(uc5_hr$Mn)

hg5<-c(3.08,2.87,2.84,2.62,2.71,2.97,NA,3.19,NA,3.25,NA,2.98,NA,2.53,NA,3.2,NA,NA,NA,3.75,NA,3.35,3.77,3.61)
dd<-c(10.096,28.614,40.471,54.339,69.342,84.332,100.249,110.444,129.614,145.084,149.359,175.102,204.702,250.161,300.208,399.706,500.414,750.117,1000.156,1250.3101,1500.338,1750.92,1988.884,2039.769)

df1<-data.frame(hg5,dd)
str(df1$hg5)
str(df1$dd)
aty<-seq(0,5, by=1)
m<-seq(0,5, by=1)

maty<-c(0.5,1.5,2.5,3.5,4.5)

aty2<-c(0,0.2,0.4,0.6,0.8,1,1.2)
maty2<-c(0.1,0.3,0.5,0.7,.9,1.1,1.3)
dd<-seq(40,160,by=20)

hg<-uc5_hr$Hg
mehg<-uc5_hr$MeHg

pperc<-mehg/hg*100;perc<-data.frame(pperc,uc5_hr$Depth)
names(perc)<-c('p','Depth')

setwd('C:/Users/Ginevra/Documents')

tiff('HRprof4567.tiff', res=300,  compression = 'lzw',
    width = 2829, height = 2829, units = "px")
par(mfrow=c(1,3),oma=c(7,6.5,5,6.5), 
    mar=c(0.1,0,0.1,1.3),bty='n' )

plot(uc5_hr$Hg[!is.na(uc5_hr$Hg)], uc5_hr$Depth[!is.na(uc5_hr$Hg)],type='o',lty=1, las=c(1),
     ylim=c(160,40),xlim=c(0,5), xlab=' ',xaxt='n', yaxt='n', 
     ylab=' ', lwd=1.5, cex.lab=1.4,cex.axis=1.3, cex=2,
     bg="#3690c088",col='#256486',pch=21)
mtext(expression(paste('Hg'[D]*' (pM)')),side=3, line=2.3, col='#256486', cex=1.3)
axis(2, at=dd, labels =dd,tick=T, las=1, cex.axis=1.6, col='black')
mtext('Depth (m)', side=2, cex=1.3, line=4.3)

axis(3, at=aty, labels=aty, tick=T, las=1, cex.axis=1.6, col='#256486')
axis(3, at=maty, labels =F,tick=T, las=1, cex.axis=1.6, col='#256486', tcl=-.2)
par(new=T)
plot(uc5_hr$MeHg[!is.na(uc5_hr$MeHg)], uc5_hr$Depth[!is.na(uc5_hr$MeHg)], 
     lty=1, xaxt='n', type='o', ylim=c(160,40), xlim=c(0,1.3),  
     xlab=' ', ylab=' ', pch=22, cex=1.8, col="#e7298a", bg="#df65b088",
     yaxt='n',cex.axis=1.3,cex.lab=1.4, lwd=1.5)
mtext(expression(paste('MeHg'[D])),side=1, at=-0.28,line=0.2, col='#e7298a', cex=1.2 )
mtext(expression(paste('(pM)')),side=1, at=-0.3,line=1.45, col='#e7298a', cex=1.2 )
axis(1, at=aty2, labels =aty2,tick=T, las=1, cex.axis=1.6, col='#e7298a')
axis(1, at=maty2, labels =F,tick=T, las=1, cex.axis=1.6, col='#e7298a', tcl=-.2)
##II plot
par(new=T)
plot(perc$p[!is.na(perc$p)], perc$Depth[!is.na(perc$p)], 
     lty=1, xaxt='n', type='o', ylim=c(160,40), xlim=c(0,100),  
     xlab=' ', ylab=' ', pch=25, cex=1.8, col="darkorchid4", bg="#68228B33",
     yaxt='n',cex.axis=1.3,cex.lab=1.4, lwd=1.5)
axp<-seq(0,100, by=20)
axp2<-seq(10,90, by=20)
axis(1, at=axp, tick=T,line=2.9, las=1, cex.axis=1.6, col='darkorchid4')
axis(1, at=axp2, tick=T,labels =F,line=2.9, tcl=-.2, las=1, cex.axis=1.6, col='darkorchid4')
mtext(expression(paste('MeHg%')),side=1,
      at=-23,line=3.6 ,col="darkorchid4", cex=1.2)
abline(h=80, col='grey60', lty=2)
abline(h=120, col='grey60', lty=2)
#par(mar=c(6,2.5,4.5,2.5))
axx<-seq(0,480, by=60)
axx2<-seq(0+30,480-30, by=30)
plot(uc5_hr$Ox_uM[!is.na(uc5_hr$Ox_uM)], uc5_hr$Depth[!is.na(uc5_hr$Ox_uM)], lty=1, xaxt='n',
     type='o', ylim=c(160,40), xlim=c(0,470), xlab=' ', pch=8,cex=1.2,
     col='#72b3c9',cex.axis=1.3, cex.lab=1.4,yaxt='n',lwd=1.5)
axis(3, at=axx, labels =axx,tick=T, las=1, cex.axis=1.6, col='black')
axis(3, at=axx2, labels =F,tick=T, las=1, cex.axis=1.6, col='black', tcl=-.2)
mtext(expression(paste('O'[2]*'(然)')),side=3, at=90,line=2.3 , col='#72b3c9', cex=1.2)
mtext(expression(paste('NO'[3]*'(nM)')),side=3, at=360,line=2.3 , col='#66bd63', cex=1.2)

text(190,70,'OL', cex=2, font=2)
#text(.8,14.7,'CIL', cex=1.4, font=2)
text(360,110,'SOL', cex=2, font=2)
text(360,130,'AOL', cex=2, font=2)

par(new=T)
plot(uc5_hr$NO3[!is.na(uc5_hr$NO3)]*100, uc5_hr$Depth[!is.na(uc5_hr$NO3)], lty=1,
     xaxt='n',cex=1.2, type='o', ylim=c(160,40), xlim=c(0,470), pch=4, xlab=' ', 
     col='#66bd63', yaxt='n',cex.axis=1.3,cex.lab=1.2, lwd=1.5)
par(new=T)
plot(uc5_hr$HS[!is.na(uc5_hr$HS)], uc5_hr$Depth[!is.na(uc5_hr$HS)], pch=25,lty=1,  xaxt='n',cex=1.2,
     type='o', ylim=c(160,40), xlim=c(0,20), xlab=' ', col='#fb6a4a',bg='#fb6a4a44', yaxt='n',cex.axis=1.3,cex.lab=1.4, lwd=1.5)
axs<-seq(0,20, by=5)
axs2<-seq(0+2.5,20-2.5, by=5)
axis(1, at=axs, labels =axs,tick=T, las=1, cex.axis=1.6, col='black')
axis(1, at=axs2, labels =F,tick=T, las=1, cex.axis=1.6, col='black', tcl=-.2)
mtext(expression(paste('HS'^-1*'(然)')),side=1, at=10, line=3.3 , col='#fb6a4a', cex=1.2)

abline(h=80, col='grey60', lty=2)
abline(h=120, col='grey60', lty=2)

plot(uc5_hr$Fe[!is.na(uc5_hr$Fe)], uc5_hr$Depth[!is.na(uc5_hr$Fe)], lty=1, xaxt='n',
     type='o', ylim=c(160,40), xlim=c(0,400), xlab=' ', pch=23,cex=1.2,
     col='#cd6600', bg='#cd660022', yaxt='n',cex.axis=1.3,cex.lab=1.2, lwd=1.5)
axfe<-seq(0,400, by=100)
axfe2<-seq(50,350, by=100)
axis(1, at=axfe, tick=T,line=2.9, las=1, cex.axis=1.6, col='black')
axis(1, at=axfe2, tick=T,labels=F,line=2.9, tcl=-.2,las=1, cex.axis=1.6, col='black')
mtext(expression(paste('Fe'[D]*'(nM)')),side=1, 
      at=500,line=2.9 ,col="#cd6600", cex=1.2)

par(new=T)
ss<-c(14.2,14.9, 15.6, 15.9, 16.2, 16.4,16.5)
axis(4, at= dd, labels =ss,tick=T, las=1, cex.axis=1.6, col='black')
mtext(expression(paste(sigma[theta]*'  (kg m'^-3*')')), side=4, 
      cex=1.3, line=5)
Mn<-uc52$Mn/1000
par(new=T)
plot(uc52$Mn[!is.na(uc52$Mn)]/1000, uc52$Depth[!is.na(uc52$Mn)], lty=1, xaxt='n',pch=21,cex=1.2,
     type='o', ylim=c(160,40),  xlim=c(0,5), xlab=' ', col='darkgoldenrod1',bg='#FFB90F33', yaxt='n',cex.axis=1.5,cex.lab=1.2, lwd=1.5)
par(new=T)
axmn<-seq(0,5)
axmn2<-seq(.5,4.5)
axis(3, at=axmn, tick=T, las=1, cex.axis=1.6, col='black')
axis(3, at=axmn2, labels =F,tick=T, las=1, cex.axis=1.6, col='black', tcl=-.2)
mtext(expression(paste('Mn'[D]*'(然)')),side=3, 
      at=2.5,line=2.3 , col='darkgoldenrod1', cex=1.2)
par(new=T)

axph<-seq(0,8, by=2)
axph2<-seq(1,8, by=2)

plot(uc5_hr$PO4[!is.na(uc5_hr$PO4)], uc5_hr$Depth[!is.na(uc5_hr$PO4)], lty=1, xaxt='n',pch=24,cex=1.2,
     type='o', ylim=c(160,40), xlim=c(0,8),  xlab=' ', col='darkgreen',bg='#00640033', yaxt='n',cex.axis=1.5,cex.lab=1.2, lwd=1.5)
axis(1, at=axph, tick=T, las=1, cex.axis=1.6, col='black')
axis(1, at=axph2, tick=T,labels=F, las=1, tcl=-.2, cex.axis=1.6, col='black')
mtext(expression(paste('PO'[4]^3*'(然)')),side=1,  
      at=10,line=1.3 , col='darkgreen', cex=1.2)
abline(h=80, col='grey60', lty=2)
abline(h=120, col='grey60', lty=2)

dev.off()


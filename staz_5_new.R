setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/Data')
data<-read.table("data_from_MedBlack_NA.txt",header=TRUE)

summary(data$Station)
summary(data)
str(data)
names(data)<-c('Station','type','data','lon','lat','btl','pres','Temp','cosm','Flc','Par','Spar','depsm',
               'Sal','ox_mLl','ox_mg_L','ox_mgkg','Ox_uM','dens','sigma','Pot_t',
               'HS','NH4','NO2','NO3','PO4','Si','Fe','Depth','Hg','MeHg')

uc5_hr <-data[(data$Station=='UCC5_4'),]
str(uc5_hr)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/implementazione/nuovi_script')
old_data<-read.csv("full_data_w_sigma.csv",header=TRUE, sep=',')
summary(old_data$Station)

uc52 <-old_data[(old_data$Station=='UCC5_1'),]
summary(uc52$Mn)

Mn_data<-data.frame(old_data$Mn, old_data$sigma,old_data$Station)
names(Mn_data)<-c('Mn','sigma','Station')
  
    (Mn_data$Station)
  str(data)
  str(Mn_data)
  
all_data<- merge(data, Mn_data, by=c("Station","sigma"),all=TRUE)

plot(all_data$Mn,all_data$sigma, ylim=c(17.3,11), col='yellow')
par(new=T)
plot(all_data$Hg,all_data$sigma, ylim=c(17.3,11), col='blue')
str(all_data)

uc5_hr <-all_data[(all_data$Station=='UCC5_4'),]
str(uc5_hr)

plot(uc52$Mn,uc52$Depth, ylim=c(180,20))


summary(uc5_hr$MeHg)
summary(uc5_hr$Depth)
summary(uc5_hr$Mn)

hg5<-c(3.08,2.87,2.84,2.62,2.71,2.97,NA,3.19,NA,3.25,NA,2.98,NA,2.53,NA,3.2,NA,NA,NA,3.75,NA,3.35,3.77,3.61)
dd<-c(10.096,28.614,40.471,54.339,69.342,84.332,100.249,110.444,129.614,145.084,149.359,175.102,204.702,250.161,300.208,399.706,500.414,750.117,1000.156,1250.3101,1500.338,1750.92,1988.884,2039.769)

df1<-data.frame(hg5,dd)
str(df1$hg5)
str(df1$dd)


par(mfrow=c(1,1),mar=c(4.5,5,4.5,0))
plot(uc5_hr$sigma,uc5_hr$Depth, xlim=c(13,17), ylim=c(40,160))
text(uc5_hr$sigma-.6,uc5_hr$Depth,labels=uc5_hr$sigma, cex=1)

par(mfrow=c(1,1))
plot(uc5_hr$Ox_uM[!is.na(uc5_hr$Ox_uM)], uc5_hr$Depth[!is.na(uc5_hr$Ox_uM)], lty=1, 
     type='o', ylim=c(160,40), xlim=c(0,50), xlab=' ', pch=8,cex=2,
     col='#72b3c9',cex.axis=1.3, cex.lab=1.4,lwd=1.5)
par(new=T)
plot(uc5_hr$HS[!is.na(uc5_hr$HS)], uc5_hr$Depth[!is.na(uc5_hr$HS)], lty=1, 
          type='o', ylim=c(160,40), xlim=c(0,20), xlab=' ', pch=8,cex=2,
     col='red',cex.axis=1.3, cex.lab=1.4,lwd=1.5)
abline(v=16, col='grey60', lty=2)

abline(h=80, col='grey60', lty=2)
abline(h=117, col='grey60', lty=2)


aty<-seq(0,4, by=1)
m<-seq(0,5, by=1)

maty<-c(0.5,1.5,2.5,3.5)

aty2<-c(0,0.2,0.4,0.6,0.8,1)
maty2<-c(0.1,0.3,0.5,0.7,.9)


dd<-seq(40,160,by=20)


dev.new()
par(mfrow=c(1,2),mar=c(4.5,5.2,4.5,0), bty='n' )
#plot(uc5$Hg, uc5$Depth, lty=1, type='b', ylim=c(2000,40), xlab='Hg (pM)')
plot(uc5_hr$Hg[!is.na(uc5_hr$Hg)], uc5_hr$Depth[!is.na(uc5_hr$Hg)],type='o',lty=1, las=c(1),
     ylim=c(160,40),xlim=c(0,4), xlab=' ',xaxt='n', yaxt='n', 
     ylab=' ', lwd=1.5, cex.lab=1.4,cex.axis=1.3, cex=2,
     bg="#3690c088",col='#256486',pch=21)
mtext(expression(paste('Hg'[D]*' (pM)')),side=3, line=2.3, col='#256486', cex=1.3)

axis(2, at=dd, labels =dd,tick=T, las=1, cex.axis=1.3, col='black')
mtext('Depth (m)', side=2, cex=1.3, line=3.3)

axis(3, at=aty, labels =aty,tick=T, las=1, cex.axis=1.3, col='#256486')
axis(3, at=maty, labels =F,tick=T, las=1, cex.axis=1.3, col='#256486', tcl=-.2)

abline(h=80, col='grey60', lty=2)
abline(h=120, col='grey60', lty=2)

par(new=T)
plot(uc5_hr$MeHg[!is.na(uc5_hr$MeHg)], uc5_hr$Depth[!is.na(uc5_hr$MeHg)], 
     lty=1, xaxt='n', type='o', ylim=c(160,40), xlim=c(0,1),  
     xlab=' ', ylab=' ', pch=22, cex=1.8, col="#e7298a", bg="#df65b088",
     yaxt='n',cex.axis=1.3,cex.lab=1.4, lwd=1.5)
mtext(expression(paste('MeHg'[D])),side=1, line=2.3, col='#e7298a', cex=1.3 )
axis(1, at=aty2, labels =aty2,tick=T, las=1, cex.axis=1.3, col='#e7298a')
axis(1, at=maty2, labels =F,tick=T, las=1, cex.axis=1.3, col='#e7298a', tcl=-.2)
text(.8,50,'OL', cex=1.4, font=2)
#text(.8,14.7,'CIL', cex=1.4, font=2)
text(.8,90,'SOL', cex=1.4, font=2)
text(.15,130,'AOL', cex=1.4, font=2)
##II plot

par(mar=c(4.5,0,4.5,5.2))

axx<-seq(0,480, by=60)
axx2<-seq(0+30,480-30, by=30)
plot(uc5_hr$Ox_uM[!is.na(uc5_hr$Ox_uM)], uc5_hr$Depth[!is.na(uc5_hr$Ox_uM)], lty=1, xaxt='n',
     type='o', ylim=c(160,40), xlim=c(0,470), xlab=' ', pch=8,cex=1.2,
     col='#72b3c9',cex.axis=1.3, cex.lab=1.4,yaxt='n',lwd=1.5)
par(new=T)
plot(uc5_hr$Fe[!is.na(uc5_hr$Fe)], uc5_hr$Depth[!is.na(uc5_hr$Fe)], lty=1, xaxt='n',
     type='o', ylim=c(160,40), xlim=c(0,470), xlab=' ', pch=23,cex=1.2,
     col='#f49b42', bg='#f49b4222', yaxt='n',cex.axis=1.3,cex.lab=1.2, lwd=1.5)
par(new=T)
plot(uc5_hr$NO3[!is.na(uc5_hr$NO3)]*100, uc5_hr$Depth[!is.na(uc5_hr$NO3)], lty=1,
     xaxt='n',cex=1.2, type='o', ylim=c(160,40), xlim=c(0,470), pch=4, xlab=' ', 
     col='#66bd63', yaxt='n',cex.axis=1.3,cex.lab=1.2, lwd=1.5)
axis(3, at=axx, labels =axx,tick=T, las=1, cex.axis=1.3, col='black')
axis(3, at=axx2, labels =F,tick=T, las=1, cex.axis=1.3, col='black', tcl=-.2)
text(150,50,'OL', cex=1.4, font=2)
#text(50,14.6,'CIL', cex=1.4, font=2)
text(220,90,'SOL', cex=1.4, font=2)
text(250,130,'AOL', cex=1.4, font=2)
mtext(expression(paste('O'[2]*'(然)')),side=3, at=150-60,line=2.3 , col='#72b3c9', cex=1.2)
mtext(expression(paste('NO'[3]*'(nM)')),side=3, at=320-70,line=2.3 , col='#66bd63', cex=1.2)
mtext(expression(paste('Fe'[D]*'(nM)')),side=3, at=480-50,line=2.3 ,col="#f49b42", cex=1.2)
par(new=T)
plot(uc5_hr$HS[!is.na(uc5_hr$HS)], uc5_hr$Depth[!is.na(uc5_hr$HS)], pch=25,lty=1,  xaxt='n',cex=1.2,
     type='o', ylim=c(160,40), xlim=c(0,20), xlab=' ', col='#fb6a4a',bg='#fb6a4a44', yaxt='n',cex.axis=1.3,cex.lab=1.4, lwd=1.5)
abline(h=80, col='grey60', lty=2)
abline(h=120, col='grey60', lty=2)
axs<-seq(0,20, by=5)
axs2<-seq(0+2.5,20-2.5, by=5)

axis(1, at=axs, labels =axs,tick=T, las=1, cex.axis=1.3, col='black')
axis(1, at=axs2, labels =F,tick=T, las=1, cex.axis=1.3, col='black', tcl=-.2)
mtext(expression(paste('HS'^-1*'(然)')),side=1, line=2.3 , col='#fb6a4a', cex=1.2)

ss<-c(14.2,14.9, 15.6, 15.9, 16.2, 16.4,16.5)
axis(4, at= dd, labels =ss,tick=T, las=1, cex.axis=1.3, col='black')
mtext(expression(paste(sigma[theta]*'  (kg m'^-3*')')), side=4, cex=1.3, line=3.8)








dev.new()

par(mfrow=c(1,2),mar=c(4.5,5.2,4.5,0), bty='n' )
#plot(uc5$Hg, uc5$Depth, lty=1, type='b', ylim=c(2000,40), xlab='Hg (pM)')
plot(uc5_hr$Hg[!is.na(uc5_hr$Hg)], uc5_hr$Depth[!is.na(uc5_hr$Hg)],type='l',lty=1, las=c(1),
     ylim=c(160,40),xlim=c(0,4), xlab=' ',xaxt='n', yaxt='n', 
     ylab=' ', lwd=2.5, cex.lab=1.4,cex.axis=1.3, cex=2,
     bg="#3690c088",col='#256486',pch=21)
mtext(expression(paste('Hg'[D]*' (pM)')),side=3, line=2.3, col='#256486', cex=1.3)

axis(2, at=dd, labels =dd,tick=T, las=1, cex.axis=1.3, col='black')
mtext('Depth (m)', side=2, cex=1.3, line=3.3)

axis(3, at=aty, labels =aty,tick=T, las=1, cex.axis=1.3, col='#256486')
axis(3, at=maty, labels =F,tick=T, las=1, cex.axis=1.3, col='#256486', tcl=-.2)

abline(h=80, col='grey60', lty=2)
abline(h=120, col='grey60', lty=2)
par(new=T)
plot(uc5_hr$MeHg[!is.na(uc5_hr$MeHg)], uc5_hr$Depth[!is.na(uc5_hr$MeHg)], 
     lty=1, xaxt='n', type='l', ylim=c(160,40), xlim=c(0,1),  
     xlab=' ', ylab=' ', pch=22, cex=1.8, col="#e7298a", bg="#df65b088",
     yaxt='n',cex.axis=1.3,cex.lab=1.4, lwd=2.5)
mtext(expression(paste('MeHg'[D])),side=1, line=2.5, col='#e7298a', cex=1.3 )
axis(1, at=aty2, labels =aty2,tick=T, las=1, cex.axis=1.3, col='#e7298a')
axis(1, at=maty2, labels =F,tick=T, las=1, cex.axis=1.3, col='#e7298a', tcl=-.2)
text(.8,50,'OL', cex=1.4, font=2)
#text(.8,14.7,'CIL', cex=1.4, font=2)
text(.8,90,'SOL', cex=1.4, font=2)
text(.15,130,'AOL', cex=1.4, font=2)
##II plot

par(mar=c(4.5,0,4.5,5.2))

axx<-seq(0,480, by=60)
axx2<-seq(0+30,480-30, by=30)
plot(uc5_hr$Ox_uM[!is.na(uc5_hr$Ox_uM)], uc5_hr$Depth[!is.na(uc5_hr$Ox_uM)], lty=1, xaxt='n',
     type='l', ylim=c(160,40), xlim=c(0,470), xlab=' ', pch=8,cex=1.2,
     col='#72b3c9',cex.axis=1.3, cex.lab=1.4,yaxt='n',lwd=2.5)
par(new=T)
plot(uc5_hr$Fe[!is.na(uc5_hr$Fe)], uc5_hr$Depth[!is.na(uc5_hr$Fe)], lty=1, xaxt='n',
     type='l', ylim=c(160,40), xlim=c(0,470), xlab=' ', pch=23,cex=1.2,
     col='#f49b42', bg='#f49b4222', yaxt='n',cex.axis=1.3,cex.lab=1.2, lwd=2.5)
par(new=T)
plot(uc5_hr$NO3[!is.na(uc5_hr$NO3)]*100, uc5_hr$Depth[!is.na(uc5_hr$NO3)], lty=1,
     xaxt='n',cex=1.2, type='l', ylim=c(160,40), xlim=c(0,470), pch=4, xlab=' ', 
     col='#66bd63', yaxt='n',cex.axis=1.3,cex.lab=1.2, lwd=2.5)

axis(3, at=axx, labels =axx,tick=T, las=1, cex.axis=1.3, col='black')
axis(3, at=axx2, labels =F,tick=T, las=1, cex.axis=1.3, col='black', tcl=-.2)
text(150,13.4,'OL', cex=1.4, font=2)
#text(50,14.6,'CIL', cex=1.4, font=2)
text(220,15.9,'SOL', cex=1.4, font=2)
text(250,16.6,'AOL', cex=1.4, font=2)
mtext(expression(paste('O'[2]*'(然)')),side=3, at=150-60,line=2.3 , col='#72b3c9', cex=1.2)
mtext(expression(paste('NO'[3]*'(nM)')),side=3, at=320-70,line=2.3 , col='#66bd63', cex=1.2)
mtext(expression(paste('Fe'[D]*'(nM)')),side=3, at=480-50,line=2.3 ,col="#f49b42", cex=1.2)
par(new=T)
plot(uc5_hr$HS[!is.na(uc5_hr$HS)], uc5_hr$Depth[!is.na(uc5_hr$HS)], pch=25,lty=1,  xaxt='n',cex=1.2,
     type='l', ylim=c(160,40), xlim=c(0,20), xlab=' ', col='#fb6a4a',bg='#fb6a4a44', yaxt='n',cex.axis=1.3,cex.lab=1.4, lwd=2.5)
par(new=T)
plot(uc52$Mn[!is.na(uc52$Mn)]/1000, uc52$Depth[!is.na(uc52$Mn)], lty=1, xaxt='n',
     type='l', ylim=c(160,40), xlim=c(0,20), xlab=' ', col='darkgoldenrod1', yaxt='n',cex.axis=1.5,cex.lab=1.2, lwd=2.5)

abline(h=80, col='grey60', lty=2)
abline(h=120, col='grey60', lty=2)
axs<-seq(0,20, by=5)
axs2<-seq(0+2.5,20-2.5, by=5)

axis(1, at=axs, labels =axs,tick=T, las=1, cex.axis=1.3, col='black')
axis(1, at=axs2, labels =F,tick=T, las=1, cex.axis=1.3, col='black', tcl=-.2)
mtext(expression(paste('HS'^-1*'(然)')),side=1, at=5, line=2.3 , col='#fb6a4a', cex=1.2)
mtext(expression(paste('Mn'[D]*'(然)')),side=1,  at=15,line=2.3 , col='darkgoldenrod1', cex=1.2)

ss<-c(14.2,14.9, 15.6, 15.9, 16.2, 16.4,16.5)
axis(4, at= dd, labels =ss,tick=T, las=1, cex.axis=1.3, col='black')
mtext(expression(paste(sigma[theta]*'  (kg m'^-3*')')), side=4, cex=1.3, line=3.8)


    





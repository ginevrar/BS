setwd("C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/implementazione/nuovi_script")
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale2')
Clean_data<-read.table('Dataset_Finale_new_no_bosforo.txt', header=T)
str(Clean_data)

plot(Clean_data$MeHg/Clean_data$Hg*100)

y3<-c( 10.5, 12.05, 14.25, 15.285, 15.64, 16.2, 16.6, 17.04, 17.35)
why<-c(0,   20,      40,    55,    75,   100,  280,  460,   2000)

setwd("C:/Users/Ginevra/Desktop")
tiff('f223f.tiff', height = 25, width = 23, units = 'cm',   compression = "lzw", res = 500)


# mai make  margins smaller mai=c(0.1,0.1,0.2,0.1),
par(mar=c(4.5,5,3.5,3), mfrow=c(2,3),cex.axis=1.2, cex.lab=1.3, cex.main=2.4 )
##par(mar=c( bottom , left , top, right )
#oma=c(1,1,1,4)
summary(Clean_data$Temp)
a<-seq(6,27, by=3)
par(bty='n')
#fig=c(x1, x2, y1, y2)
plot(Clean_data$Temp, Clean_data$sigma,xlim=c(6,27),
     xaxt="n",cex=2.2,yaxt='n',
     ylim=rev(range(Clean_data$sigma)), col="#fee08b",
     ylab=' ', cex.lab=2,
     xlab=" ", pch=24)
abline(h=15.64,   lty=2, col='grey60')
abline(h=16.2,   lty=2, col='grey60')
axis(3, at=a,line=0.3, col="darkgoldenrod1", cex.axis=1.6, cex.axis=1.6)
mtext("T \n (蚓)", 3, line=-0.6,at=2.2,col="darkgoldenrod1", cex=1.4)
text(16,12,'OL', cex=1.4, font=2)
#text(22,14.7,'CIL', cex=1.4, font=2)
text(14,15.9,'SOL', cex=1.4, font=2)
text(14,16.7,'AOL', cex=1.4, font=2)
#text(13,22,"1", col="red", cex=1.4)
par(new=TRUE)
summary(Clean_data$Sal)
s<-seq(17,23,by=1)
plot(Clean_data$Sal, cex=2.2, Clean_data$sigma, ylim=rev(range(Clean_data$sigma)), 
     pch=4, col="#80cdc1",frame=FALSE, xaxt='n',yaxt='n',xlab="",ylab="",
     xlim=c(17,23))
axis(1, at=s,line=.3, col="#35978f", cex.axis=1.6)
mtext("S",1, line=.5, col="#35978f", cex=1.4, at=15.5)
y2<-c(10.5,11.5,12.5,13.5,14.5,15.5,
      16.5,17, 17.5)
y<-c(11,12,13,14,15,16,17)

axis(2, at=y,line=0, col="black", cex.axis=1.6 , las=2, las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)
mtext(expression(paste(sigma[theta]*'  (kg m'^-3*')')), 2, line=2.2,at=13.5,
      col="black", cex=1.3)
#mtext("Sal",1, line=3, col="#35978f", cex=1.4, at=24)

#secondo---II-O2 HS mar=c(5.5,1,.5,1)
par(mar=c(4,4.6,3.5,3.4), cex.axis=1.2, cex.lab=1.3, cex.main=2.4 )

summary(Clean_data$Ox_uM)
Ox<-Clean_data[(Clean_data$Ox_uM>1),]

d <- seq(0,350,by=50)
plot(Ox$Ox_uM, Ox$sigma, ylim=rev(range(Clean_data$sigma)),
     col="#abd9e9",frame=FALSE, xlim=c(0,350),cex=2.2,
     xaxt='n',yaxt='n', xlab="", ylab=' ', cex.lab=2,pch=8)
axis(3,at=d,line=.3, col="#abd9e9", cex.axis=1.6)
mtext(expression(paste('O'[2]))
      ,side=3,
      line=c(1),at=-90,col="#72b3c9", cex=1.4)
mtext("(然)",side=3,
      line=c(-1),at=-90,col="#72b3c9", cex=1.4)

text(150,13.4,'OL', cex=1.4, font=2)
#text(50,14.6,'CIL', cex=1.4, font=2)
text(220,15.9,'SOL', cex=1.4, font=2)
text(250,16.6,'AOL', cex=1.4, font=2)
abline(h=15.64,   lty=2, col='grey60')
abline(h=16.2,   lty=2, col='grey60')
#title(sub="然", line=2.5)
par(new=TRUE)
HS<-Clean_data[(Clean_data$HS>0.1),]
summary(HS$HS)5
g <- seq(0,500,by=100)
plot(HS$HS, HS$sigma, ylim=rev(range(Clean_data$sigma)),xlim=c(0,500),cex=2.2,
     col="#fb6a4a",frame=FALSE,xaxt='n', yaxt='n', xlab="", pch=25,ylab="")
axis(1,at=g,line=.3, col="#fb6a4a", cex.axis=1.6)
Lines <- list(bquote(),   bquote("(然)"))

mtext(expression(paste('HS'^-1)),side=1,line=-0.1,at=-150,col="#fb6a4a", cex=1.4)
mtext(expression(paste('(然)')),side=1,line=1.9,at=-160,col="#fb6a4a", cex=1.4)
                                  
    #  line=c(-0.3,1),at=-90,col="#fb6a4a", cex=1.4)
axis(2, at=y,line=0, col="black" , cex.axis=1.6, las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)#mtext(expression(paste(sigma[theta]*'  (kg m'^-3*')')),1, line=3, col="#35978f", cex=1.4, at=24)

#--III --  terzo --NO3 + Mn,mar=c(5.5,1,.5,5)
par(mar=c(4.5,3.3,3.5,4.7), cex.axis=1.2, cex.lab=1.3, cex.main=2.4 )

no3<-Clean_data[(Clean_data$NO3>0.1),]
plot(no3$NO3, no3$sigma, cex=2.1,xlim=c(0,5), 
     col="#66bd63", lwd=1.3,frame=F, ylim=rev(range(Clean_data$sigma)),
     ylab='', cex.lab=2, xaxt='n',yaxt='n', xlab="", pch=4)
no3a<-seq(0,5,by=1)
axis(3,at=no3a,line=.3, col="#66bd63", cex.axis=1.6)

axis(4, at = y3, labels = why, tick = TRUE, cex.axis=1.8, las=2)
mtext('depth (m)', at=13.5, side=4,line=3.2, cex=1.2 )

mtext(expression(paste('NO'[3])),side=3,
      line=.5,at=c(-1.2), col="#66bd63", cex=1.4)
mtext(expression(paste('(然)')),side=3,
      line=-1.5, at=c(-1.2), col="#66bd63", cex=1.4)

abline(h=15.64,   lty=2, col='grey60')
abline(h=16.2,   lty=2, col='grey60')


text(2.5,12,'OL', cex=1.4, font=2)
text(4.5,15.9,'SOL', cex=1.4, font=2)
text(1.5,16.7,'AOL', cex=1.4, font=2)
#mtext("dMn (nM)",1,line=3, at=c(7500),col="darkorange", cex=1)
axis(2, at=y,line=0, col="black", cex.axis=1.6, las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)

par(new=T)
e <- seq(0,5000,by=1000)
Mn<-Clean_data[(Clean_data$Mn>0.1),]
plot(Mn$Mn, Mn$sigma, ylim=rev(range(Clean_data$sigma)), xlim=c(0,5000), 
     col="#dbcc4a", bg="#d5f41900", cex.lab=2, cex=2.2,
     frame=FALSE,xaxt='n',yaxt='n',  pch=24,xlab='',
     ylab='')
axis(1,at=e,line=.3, col="#cccd1c", cex.axis=1.6)
 
mtext(expression(paste('Mn'[D])),side=1,
      line=-0.1,at=-1300,col="#cccd1c", cex=1.4)
mtext(expression(paste('(nM)')),side=1,
      line=1.9,at=-1300,col="#cccd1c", cex=1.4)   

#-IV ---BAC + Fe
par(mar=c(4.5,5,3.5,3), cex.axis=1.8, cex.lab=1.3, cex.main=2.4 )

ba<-seq(0.,0.5,by=0.1)
plot(Clean_data$BAC, Clean_data$sigma, ylim=rev(range(Clean_data$sigma)), 
     ylab=" ", cex=2, xlim=c(0,0.5), yaxt='n',lwd=1.5,
     pch=21,col="#008224", frame=FALSE, xaxt='n',xlab=" ")

axis(3, at=ba,line=0.3, col="#008224", cex.axis=1.6)
mtext(expression(paste('BAC')),3,line=1, at=-.128, col="#006837", cex=1.4)
mtext(expression(paste('(m'^-1*')')),3,line=-1.2,at=-.128, col="#006837", cex=1.4)
abline(h=15.64, type='l', lty=2, col='grey60')
abline(h=16.2, type='l', lty=2, col='grey60')
par(new=T)

fe <- seq(0,500,by=100)
Fe<-Clean_data[(Clean_data$Fe>0.1),]
plot(Fe$Fe, Fe$sigma, ylim=rev(range(Clean_data$sigma)), cex=2.1,
     lwd=1.4, xlim=c(0,500),
     col="#f49b42", frame=FALSE, xaxt='n',yaxt='n',xlab="", pch=23,ylab="")
axis(1,at=fe,line=.3, col="#f49b42", cex.axis=1.6)
#Lines <- list(bquote('Fe'[D]),  bquote("(nM)"))
#mtext(do.call(expression, Lines),side=1,
    #  line=c(-.7,.8),at=c(-110), col="#f49b42", cex=1.4)
mtext(expression(paste('Fe'[D])),side=1,
  line=-.2,at=c(-130), col="#f49b42", cex=1.4)
mtext(expression(paste('(nM)')),side=1,
      line=1.8,at=c(-130), col="#f49b42", cex=1.4)


axis(2, at=y,line=0, col="black", cex.axis=1.6, las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)
mtext(expression(paste(sigma[theta]*'  (kg m'^-3*')')), 2, 
      line=2.3,at=13.5,col="black", cex=1.3)

text(450,12.5,'OL', cex=1.4, font=2)
#text(440,14.7,'CIL', cex=1.4, font=2)
text(440,15.9,'SOL', cex=1.4, font=2)
text(440,16.8,'AOL', cex=1.4, font=2)

#-- V --- Hg
par(mar=c(4,4.6,3.5,3.4), cex.axis=1.8, cex.lab=1.3, cex.main=2.4 )
par(bty="n")


plot(Clean_data$Hg, Clean_data$sigma, xlim=c(0,5),
     ylim=rev(range(Clean_data$sigma)), pch=21, xaxt='n', yaxt='n',
     type="p",lty=4, bg="#3690c088",col='#256486', cex=2.2,
     ylab='', main=" ",
     cex.lab=2, xlab=" " )
m<-seq(0,5,by=1)
axis(3,at=m,line=0.3, col="#3690c0", cex.axis=1.6)
abline(h=15.64, type='l', lty=2, col='grey60')
abline(h=16.2, type='l', lty=2, col='grey60')

#Lines <- list(bquote('Hg'[D]),   bquote("(pM)"))
#mtext(do.call(expression, Lines),side=3,
 #     line=c(1,-0.3),at=c(-1.2),col="#3690c0", cex=1.4)
mtext(expression(paste('Hg'[D])),side=3,
      line=0.5,at=-1.2,col="#3690c0", cex=1.4)
mtext(expression(paste('(pM)')),side=3,
      line=-1.5,at=-1.2,col="#3690c0", cex=1.4)


axis(2, at=y,line=0, col="black", cex.axis=1.6, las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)

text(4,12,'OL', cex=1.4, font=2)
#text(4,14.7,'CIL', cex=1.4, font=2)
text(4,15.9,'SOL', cex=1.4, font=2)
text(1,16.6,'AOL', cex=1.4, font=2)


# vI ---- Mehg----- mar=c(5.5,1,.5,5)

par(mar=c(4.5,3.3,3.5,4.7), cex.axis=1.8, cex.lab=1.3, cex.main=2.4 )

par(bty='n')
mm<-seq(0,1.2, by=0.2)
plot(Clean_data$MeHg, Clean_data$sigma, xlim=c(0,1.2),xaxt='n', yaxt='n',
     ylim=rev(range(Clean_data$sigma)), pch=23, cex=2.2,
     type="p",lty=4, col="#df65b000", bg="#df65b000", main=" ",
     ylab='',cex.lab=2,xlab=" ")
abline(h=15.64,   lty=2, col='grey60')
abline(h=16.2,   lty=2, col='grey60')


par(new=T)   
plot(Clean_data$MeHg, Clean_data$sigma, xlim=c(0,1.2),xaxt='n', yaxt='n',
     ylim=rev(range(Clean_data$sigma)), pch=22, cex=2.2,
     type="p",lty=4, col="#e7298a", bg="#df65b088", main=" ",
     ylab='', cex.lab=2, xlab=" ")
axis(3,at=mm,line=0.4, col="#df65b0", cex.axis=1.6)

mtext(expression(paste('MeHg'[D])),side=3,
      line=0.5,at=c(-.34),col="#df65b0", cex=1.4)
mtext(expression(paste('(pM)')),side=3,
      line=-1.5,at=c(-.34),col="#df65b0", cex=1.4)


axis(2, at=y,line=0, col="black", cex.axis=1.6, las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)

axis(4, at = y3, labels = why, tick = TRUE, cex.axis=1.8, las=2)
mtext('depth (m)', at=13.5, side=4,line=3.2, cex=1.2 )

text(.8,12,'OL', cex=1.4, font=2)
#text(.8,14.7,'CIL', cex=1.4, font=2)
text(.95,15.9,'SOL', cex=1.4, font=2)
text(.15,16.6,'AOL', cex=1.4, font=2)
dev.off()

Clean_data$MeHg/Clean_data$Hg


#mehg out
L1<-c(0.3497755,	0.3848843,	0.4685913,	0.5679968,	0.7814427,	1.1722684,	1.1908319,	1.2207873,	1.2357983) 
L2<-c(0.2559063,	0.2750452,	0.3275904,	0.3883713,	0.5168229,	0.7781901,	0.7921778,	0.8194976,	0.8312166)
L3<-c(0.2094286,	0.2206606,	0.2577773,	0.2994355,	0.3858102,	0.5820193,	0.593122,   0.6164701,	0.6259344) 
L4<-c( 0.1817237, 0.1882424, 0.2161624, 0.2464218,   0.3077157,  0.4647380,  0.4739146,  0.4939871,  0.5018907) 
L5<-c(0.1632538,	0.1666298,	0.1884177,	0.2110764,	0.2556472,	0.3857885,	0.3932107,	0.4089185,	0.4152378)
L6<-c(0.1505495,	0.1517646,	0.1693363,	0.1867695,	0.2198419,	0.3326888,	0.3396552,	0.3558866,	0.3620052) 
L7<-c(0.1502484,	0.1514122,	0.1688838,	0.186193,   0.2189932,	0.3311748,	0.3379699,	0.3534577,	0.3593792)

#mehg data
medie_mehg_pM<-c(0.116285714,0.1408125,0.120611111,0.108857143,0.157888889,0.767916667,0.551913043,0.751090909,0.737428571)
sd2<-c(0.036545471,0.034533498,0.034428338,0.035267684,0.083861152,0.170347104,0.149375644,0.130289388,0.095633974)
prof<-c(11.4525,13.3275,14.715,15.41,15.92,16.41,16.83,17.14,17.25)
epsilon <- 0.12
y1<-c( 10.5, 12.05, 14.25, 15.285, 15.64, 16.2, 16.6, 17.04, 17.35)
why<-c(0,   20,      40,    55,    75,   100,  280,  460,   2000)
str(why)
str(y1)
y<-prof
x2<-medie_mehg_pM


# --- PLOT Mehg----------------------mehg

tiff('Lamborg.tiff', height=25, width=30, units='cm', 
     compression="lzw", res=300)
#L1
par(mar=c(4,5,1,0.5), mfrow=c(2,3),cex.axis=1.2, cex.lab=1.3, cex.main=1.4 )
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n',xaxt='n',
     xlim=c(0, 1.3), pch=21,
     ylab=" ", xlab=" ", type="b", col="#5716a2",bg='#5716a255', main=" ")

abline(h=15.64, type='l', lty=2, col='grey60')
abline(h=16.2, type='l', lty=2, col='grey60')

segments(x2-sd2,y,x2+sd2,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#5716a2')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#5716a2')
par(new=TRUE)
plot(L1, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.3), lty=2,
     xlab=" ", col="#b3db25", yaxt='n',xaxt='n',
     bg='#b3db2577', ylab='',   main='')

p<-c(21,23)

at=c(0,0.1,.3,.5,.7,.9,1.1,1.3)
atx=c(0.2,.4,.6,.8,1,1.2)
axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)

y2<-c(10.5,11.5,12.5,13.5,14.5,15.5,16.5,17, 17.5);y1<-c(11,12,13,14,15,16,17)

axis(2, at=y1,line=0, col="black", cex.axis=1.6 , las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)


#L2
par(mar=c(4,1,1,1), cex.axis=1.2, cex.lab=1.3, cex.main=1.4 )
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n',xaxt='n',
     xlim=c(0, 1.3), pch=21,
     ylab=" ", xlab=" ", type="b", col="#5716a2",bg='#5716a255', main=" ")

abline(h=15.64, type='l', lty=2, col='grey60')
abline(h=16.2, type='l', lty=2, col='grey60')

segments(x2-sd2,y,x2+sd2,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#5716a2')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#5716a2')
par(new=TRUE)
plot(L2, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.3), lty=2,
     xlab=" ", col="#b3db25", yaxt='n',xaxt='n',
     bg='#b3db2577', ylab='',   main='')

p<-c(21,23)
#legend(.4,11, pch=p,legend=c("Observations", 
#                            'Model'),pt.cex=2,
#     col=c("#5716a

axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)


#L3
par(mar=c(4,.5,1,5), cex.axis=1.2, cex.lab=1.3, cex.main=1.4 )
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n',xaxt='n',
     xlim=c(0, 1.3), pch=21,
     ylab=" ", xlab=" ", type="b", col="#5716a2",bg='#5716a255', main=" ")

abline(h=15.64, type='l', lty=2, col='grey60')
abline(h=16.2, type='l', lty=2, col='grey60')

segments(x2-sd2,y,x2+sd2,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#5716a2')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#5716a2')
par(new=TRUE)
plot(L3, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.3), lty=2,
     xlab=" ", col="#b3db25", yaxt='n',xaxt='n',
     bg='#b3db2577', ylab='',   main='')
#mtext(expression(paste(sigma[theta]*'  (kg/m'^3*')')),
#      2, line=2.5 ,at=14,col="black", cex=1.2)
axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)

y3<-c( 10.5, 12.05, 14.25, 15.285, 15.64, 16.2, 16.6, 17.04, 17.35);why<-c(0,   20,      40,    55,    75,   100,  280,  460,   2000)
axis(4, at = y3, labels = why, tick = TRUE, cex.axis=1.8, las=2)
mtext('depth (m)', at=13.5, side=4,line=3.2, cex=1.2)
#L4
par(mar=c(4,5,1,0.5), cex.axis=1.8, cex.lab=1.3, cex.main=1.4 )
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n',xaxt='n',
     xlim=c(0, 1.3), pch=21,
     ylab=" ", xlab=" ", type="b", col="#5716a2",bg='#5716a255', main=" ")

abline(h=15.64, type='l', lty=2, col='grey60')
abline(h=16.2, type='l', lty=2, col='grey60')

segments(x2-sd2,y,x2+sd2,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#5716a2')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#5716a2')
par(new=TRUE)
plot(L4, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.3), lty=2,
     xlab=" ", col="#b3db25", yaxt='n',xaxt='n',
     bg='#b3db2577', ylab='',   main='')
#x axis
axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)

#y axis
axis(2, at=y1,line=0, col="black", cex.axis=1.8 , las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.8)
mtext(expression(paste(sigma[theta]*' (kg m'^-3*')')), 2, line=3.2,at=13.5,
      col="black", cex=1.2)
#L5
par(par(mar=c(4,.5,1,.5)), cex.axis=1.8, cex.lab=1.3, cex.main=1.4 )
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n',xaxt='n',
     xlim=c(0, 1.3), pch=21,
     ylab=" ", xlab=" ", type="b", col="#5716a2",bg='#5716a255', main=" ")

abline(h=15.64, type='l', lty=2, col='grey60')
abline(h=16.2, type='l', lty=2, col='grey60')

segments(x2-sd2,y,x2+sd2,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#5716a2')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#5716a2')
par(new=TRUE)
plot(L5, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.3), lty=2,
     xlab=" ", col="#b3db25", yaxt='n',xaxt='n',
     bg='#b3db2577', ylab='',   main='')

axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)
#legend(.4,11, pch=p,legend=c

#L6
par(mar=c(4,.5,1,5), cex.axis=1.8, cex.lab=1.3, cex.main=1.4 )
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n',xaxt='n',
     xlim=c(0, 1.3), pch=21,
     ylab=" ", xlab=" ", type="b", col="#5716a2",bg='#5716a255', main=" ")

abline(h=15.64, type='l', lty=2, col='grey60')
abline(h=16.2, type='l', lty=2, col='grey60')

segments(x2-sd2,y,x2+sd2,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#5716a2')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#5716a2')
par(new=TRUE)
plot(L6, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.3), lty=2,
     xlab=" ", col="#b3db25", yaxt='n',xaxt='n',
     bg='#b3db2577', ylab='',   main='')
#      2, line=2.5 ,at=14,col="black", cex=1.2)
axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)
#legend(.4,11, pch=p,legend=c

axis(4, at = y3, labels = why, tick = TRUE, cex.axis=1.8, las=2)
mtext('depth (m)', at=13.5, side=4,line=3.2, cex=1.2)

dev.off()

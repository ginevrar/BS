


#mehg out
L1<-c(0.3497755,	0.3848843,	0.4685913,	0.5679968,	0.7814427,	1.1722684,	1.1908319,	1.2207873,	1.2357983) 
L2<-c(0.2559063,	0.2750452,	0.3275904,	0.3883713,	0.5168229,	0.7781901,	0.7921778,	0.8194976,	0.8312166)
L2b<-c(0.02096586, 0.01922611, 0.03812676, 0.09364179, 0.42592694, 0.64154218, 0.65321874, 0.67651183, 0.68638584)
L2t<-c(0.04182167, 0.04358546, 0.07188910, 0.13761627, 0.43898412, 0.66114808,0.67314509, 0.69698186, 0.70711717)
L2tbb<-c(0.03481698, 0.03220024, 0.04832096, 0.08811099, 0.27548792, 0.41588776, 0.42400268, 0.44156880, 0.44856006)
L3<-c(0.2094286,	0.2206606,	0.2577773,	0.2994355,	0.3858102,	0.5820193,	0.593122,   0.6164701,	0.6259344) 
L4<-c( 0.1817237, 0.1882424, 0.2161624, 0.2464218,   0.3077157,  0.4647380,  0.4739146,  0.4939871,  0.5018907) 
L5<-c(0.1632538,	0.1666298,	0.1884177,	0.2110764,	0.2556472,	0.3857885,	0.3932107,	0.4089185,	0.4152378)
L6<-c(0.1505495,	0.1517646,	0.1693363,	0.1867695,	0.2198419,	0.3326888,	0.3396552,	0.3558866,	0.3620052) 



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

# The null hypothesis is that the x adn y
# are identical populations
# At .05 significance level, we conclude that the 
# gas mileage data of manual and automatic transmissions 
# in mtcar are nonidentical populations.

wilcox.test(medie_mehg_pM, L1, paired=T)

wilcox.test( L1, medie_mehg_pM, paired=T, conf.int = TRUE)
wilcox.test( L2, medie_mehg_pM, paired=T, conf.int = TRUE)
wilcox.test( L3, medie_mehg_pM, paired=T, conf.int = TRUE)
wilcox.test( L4, medie_mehg_pM, paired=T, conf.int = TRUE)
wilcox.test( L5, medie_mehg_pM, paired=T, conf.int = TRUE)
wilcox.test( L6, medie_mehg_pM, paired=T, conf.int = TRUE)

anne<-c(0.08944499, 0.08598950, 0.09824601, 0.11998911, 0.21536600, 0.61997213,0.65228864, 0.74843775, 0.76480300)
wilcox.test( medie_mehg_pM,anne, paired=T, conf.int = TRUE)

wilcox.test( L6, medie_mehg_pM, paired=T, conf.int = TRUE)
shapiro.test(medie_mehg_pM)

# Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))}
# Function that returns Mean Absolute Error
mae <- function(error)
{
  mean(abs(error))
}
error_L1<-medie_mehg_pM-L1# Example of invocation of functions
error_L2<-medie_mehg_pM-L2# Example of invocation of functions
error_L3<-medie_mehg_pM-L3# Example of invocation of functions
error_L4<-medie_mehg_pM-L4# Example of invocation of functions
error_L5<-medie_mehg_pM-L5# Example of invocation of functions
error_L6<-medie_mehg_pM-L6# Example of invocation of functions
error_anne<-medie_mehg_pM-anne# Example of invocation of functions

error_L2b<-medie_mehg_pM-L2b# Example of invocation of functions
error_L2t<-medie_mehg_pM-L2t# Example of invocation of functions
error_L2tbb<-medie_mehg_pM-L2tbb
# Example of invocation of functions

rmse(error_L2) #sim sm1
rmse(error_L3) ##sim sm2
rmse(error_L2t) #sim sm3
rmse(error_L2tbb)#sim sm4
rmse(error_L6)#sim sm5


rmse(error_anne)

rmse(error_L2b)
rmse(error_L2t)
rmse(error_L2tbb)


eL1


# This p-value tells you what the chances are that the sample 
# comes from a normal distribution. The lower this value, the smaller 
# the chance. Statisticians typically use a value of 0.05 as a cutoff, 
# so when the p-value is lower than 0.05, you can conclude that 
#the sample deviates from normality.

# --- PLOT Mehg----------------------mehg

tiff('Lamborg2.tiff', height=25, width=30, units='cm', 
     compression="lzw", res=300)
#L1
par(mar=c(4.5,5,1,0), mfrow=c(2,3),cex.axis=1.2, cex.lab=1.3, cex.main=2.4 )
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n',xaxt='n',
     xlim=c(0, 1.3), pch=21,
     ylab=" ", xlab=" ", type="b", col="#5716a2",bg='#5716a255')

text(0.7,11.4,expression(paste('k'[m-OL]*'= 4·10'^-4)),cex=2.2)
text(0.7,11.9,expression(paste('k'[dm-OL]*'= 1·10'^-2)),cex=2.2)

text(0.7,12.6,expression(paste('k'[m-SOL]*'= 2·10'^-3)),cex=2.2)
text(0.7,13.1,expression(paste('k'[dm-SOL]*'= 2 10'^-2)),cex=2.2)

text(0.7,13.8,expression(paste('k'[m-AOL]*'= 4·10'^-3)),cex=2.2)
text(.9,14.2,expression(paste('- 4·10'^-4)),cex=2.2)
text(0.8,14.9,expression(paste('k'[dm-AOL]*'= 1.4·10'^-2)),cex=2.2)
text(1,15.3,expression(paste('- 1.4·10'^-3)),cex=2.2)

abline(h=15.64,   lty=2, col='grey60')
abline(h=16.2,   lty=2, col='grey60')

segments(x2-sd2,y,x2+sd2,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#5716a2')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#5716a2')
par(new=TRUE)
plot(anne, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.3), lty=2,
     xlab=" ", col="#b3db25", yaxt='n',xaxt='n',
     bg='#b3db2577', ylab='',   main=' ')
title('base',line=-1.6)

p<-c(21,23)

at=c(0,0.1,.3,.5,.7,.9,1.1)
atx=c(0.2,.4,.6,.8,1)
axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)

y2<-c(10.5,11.5,12.5,13.5,14.5,15.5,16.5,17, 17.5);y1<-c(11,12,13,14,15,16,17)

axis(2, at=y1,line=0, col="black", cex.axis=1.6 , las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)
mtext(expression(paste(sigma[theta]*' (kg m'^-3*')')), 2, line=2.8,at=13.5,
      col="black", cex=1.2)

#  sm1 = L2
par(mar=c(4,2.5,1,2.5), cex.axis=1.2, cex.lab=1.3, cex.main=2.4 )
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
     xlab=" ", col="#197319", yaxt='n',xaxt='n',
     bg='#19731977', ylab='',   main=' ')
title('sm1',line=-1.4)

p<-c(21,23)

text(0.8,12.6,expression(paste('k'[m-SOL]*'= 8 10'^-3)),cex=2.2)
text(0.8,13.1,expression(paste('k'[dm-SOL]*'= 2 10'^-2)),cex=2.2)

#legend(.4,11, pch=p,legend=c("Observations", 
#                            'Model'),pt.cex=2,
#     col=c("#5716a

axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)


# sm2 (ex sm3)
par(mar=c(4.5,0,1,5), cex.axis=1.2, cex.lab=1.3, cex.main=2.4 )


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
     xlab=" ", col="#197319", yaxt='n',xaxt='n',
     bg='#19731977', ylab='')
#x axis
title('sm2',line=-1.4)

text(0.8,12.6,expression(paste('k'[m-SOL]*'= 8 10'^-3)),cex=2.2)
text(0.8,13.1,expression(paste('k'[dm-SOL]*'= 3 10'^-2)),cex=2.2)

y3<-c( 10.5, 12.05, 14.25, 15.285, 15.64, 16.2, 16.6, 17.04, 17.35);why<-c(0,   20,      40,    55,    75,   100,  280,  460,   2000)
axis(4, at = y3, labels = why, tick = TRUE, cex.axis=1.8, las=2)

mtext('depth (m)', at=13.5, side=4,line=3.2, cex=1.2)

#L3
par(mar=c(4.5,5,1,0), cex.axis=1.8, cex.lab=1.3, cex.main=2.4 )

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
plot(L2t, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.3), lty=2,
     xlab=" ", col="#197319", yaxt='n',xaxt='n',
     bg='#19731977', ylab='',   main=' ')
#mtext(expression(paste(sigma[theta]*'  (kg/m'^3*')')),
#      2, line=2.5 ,at=14,col="black", cex=1.2)
title('sm3',line=-1.4)

text(0.8,12.6,expression(paste('k'[m-SOL]*'= 8 10'^-3)),cex=2.2)
text(0.8,13.1,expression(paste('k'[dm-SOL]*'= 2 10'^-2)),cex=2.2)

text(0.8,11.4,expression(paste('k'[dm-OL]*'= 1 10'^-2)),cex=2.2)

axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)

axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)

#y axis
axis(2, at=y1,line=0, col="black", cex.axis=1.8 , las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.8)
mtext(expression(paste(sigma[theta]*' (kg m'^-3*')')), 2, line=2.8,at=13.5,
      col="black", cex=1.2)



#sm4 (L2tbb)
par(mar=c(4.5,2.5,1,2.5), cex.axis=1.8, cex.lab=1.3, cex.main=2.4 )
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
plot(L2tbb, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.3), lty=2,
     xlab=" ", col="#197319", yaxt='n',xaxt='n',
     bg='#19731977', ylab='')
title('sm4',line=-1.4)

text(0.8,11.9,expression(paste('k'[dm-OL]*'= 1·10'^-2)),cex=2.2)

text(0.8,12.6,expression(paste('k'[m-SOL]*'= 8 10'^-3)),cex=2.2)
text(0.8,13.1,expression(paste('k'[dm-SOL]*'= 4 10'^-2)),cex=2.2)

axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)
#legend(.4,11, pch=p,legend=c

# sm 5 (L6)
par(mar=c(4.5,0,1,5), cex.axis=1.8, cex.lab=1.3, cex.main=2.4 )
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
     xlab=" ", col="#197319", yaxt='n',xaxt='n',
     bg='#19731977', ylab='')
title('sm5',line=-1.4)
#      2, line=2.5 ,at=14,col="black", cex=1.2)
axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.2)
#legend(.4,11, pch=p,legend=c

text(0.8,12.6,expression(paste('k'[m-SOL]*'= 1.5 10'^-2)),cex=2.2)
text(0.8,13.1,expression(paste('k'[dm-SOL]*'= 1.1 10'^-1)),cex=2.2)

axis(4, at = y3, labels = why, tick = TRUE, cex.axis=1.8, las=2)
mtext('depth (m)', at=13.5, side=4,line=3.2, cex=1.2 )

dev.off()
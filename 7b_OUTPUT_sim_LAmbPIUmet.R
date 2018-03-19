medie_mehg_pM<-c(0.116285714, 0.1408125,0.120611111, 0.108857143,
                 0.157888889, 0.767916667, 0.551913043, 0.751090909,
                 0.737428571)
#sm1 -- RMSE = 0.1802555

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt2/Lamb_piuDEM/L1')
L_base<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt2/Lamb_piuDEM/L2')
L_met_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt2/Lamb_piuDEM/L3')
L_met_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt2/Lamb_piuDEM/L4')
L_demet_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt2/Lamb_piuDEM/L5')
L_demet_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt2/Lamb_piuDEM/L6')
L_max_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt2/Lamb_piuDEM/L7')
L_min_min<-read.table('mod_out.txt',header=T)

MeHg<-data.frame(L_base$dissMehg_pM,
            L_met_min$dissMehg_pM, L_met_max$dissMehg_pM,  
          L_demet_min$dissMehg_pM,L_demet_max$dissMehg_pM,
          L_min_min$dissMehg_pM, L_max_max$dissMehg_pM)
names(MeHg)<-c('b','metmin','metmax','demmin',
                 'demmax','minmin','maxmax')

Errors_mehg_Lam_piu_DEM<-data.frame(L_base$RMSE, L_met_min$RMSE, 
              L_met_max$RMSE,  
              L_demet_min$RMSE, L_demet_max$RMSE,
              L_min_min$RMSE,L_max_max$RMSE)
names(Errors_mehg_Lam_piu_DEM)<-c('b','metmin','metmax',
                 'demmin',
                 'demmax','minmin','maxmax')
            
prof<-c(11.4525,13.3275,14.715,15.41, 15.92,16.41,16.83,17.14,17.25)

a1<-apply(MeHg, 1, FUN=min); a2<-apply(MeHg, 1, FUN=max)

a1<-c(1.356429e-02,a1)
a2<-c(3.777283e-2,a2)

xx1<-c(a1,rev(a2))
yy<-c(yy1,rev(yy1))

y<-prof
min<-a1
max<-a2


medie_hg_pM<-c(1.86,2.127058824,1.7675,1.902,2.056666667,3.0875,
               2.810909091,3.714,3.713684211)

Hg<-data.frame(L_base$disshg_pM, L_met_min$disshg_pM, L_met_max$disshg_pM,  
           L_demet_min$disshg_pM,L_demet_max$disshg_pM,
          L_min_min$disshg_pM, L_max_max$disshg_pM)

names(Hg)<-c('b','metmin','metmax','demmin',
                 'demmax','minmin','maxmax')

Errors_hg_Lam_piu_DEM<-data.frame(L_base$RMSE_hg, L_met_min$RMSE_hg, L_met_max$RMSE_hg,  
                 L_demet_min$RMSE_hg, L_demet_max$RMSE_hg,
                 L_min_min$RMSE_hg,L_max_max$RMSE_hg)

names(Errors_hg_Lam_piu_DEM)<-c('b','metmin','metmax','demmin',
                 'demmax','minmin','maxmax')

b1<-apply(Hg, 1, FUN=min);b2<-apply(Hg, 1, FUN=max)

zz1<-c(b1,rev(b2))

y<-prof
min<-b1
max<-b2

tiff('LAmborg_piUDEM.tiff', height=25, width=25, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,2),cex.axis=1.2, cex.lab=1.3, 
    cex.main=1.4, mar=c(4.5,5,1,0))
plot(medie_hg_pM, prof,  bty='n',lwd=2, cex=3,
     ylim=c(17.5,11), lty=1, 
     xlim=c(1, 4), pch=21,
     ylab=" ",  type="b", xlab='Hg (pM)', 
     col="#5716a2", bg='#5716a244',main=" ") 
abline(h=15.64, lty=2, col='grey60')
abline(h=16.2,  lty=2, col='grey60')
segments(x1-sd1,y,x1+sd1,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x1-sd1,y-epsilon,x1-sd1,y+epsilon, col='#5716a2')
segments(x1+sd1,y-epsilon,x1+sd1,y+epsilon, col='#5716a2')
polygon(zz1,yy,col='#b3db2544',border = NA)
#lines(x, y, lwd = 2, col='#748929')
#points(x, y, lwd = 2, col='#748929', cex=4, pch=23)
par(new=T)
plot(L_base$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='grey50',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(L_min_min$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='grey50',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(L_max_max$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='grey50',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(L_met_min$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='grey50',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(L_met_max$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='grey50',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(L_demet_min$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='grey50',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(L_met_max$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='grey50',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
text(3.2,12,'OL', cex=1.6, font=2)
text(3.5,15.9,'SOL', cex=1.6, font=2)
text(1.5,16.5,'AOL', cex=1.6, font=2)


## _______ MEHG ________________________##
par(mar=c(4.5,.5,1,5))
plot(medie_mehg_pM, prof,  bty='n',lwd=2, cex=4,
     ylim=c(17.5,11), lty=1, yaxt='n',  
     xlim=c(0, 1.3), pch=21,
     ylab=" ", xlab=" ", type="b",     
     col="#5716a200", bg='#5716a200',main=" ") 
abline(h=15.64, lty=2, col='grey60')
abline(h=16.2,  lty=2, col='grey60')

segments(x2-sd2,y,x2+sd2,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#5716a2')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#5716a2')
polygon(xx1,yy,col='#b3db2533',border = NA)

#lines(x, y, lwd = 2, col='#748929')
#points(x, y, lwd = 2, col='#748929', cex=4, pch=23)
par(new=T)
plot(medie_mehg_pM, prof, yaxt='n',  
     bty='n',lwd=2, cex=3, ylab='',xlab='MeHg (pM)',
     ylim=c(17.5,11), lty=1, 
     xlim=c(0, 1.3), pch=21,
     type="b",     
     col="#5716a2", bg='#5716a244',main=" ")
par(new=T)

plot(L_min_min$dissMehg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='grey50',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(L_max_max$dissMehg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='grey50',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)

text(0.6,11.6,expression(paste('k'[m]*'=0')),cex=1.4)
text(0.6,12,expression(paste('k'[dm]*'=0')),cex=1.4)

text(0.75,15.75,expression(paste('k'[m]*'=8·10'^-3*'± 50%')),cex=1.4)
text(0.75,16.05,expression(paste('k'[dm]*'=3·10'^-2*'± 50%')),cex=1.4)

text(0.2,16.35,expression(paste('k'[m]*'=0')),cex=1.4)
#text(0.15,16.5,expression(paste('4·10'^-3*'± 50%')),cex=1.4)

text(0.25,16.65,expression(paste('k'[dm]*'=0')),cex=1.4)
#text(0.15,17,expression(paste('1.5·10'^-2*'± 50%')),cex=1.4)

par(new=T)

plot(L_base$dissMehg_pM,type='l', prof, yaxt='n',  
     bty='n',lwd=2, cex=2,col='grey50',               #bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23, ylab='',xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(L_met_min$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(L_met_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3, yaxt='n',  xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(L_demet_min$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3, xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(L_demet_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3, xlab='',
     xlim=c(0, 1.3))

y1<-c( 10.5, 12.05, 14.25, 15.285, 15.64, 16.2, 16.6, 17.04, 17.35)
why<-c(0,   20,      40,    55,    75,   100,  280,  460,   2000)
axis(4, at = y1, labels = why, tick = TRUE, cex.axis=1.5, las=2)
mtext('depth (m)', at=13.5, side=4,line=3.2, cex=1.6)
dev.off()

c1<-cor(medie_mehg_pM,MeHg)
cor_mehg<-mean(c1);sd_cor_mehg<-sd(c1)
c2<-cor(medie_hg_pM,Hg)
cor_hg<-mean(c2);sd_cor_hg<-sd(c2)

er_mehg<-rowMeans(Errors[1,]);er_sd_mehg<-sd(Errors[1,])
er_hg<-rowMeans(Errors_hg[1,]);er_sd_hg<-sd(Errors_hg[1,])


df1<-c(cor_hg,sd_cor_hg, cor_mehg, sd_cor_mehg, 
       er_hg,er_sd,er_mehg, er_sd_mehg)


write.table(df1, 'Errors_andcorr_lamb_DEM.txt')

write.table(Errors, 'Mehg_errors.txt')
write.table(Errors_hg, 'Hg_errors.txt')
write.table(Hg, 'hg_conc.txt')
write.table(MeHg, 'mehg_conc.txt')

min(Errors[,1])
min(Errors_hg[,1])


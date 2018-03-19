medie_mehg_pM<-c(0.116285714, 0.1408125,0.120611111, 0.108857143,
                 0.157888889, 0.767916667, 0.551913043, 0.751090909,
                 0.737428571)
#sm1 -- RMSE = 0.1802555

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/Fosfati/F1')
F_base<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/Fosfati/F2')
F_met_min<-read.table('mod_out.txt',header=T)

#setwd('C:/Users/gi/Documents/Lavoro/simREV2/NUOVE_MET/Fosfati/F3')
setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/Fosfati/F3')
F_met_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/Fosfati/F4')
F_demet_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/Fosfati/F5')
F_demet_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/Fosfati/F6')
F_min_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/Fosfati/F7')
F_max_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/add_sim1')
new1<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/add_sim2')
new2<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/add_sim3')
new3<-read.table('mod_out.txt',header=T)

MeHga<-data.frame(F_base$dissMehg_pM,
                 F_met_min$dissMehg_pM, F_met_max$dissMehg_pM,  
                 F_demet_min$dissMehg_pM,
                 F_demet_max$dissMehg_pM,
                 F_min_min$dissMehg_pM,
                 F_max_max$dissMehg_pM,new1$dissMehg_pM ,
                 new2$dissMehg_pM ,new3$dissMehg_pM  )
names(MeHga)<-c('b','metmin','metmax','demmin',
               'demmax','minmin','maxmax','new1','new2','new3')

MeHg<-data.frame(F_base$dissMehg_pM,
                 F_met_min$dissMehg_pM, F_met_max$dissMehg_pM,  
                 F_demet_max$dissMehg_pM,
                 F_min_min$dissMehg_pM,
                 F_max_max$dissMehg_pM,new1$dissMehg_pM ,
                 new2$dissMehg_pM  )
names(MeHg)<-c('b','metmin','metmax',
               'demmax','minmin','maxmax','new1','new2')

plot(MeHg,prof)
a1<-apply(MeHga, 1, FUN=min); a2<-apply(MeHga, 1, FUN=max)
a1<-c(0.03949753,a1)
a2<-c(0.1399403,a2)
xx<-c(a1,rev(a2))
max(MeHga[9,])
Errors_mehg_fosf<-data.frame(F_base$RMSE, F_met_min$RMSE, 
                   F_met_max$RMSE,  
                   F_demet_min$RMSE, F_demet_max$RMSE,
                   F_min_min$RMSE, F_max_max$RMSE,
                   new1$RMSE, new2$RMSE,new3$RMSE )
names(Errors_mehg_fosf)<-c('b','metmin','metmax','demmin',
                 'demmax','minmin','maxmax','new1','new2','new3')

prof<-c(11.4525,13.3275,14.715,15.41, 15.92,16.41,16.83,17.14,17.25)
yy<-c(prof,rev(prof))

x<-F_base$dissMehg_pM
y<-prof
min<-a1
max<-a2

setwd('C:/Users/gi/Documents/Lavoro/nuoveMEt3/Fosfati')

medie_hg_pM<-c(1.86,2.127058824,1.7675,1.902,2.056666667,3.0875,
               2.810909091,3.714,3.713684211)

Hg<-data.frame(F_base$disshg_pM,F_met_min$disshg_pM, F_met_max$disshg_pM,  
               F_demet_min$disshg_pM,F_demet_max$disshg_pM,
               F_min_min$disshg_pM,F_max_max$disshg_pM, 
               new1$disshg_pM, new2$disshg_pM, new3$disshg_pM)
names(Hg)<-c('b','metmin','metmax','demmin',
             'demmax','minmin','maxmax', 'new1','new2','new3')

Errors_hg_fosf<-data.frame(F_base$RMSE_hg, F_met_min$RMSE_hg, 
                      F_met_max$RMSE_hg,  
                      F_demet_min$RMSE_hg, F_demet_max$RMSE_hg,
                      F_min_min$RMSE_hg,F_max_max$RMSE_hg,
                      new1$RMSE_hg,new2$RMSE_hg,new3$RMSE_hg)
names(Errors_hg_fosf)<-c('b','metmin','metmax','demmin',
                    'demmax','minmin','maxmax','new1',
                    'new2','new3')

b1<-apply(Hg, 1, FUN=min);b2<-apply(Hg, 1, FUN=max)

ff<-c(b1,rev(b2))
prof1<-c(10.5,prof)

yy<-c(prof1,rev(prof1));y<-prof
min<-b1; max<-b2
setwd('C:/Users/gi/Desktop')

tiff('FOsfati_met2.tiff', height=25, width=25, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,2),cex.axis=1.2, cex.lab=1.3, 
    cex.main=1.4, mar=c(4.5,5,1,0))

plot(medie_hg_pM, prof,  bty='n',lwd=2, cex=3,
     ylim=c(17.5,11), lty=1, 
     xlim=c(1, 4), pch=21,
     ylab=" ",  type="b", xlab='Hg (pM)', 
     col="#5716a2", bg='#00000044',main=" ") 
abline(h=15.64, lty=2, col='grey60')
abline(h=16.2,  lty=2, col='grey60')
segments(x1-sd1,y,x1+sd1,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x1-sd1,y-epsilon,x1-sd1,y+epsilon, col='#5716a2')
segments(x1+sd1,y-epsilon,x1+sd1,y+epsilon, col='#5716a2')
polygon(ff,yy,col='#b3db2544',border = NA)
#lines(x, y, lwd = 2, col='#748929')
#points(x, y, lwd = 2, col='#748929', cex=4, pch=23)
par(new=T)
plot(F_base$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,          #bg='#b3db2577',
     ylim=c(17.5,11), lty=1, pch=23,col=1,
     xlim=c(1, 4))
text(3.2,12,'OL', cex=1.6, font=2)
text(3.5,15.9,'SOL', cex=1.6, font=2)
text(1.5,16.5,'AOL', cex=1.6, font=2)
par(new=T)
plot(F_min_min$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col=2,bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)                    
plot(F_met_min$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col=3,bg='#b3db2577',
     ylim=c(17.5,11), lty=4, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(F_met_max$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col=4,bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))                
par(new=T)
plot(F_demet_min$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col=5,bg='#b3db2577',
     ylim=c(17.5,11), lty=4, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(F_demet_max$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col=6,bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(F_max_max$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col=7,bg='#b3db2577',
     ylim=c(17.5,11), lty=5, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(new1$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='cyan4',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(new2$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='darkgoldenrod',bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23,
     xlim=c(1, 4))
par(new=T)
plot(new3$disshg_pM,type='l', prof, xlab=' ',
     bty='n',lwd=2, cex=2,col='purple',bg='#b3db2577',
     ylim=c(17.5,11), lty=4, pch=23,
     xlim=c(1, 4))

legend(3,11,pch=19,
       legend=c('base','minmin','metmin',
                'metmax','demmin','demmax','maxmax',
                'new1','new2', 'new3'),
       col=c(1,2,3,4,5,6,7,'cyan4','darkgoldenrod','purple'))

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
polygon(xx,yy,col='#b3db2533',border = NA)

#lines(x, y, lwd = 2, col='#748929')
#points(x, y, lwd = 2, col='#748929', cex=4, pch=23)
par(new=T)
plot(medie_mehg_pM, prof, yaxt='n',  
     bty='n',lwd=2, cex=3, ylab='',xlab='MeHg (pM)',
     ylim=c(17.5,11), lty=1, 
     xlim=c(0, 1.3), pch=21,
     type="b",     
     col="#5716a2", bg='#00000044',main=" ") 
par(new=T)


text(0.6,11.6,expression(paste('k'[m]*'=6·10'^-4*'± 50%')),cex=1.4)
text(0.6,12,expression(paste('k'[dm]*'=1.5·10'^-2*'± 50%')),cex=1.4)

text(0.75,15.75,expression(paste('k'[m]*'=1.5·10'^-2*'± 50%')), cex=1.4)
text(0.75,16.05,expression(paste('k'[dm]*'=2.1·10'^-1*'± 50%')),cex=1.4)

text(0.2,16.35,expression(paste('k'[m]*'=3.3 - 5.9·10'^-3*'± 50%')),cex=1.4)
#text(0.15,16.5,expression(paste('4·10'^-3*'± 50%')),cex=1.4)

text(0.25,16.65,expression(paste('k'[dm]*'=1.5 - 1,8·10'^-2*'± 50%')),cex=1.4)
#text(0.15,17,expression(paste('1.5·10'^-2*'± 50%')),cex=1.4)
par(new=T)
plot(F_base$dissMehg_pM,type='l', prof, yaxt='n',  
     bty='n',lwd=2, cex=2, col=1,                        #bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23, ylab='',xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(F_min_min$dissMehg_pM,type='l', prof, yaxt='n',  
     bty='n',lwd=2, cex=2, col=2,                        #bg='#b3db2577',
     ylim=c(17.5,11), lty=3, pch=23, ylab='',xlab='',
     xlim=c(0, 1.3))

par(new=T)
plot(F_met_min$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=2,col=3,yaxt='n',  
     ylim=c(17.5,11), lty=1,xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(F_met_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col=4,yaxt='n',  
     ylim=c(17.5,11), lty=3, yaxt='n',  xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(F_demet_min$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col=5,yaxt='n',  
     ylim=c(17.5,11), lty=4, xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(F_demet_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col=6,yaxt='n',  
     ylim=c(17.5,11), lty=3, xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(F_max_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col=7,yaxt='n',  
     ylim=c(17.5,11), lty=4, xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(new1$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col='cyan4',yaxt='n',  
     ylim=c(17.5,11), lty=4, xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(new2$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col='darkgoldenrod',yaxt='n',  
     ylim=c(17.5,11), lty=4, xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(new3$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=2, cex=4,col='purple',yaxt='n',  
     ylim=c(17.5,11), lty=4, xlab='',
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

cor_mehg; sd_cor_mehg
cor_hg; sd_cor_hg

er_mehg<-rowMeans(Errors[1,]);er_sd_mehg<-sd(Errors[1,])
er_hg<-rowMeans(Errors_hg[1,]);er_sd_hg<-sd(Errors_hg[1,])

df1<-data.frame(cor_hg, cor_mehg, er_hg,er_mehg)

write.table(df1, 'Errors_andcorr_casea.txt')


write.table(Errors, 'Mehg_errors_a.txt')
write.table(Errors_hg, 'Hg_errors_a.txt')
write.table(Hg, 'hg_conc_a.txt')
write.table(MeHg, 'mehg_conc_a.txt')

min(Errors);max(Errors)
min(Errors_hg);max(Errors_hg)

hg<-Errors_hg[1,]
mehg<-Errors[1,]
nii<-c('hg', 'mehg')
dfRMSE1<-rbind(hg,mehg)
row.names(dfRMSE1)<-nii
write.csv(dfRMSE1, file='dfRMSE1.csv')

m1<-as.numeric(dfRMSE1[2,])
h1<-as.numeric(dfRMSE1[1,])
#nuovem2 1b
getwd()

min(h1);mean(h1)
min(m1);mean(m1)

df1


plot(errorihg,errori_mehg)
with(errorihg,errori_mehg, pch=19, col=1)
Errors_mehg_Lam[1,]
Errors_hg_Lam_piu_DEM[1,]
Errors_mehg_Lam_piu_DEM[1,]
Errors_mehg_fosf[1,]
Errors_hg_fosf[1,]

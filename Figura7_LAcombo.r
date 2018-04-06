### inserire dati completi Hg
setwd('C:\\Users\\gi\\Dropbox\\BlackSea2\\nuovi_script')
dati<-read.table('Dataset_Finale_new_no_bosforo.txt')
dati_mehg<-data.frame(dati$MeHg, dati$sigma)
str(dati_mehg)
medie_hg_pM<-c(1.86,2.127058824,1.7675,1.902,2.056666667,3.0875,2.810909091,3.714,3.713684211)
medie_mehg_pM<-c(0.116285714,0.1408125,0.120611111,0.108857143,0.157888889,0.767916667,0.551913043,0.751090909,0.737428571)
x1<-medie_hg_pM;x2<-medie_mehg_pM
sd1<-c(0.4911890,0.6179782,0.5060026,0.5832838,0.6269617,0.7147727,0.5266774,0.3722066,0.4352804)
sd2<-c(0.036545471,0.034533498,0.034428338,0.035267684,0.083861152,0.170347104,0.149375644,0.130289388,0.095633974)

tiff('god_and_bad_sim45678.tiff', height=25, width=40, units='cm', 
     compression="lzw", res=300)

tiff('LACombo16.tiff', 
     height=25, width=40, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,4), oma = c(1,9.5,5,8.5)+0.1,
        mar = c(4.5,0.5,1,0)+ 0.1, cex.axis=2.5, cex.lab=2.5, 
    cex.main=2.5)

names(dati_mehg)<-c('mehg','sigma')

###  ALL WATER COL
## _______ MEHG ________________________##
plot(dati_mehg$mehg, dati_mehg$sigma,  
     bty='n',lwd=1.5, 
     cex=5,
     ylim=c(17.24,10.5), lty=1, yaxt='n',  
     xlim=c(0, 1.3), pch=19, xaxt='n',  
     ylab=" ", xlab=" ", type="b",     
     col="#26261900", bg='#26261900',main=" ") 
abline(h=15.64, lty=2, col='grey60')
abline(h=16.2,  lty=2, col='grey60')
y2<-c(10.5,11.5,12.5,13.5,14.5,15.5,
      16.5,17, 17.5)
y1<-c(11,12,13,14,15,16,17)

axis(2, at=y1,line=0, col="black", cex.axis=2.8 , las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=2.8)

axx1<-c(0.1,0.3,0.5,0.7,0.9, 1.1, 1.3)
axx<-c(0,0.2,0.4,0.6,0.8,1,1.2)
text(1.2,10.7,'a', col='grey50', cex=5.3)

aty2<-c(0,0.2,0.4,0.6,0.8,1,1.2)
aty2c<-c(0,0.4,0.8,1.2)
maty2<-c(0.1,0.3,0.5,0.7,.9,1.1,1.3)



mtext(text="Modeled and observed MeHg concentrations",
      cex=2.5, outer = T,
      side=3,line=0)

mtext(expression(paste(sigma[theta]*' (kg m'^-3*')')),
      side= 2,  line=5,at=13.5, col="black", cex=2.5)
polygon(xx,yy,col='#b3db2544',border = '#b3db2544')
str(xx)
par(new=T)
plot(dati_mehg$mehg, dati_mehg$sigma, yaxt='n',  
     bty='n',lwd=1.8, cex=2.5, ylab='', xlab='   pM',
     ylim=c(17.24,10.5), lty=1, 
     xlim=c(0, 1.3), pch=21,
     type="p",    xaxt='n',  
     col="#4d4d4d66", bg='#4d4d4d55',main=" ") 
##axis(1, at=axx1,line=0.1, labels=F,col="black", cex.axis=2.8 , las=1)
#axis(1, at=axx1,line=.9, lwd=0,
#     col="black", cex.axis=2.8 , las=1)
#axis(1, at=axx, line=0.1, col="black", cex.axis=2.8 , tck =-.02, labels= F,las=1)
axis(1, at=aty2, labels =F,tick=T, las=1, cex.axis=1.6, col='#e7298a')
axis(1, at=aty2c, labels =aty2c,tick=T, las=1, cex.axis=1.6, col='#e7298a')
axis(1, at=maty2, labels =F,tick=T, las=1, cex.axis=1.6, col='#e7298a', tcl=-.2)


par(new=T)
plot(F_base$dissMehg_pM,type='l', prof, yaxt='n',  
     bty='n',lwd=1.5, cex=2, col='grey50',xaxt='n',                         #bg='#b3db2577',
     ylim=c(17.24,10.5), lty=3, pch=23, ylab='',xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(F_met_min$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.24,10.5), lty=3,xlab='',xaxt='n', 
     xlim=c(0, 1.3))
par(new=T)
plot(F_met_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=5,col='grey50',yaxt='n', xaxt='n',  
     ylim=c(17.24,10.5), lty=3, yaxt='n',  xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(F_demet_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=5,col='grey50',yaxt='n',xaxt='n',   
     ylim=c(17.24,10.5), lty=3, xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(new1$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=5,col='grey50',yaxt='n',  
     ylim=c(17.24,10.5), lty=3, xlab='',xaxt='n', 
     xlim=c(0, 1.3))

text(0.58,12.3,expression(paste('k'[m])),col='grey20',font= 2,cex=4.3)
text(0.6,12.8,expression(paste('k'[dm])),col='grey20',cex=4.3)

text(0.6,15.9,expression(paste('k'[m])),col='grey20',cex=4.3)
text(1.1,15.9,expression(paste('k'[dm])),col='grey20',cex=4.3)

text(0.17,16.7,expression(paste('k'[m])),col='grey20',cex=4.3)
text(0.19,17.2,expression(paste('k'[dm])),col='grey20',cex=4.3)

##### SOL met + ubiquitus dem
## _______ MEHG ________________________## mar=c(4,5.5,2,0)

plot(medie_mehg_pM, prof,  bty='n',lwd=1.5, cex=4,
     ylim=c(17.24,10.5), lty=1, yaxt='n',  
     xlim=c(0, 1.3), pch=21, xaxt='n', 
     ylab=" ", xlab=" ", type="b",     
     col="#26261900", bg='#26261900',main=" ") 

abline(h=15.64, lty=2, col='grey60')
abline(h=16.2,  lty=2, col='grey60')
axis(1, at=aty2, labels =F,tick=T, las=1, cex.axis=1.6, col='#e7298a')
axis(1, at=aty2c, labels =aty2c,tick=T, las=1, cex.axis=1.6, col='#e7298a')
axis(1, at=maty2, labels =F,tick=T, las=1, cex.axis=1.6, col='#e7298a', tcl=-.2)

par(new=T)
plot(dati_mehg$mehg, dati_mehg$sigma, yaxt='n',  
     bty='n',lwd=1.8, cex=2.5, ylab='',xlab='  pM',
     ylim=c(17.24,10.5), lty=1, xaxt='n', 
     xlim=c(0, 1.3), pch=21,
     type="p",     
     col="#4d4d4d66", bg='#4d4d4d55',main=" ") 
axis(1, at=aty2, labels =F,tick=T, las=1, cex.axis=1.6, col='#e7298a')
axis(1, at=aty2c, labels =aty2c,tick=T, las=1, cex.axis=1.6, col='#e7298a')
axis(1, at=maty2, labels =F,tick=T, las=1, cex.axis=1.6, col='#e7298a', tcl=-.2)

par(new=T)
plot(L_base$dissMehg_pM,type='l', prof, yaxt='n',  
     bty='n',lwd=1.5, cex=2,col='grey50',  xaxt='n',              #bg='#b3db2577',
     ylim=c(17.24,10.5), lty=3, pch=23, ylab='',xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(L_met_min$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.24,10.5), lty=3,xlab='',xaxt='n', 
     xlim=c(0, 1.3))
par(new=T)
plot(L_met_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=4,col='grey50',yaxt='n', xaxt='n',  
     ylim=c(17.24,10.5), lty=3, yaxt='n',  xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(L_demet_min$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=4,col='grey50',yaxt='n',  xaxt='n', 
     ylim=c(17.24,10.5), lty=3, xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(L_demet_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=4,col='grey50',yaxt='n', xaxt='n',  
     ylim=c(17.24,10.5), lty=3, xlab='',
     xlim=c(0, 1.3))

text(0.58,12.3,expression(paste('k'[m])),col='grey20',cex=4.3)
text(0.58,12.3,expression(paste('X')),col='#cc282899',cex=4.6)
text(0.58,12.3,expression(paste('X')),col='#cc282899',cex=4.6)
text(0.6,12.8,expression(paste('k'[dm])),col='grey20',cex=4.3)

text(0.55,15.9,expression(paste('k'[m])),col='grey20',cex=4.3)
text(1,15.9,expression(paste('k'[dm])),col='grey20',cex=4.3)

text(0.18,16.7,expression(paste('k'[m])),col='grey20',cex=4.3)
text(0.18,16.7,expression(paste('X')),col='#cc282899',cex=4.6)
text(0.18,16.7,expression(paste('X')),col='#cc282899',cex=4.6)
text(0.21,17.2,expression(paste('k'[dm])),col='grey20',cex=4.3)
text(1.2,10.7,'b', col='grey50',cex=5.3, outer=F)

###L demet  mar=c(4,5.5,2,0)

plot(medie_mehg_pM, prof,  bty='n',lwd=1.5, cex=4,
     ylim=c(17.24,10.5), lty=1, yaxt='n',  
     xlim=c(0, 1.3), pch=21,xaxt='n', 
     ylab=" ", xlab=" ", type="b",     
     col="#26261900", bg='#26261900',main=" ") 

axis(1, at=axx1,line=0.1, col="black", labels=F,cex.axis=2.8 , las=1)
axis(1, at=axx1,line=.9, lwd=0,
     col="black", cex.axis=2.8 , las=1)
axis(1, at=axx, line=0.1, col="black",
     cex.axis=2.8 , tck =-.02, labels= F,las=1)

abline(h=15.64, lty=2, col='grey60')
abline(h=16.2,  lty=2, col='grey60')

par(new=T)
plot(dati_mehg$mehg, dati_mehg$sigma, yaxt='n',  
     bty='n',lwd=1.8, cex=2.5, ylab='',xlab='  pM',
     ylim=c(17.24,10.5), lty=1, xaxt='n', 
     xlim=c(0, 1.3), pch=21,
     type="p",     
     col="#4d4d4d66", bg='#4d4d4d55',main=" ") 
polygon(xx2,yy,col='#db25b344',border = '#db25b344')
par(new=T)

plot(L1_base$dissMehg_pM,type='l', prof, yaxt='n',  
     bty='n',lwd=1.5, cex=2,col='grey50', xaxt='n',               #bg='#b3db2577',
     ylim=c(17.24,10.5), lty=3, pch=23, ylab='',xlab='',
     
     xlim=c(0, 1.3))
par(new=T)
plot(L1_met_min$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.24,10.5), lty=3,xlab='',xaxt='n', 
     xlim=c(0, 1.3))
par(new=T)
plot(L1_met_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=4,col='grey50',yaxt='n',  xaxt='n', 
     ylim=c(17.24,10.5), lty=3, yaxt='n',  xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(L1_demet_min$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=4,col='grey50',yaxt='n',  xaxt='n', 
     ylim=c(17.24,10.5), lty=3, xlab='',
     xlim=c(0, 1.3))
par(new=T)
plot(L1_demet_max$dissMehg_pM,type='l', prof, ylab='',
     bty='n',lwd=1.5, cex=4,col='grey50',yaxt='n',  xaxt='n', 
     ylim=c(17.24,10.5), lty=3, xlab='',
     xlim=c(0, 1.3))

text(0.58,12.3,expression(paste('k'[m])),cex=4.3, col='grey20')
text(0.58,12.3,expression(paste('X')),col='#cc282899',cex=4.6)
text(0.58,12.3,expression(paste('X')),col='#cc282899',cex=4.6)
text(0.6,12.8,expression(paste('k'[dm])),col='grey20',cex=4.3)
text(0.6,12.8,expression(paste('X')),col='#cc282899',cex=4.6)
text(0.6,12.8,expression(paste('X')),col='#cc282899',cex=4.6)

text(0.55,15.9,expression(paste('k'[m])),col='grey20',cex=4.3)
text(0.98,15.9,expression(paste('k'[dm])),col='grey20',cex=4.3)

text(1.1,16.8,expression(paste('k'[m])),col='grey20',cex=4.3)
text(1.1,16.8,expression(paste('X')),col='#cc282899',cex=4.6)
text(1.1,16.8,expression(paste('X')),col='#cc282899',cex=4.6)
text(1.15,17.2,expression(paste('k'[dm])),col='grey20',cex=4.3)
text(1.15,17.2,expression(paste('X')),col='#cc282899',cex=4.6)
text(1.15,17.2,expression(paste('X')),col='#cc282899',cex=4.6)

y2<-c(10.5,11.5,12.5,13.5,14.5,15.5,
      16.5,17, 17.5)
y1<-c(11,12,13,14,15,16,17)

text(1.2,10.7,'c', col='grey50',cex=5.3, outer=F)

####_____ COMBO mar=c(4,5.5,2,0) mar=c(4,5.5,2,0), 

plot(medie_mehg_pM, prof,  bty='n',lwd=1.5, cex=4,
     ylim=c(17.24,10.5), lty=1, yaxt='n',  
     xlim=c(0, 1.3), pch=21, xaxt='n', 
     ylab=" ", xlab=" ", type="b",     
     col="#26261900", bg='#26261900',main=" ") 
abline(h=15.64, lty=2, col='grey60')
abline(h=16.2,  lty=2, col='grey60')

segments(x2-sd2,y,x2+sd2,y, col=  '#262619', lwd=1.6)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, lwd=1.6, col='#262619')

segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, lwd=1.6, col='#262619')

#title(expression('                    All hypoteses \n modeled VS observed MeHg profiles'), line=1, cex=1.1)
text(1.2,10.7,'d', col='grey50',cex=5.3)
#lines(x, y, lwd = 2, col='#748929')
#points(x, y, lwd = 2, col='#748929', cex=4, pch=23)
par(new=T)
plot(medie_mehg_pM, prof, yaxt='n',  xaxt='n', 
     bty='n',lwd=1.8, cex=3.9, ylab='',xlab='  pM',
     ylim=c(17.24,10.5), lty=1, 
     xlim=c(0, 1.3), pch=21,
     type="b",     
     col="#262619", bg='#26261944',main=" ") 

polygon(xx,yy,col='#b3db2544',border = '#b3db25')
polygon(xx1,yy,col='#25b3db44',border = '#25b3db')
polygon(xx2,yy,col='#db25b344',border = '#db25b3')

axis(1, at=axx1,line=0.1, col="black",labels=F,
     cex.axis=2.8 , las=1)
axis(1, at=axx1,line=.9, lwd=0,
     col="black", cex.axis=2.8 , las=1)
axis(1, at=axx, line=0.1, col="black", cex.axis=2.8 , tck =-.02, labels= F,las=1)
polygon(xx,yy,col='#b3db2544',border = '#b3db25')
polygon(xx1,yy,col='#25b3db44',border = '#25b3db')
polygon(xx2,yy,col='#db25b344',border = '#db25b3')

text(0.9,12.5,'OL', cex=3.3, font=2, col='grey30')
text(1.1,15.9,'SOL', cex=3.3, font=2, col='grey30')
text(1,16.8,'AOL', cex=3.3, font=2, col='grey30')


y1<-c( 10.5,11.5, 13, 14.25,  15.64, 16.2, 16.55, 16.9, 17.24)
why<-c(0,10,   25,      50,   75,   100,  250, 500,    2000) 
          
axis(4, at = y1, labels = why, tick = TRUE, cex.axis=2.8, las=2)


mtext('depth (m)', at=13.8, side=4,line=6.3,
      cex=2.5, las=3)
par(new=T)
plot(medie_mehg_pM, prof, yaxt='n',  xaxt='n', 
     bty='n',lwd=1.8, cex=3.9, ylab='',xlab=' ',
     ylim=c(17.24,10.5), lty=1, 
     xlim=c(0, 1.3), pch=21,
     type="b",     
     col="#262619", bg='#26261944',main=" ") 

dev.off()








errorihg<-as.numeric(c(Errors_hg_Lam[1,],
                       Errors_hg_Lam_piu_DEM[1,],
                       Errors_hg_fosf[1,]))
errori_mehg<-as.numeric(c(Errors_mehg_Lam[1,],
                          Errors_mehg_Lam_piu_DEM[1,],
                          Errors_mehg_fosf[1,]))
tipo<-c(c('Lb','Lmetmin','Lmetmax',
  'Ldemmin','Ldemmax','Lminmin','Lmaxmax'),
  c('LDb','LDmetmin','LDmetmax',
    'LDdemmin','LDdemmax','LDminmin','LDmaxmax'),
  c('Fb','Fmetmin','Fmetmax',
'Fdemmin','Fdemmax','Fminmin','fmaxmax',
'Fnew1','Fnew2','Fnew3'))

df_errori<-data.frame(tipo,errorihg,errori_mehg)
dev.new()
plot(df_errori$errorihg[1:7],df_errori$errori_mehg[1:7],
     xlab='RMSE Hg',ylab='RMSE MeHg',cex=4,
     xlim=c(0.1,.6),ylim=c(0,0.5), col='#db25b3', pch=21,
     bg='#db25b344')
par(new=T)
plot(df_errori$errorihg[8:14],df_errori$errori_mehg[8:14],
     xlim=c(0.1,.6),ylim=c(0,0.5),col='#25b3db', pch=21,
     xlab='RMSE Hg',ylab='RMSE MeHg',cex=4,
          bg='#25b3db44')
par(new=T)
plot(df_errori$errorihg[15:24],
     df_errori$errori_mehg[15:24],
     xlab='RMSE Hg',ylab='RMSE MeHg',cex=4,
          xlim=c(0.1,.6),ylim=c(0,0.5), col='#b3db25', pch=21,
     bg='#b3db2544')
text(df_errori$errorihg+0.05,df_errori$errori_mehg-0.03,df_errori$tipo,
     xlim=c(0.1,.6),ylim=c(0,0.5))

dev.new()
plot(df_errori$errorihg[15:24],df_errori$errori_mehg[15:24],
     col='#25b3db', pch=21,
     xlab='RMSE Hg',ylab='RMSE MeHg',cex=4,
     bg='#b3db2544')
text(df_errori$errorihg[15:24]+0.01,
     df_errori$errori_mehg[15:24]-0.01,df_errori$tipo[15:24])
abline(h=.2)
abline(v=.35)

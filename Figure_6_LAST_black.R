sedHg_mean<-798
medie_hg_pM<-c(1.86,2.127058824,1.7675,1.902,2.056666667,3.0875,2.810909091,3.714,3.713684211)
sd1<-c(0.4911890,0.6179782,0.5060026,0.5832838,0.6269617,0.7147727,0.5266774,0.3722066,0.4352804)
mean1<-medie_hg_pM

setwd('C:/Users/Ginevra/Dropbox')
dat<-read.table('sed2.txt', header=T); 
sed<-dat$sed/200.59*1000

#setwd('C:/Users/Ginevra/Desktop/ULTIME_hgII___/In1')
setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/In1')
out1<-read.table('mod_out.txt', header=T)

IN1_hg<-out1$disshg_pM
out1_sed<-out1$hgT_surf_sed[1]

rmse1<-out1$RMSE_hg[1]
error1<-sedHg_mean-out1_sed# Example of invocation of functions

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b')
out1b<-read.table('mod_out.txt', header=T)
rmse1b<-out1b$RMSE_hg[1]

IN1b_hg<-out1b$disshg_pM
out1b_sed<-out1b$hgT_surf_sed[1]

error1b<-sedHg_mean-out1b_sed# Example of invocation of functions

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c')
out1c<-read.table('mod_out.txt', header=T)
rmse1c<-out1c$RMSE_hg[1]

IN1c_hg<-out1c$disshg_pM
out1c_sed<-out1c$hgT_surf_sed[1]

error1c<-sedHg_mean-out1c_sed# Example of invocation of functions
sed_rmse1c<-rmse(error1c)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/In2')
out2<-read.table('mod_out.txt', header=T)
rmse2<-out2$RMSE_hg[1]

out2_sed<-out2$hgT_surf_sed[1]
error2<-sedHg_mean-out2_sed# Example of invocation of functions
sed_rmse2<-rmse(error2)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b')
out2b<-read.table('mod_out.txt', header=T)
rmse2b<-out2b$RMSE_hg[1]

out2b_sed<-out2b$hgT_surf_sed[1]
error2b<-sedHg_mean-out2b_sed# Example of invocation of functions
sed_rmse2b<-rmse(error2b)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/Centrale_nome')
outc<-read.table('mod_out.txt', header=T)
rmsec<-outc$RMSE_hg[1]

outc_sed<-outc$surface[1]
errorc<-sedHg_mean-outc_sed# Example of invocation of functions
sed_rmsec<-rmse(errorc)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c')
out2c<-read.table('mod_out.txt', header=T)
rmse2c<-out2c$RMSE_hg[1]

out2c_sed<-out2c$hgT_surf_sed[1]
error2c<-sedHg_mean-out2c_sed# Example of invocation of functions
sed_rmse2c<-rmse(error2c)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c')
out3c<-read.table('mod_out.txt', header=T)
rmse3c<-out3c$RMSE_hg[1]

out3c_sed<-out3c$hgT_surf_sed[1]
error3c<-sedHg_mean-out3c_sed# Example of invocation of functions
sed_rmse3c<-rmse(error3c)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c')
out4c<-read.table('mod_out.txt', header=T)
rmse4c<-out4c$RMSE_hg[1]

out4c_sed<-out4c$hgT_surf_sed[1]
error4c<-sedHg_mean-out4c_sed# Example of invocation of functions
sed_rmse4c<-rmse(error4c)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IVe/In1d')
out1d<-read.table('mod_out.txt', header=T)
rmse1d<-out1d$RMSE_hg[1]

out1d_sed<-out1d$hgT_surf_sed[1]
error1d<-sedHg_mean-out1d_sed
sed_rmse1d<-rmse(error1d)
prof<-c(11.4525,13.3275,14.715,15.41, 15.92,16.41,16.83,17.14,17.25)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IVe/In2d')
out2d<-read.table('mod_out.txt', header=T)
rmse2d<-out2d$RMSE_hg[1]

out2d_sed<-out2d$hgT_surf_sed[1]
error2d<-sedHg_mean-out2d_sed# Example of invocation of functions
sed_rmse2d<-rmse(error2d)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IVe/In3d')
out3d<-read.table('mod_out.txt', header=T)
rmse3d<-out3d$RMSE_hg[1]

out3d_sed<-out3d$hgT_surf_sed[1]
error3d<-sedHg_mean-out3d_sed# Example of invocation of functions
sed_rmse3d<-rmse(error3d)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/In3')
out3<-read.table('mod_out.txt', header=T)
rmse3<-out3$RMSE_hg[1]

out3_sed<-out3$hgT_surf_sed[1]
error3<-sedHg_mean-out3_sed# Example of invocation of functions
sed_rmse3<-rmse(error3)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/In4')
out4<-read.table('mod_out.txt', header=T)
rmse4<-out4$RMSE_hg[1]

out4_sed<-out4$hgT_surf_sed[1]
error4<-sedHg_mean-out4_sed# Example of invocation of functions
sed_rmse4<-rmse(error4)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In3b')
out3b<-read.table('mod_out.txt', header=T)
rmse3b<-out3b$RMSE_hg[1]

out3b_sed<-out3b$hgT_surf_sed[1]
error3b<-sedHg_mean-out3b_sed# Example of invocation of functions
sed_rmse3b<-rmse(error3b)

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In4b')
out4b<-read.table('mod_out.txt', header=T)
rmse4b<-out4b$RMSE_hg[1]

out4b_sed<-out4b$hgT_surf_sed[1]
error4b<-sedHg_mean-out4b_sed# Example of invocation of functions
sed_rmse4b<-rmse(error4b)

nomi_buoni; 


hg_buone<-data.frame(out1$disshg_pM,out2$disshg_pM,
                     out1b$disshg_pM, out2b$disshg_pM,
                     out1c$disshg_pM,out2c$disshg_pM,
                    out3c$disshg_pM,out4c$disshg_pM, outc$disshg_pM)

names(hg_buone)<-c('IN1','IN1b','IN1c','IN2', 'IN2b', 'IN2c', 
                   'IN3c', 'IN4c','ref') 

sed_buone<-data.frame(out1_sed,out2_sed,
                      out1b_sed,out2b_sed,
                      out1c_sed,out2c_sed,
                      out3c_sed,out4c_sed,outc_sed)

a_ord<-as.numeric(sort(sed_buone))

nomi_brutti
hg_male<-data.frame(out3$disshg_pM,out4$disshg_pM,
                    out3b$disshg_pM, out4b$disshg_pM,
                    out1d$disshg_pM,out2d$disshg_pM,
                     out3d$disshg_pM)

bene<-c('IN1','IN1b','IN1c','IN2', 'IN2b', 'IN2c', 'IN3c', 'IN4c') 
names(hg_male)<-c('In1d', 'In2d', 'IN3', 'IN3b', 'IN3d', 'In4', 'IN4b')

sed_male<-data.frame(out1d_sed,out2d_sed,out3_sed,
                     out3b_sed,out3d_sed,
                     out4_sed,out4b_sed)

min_hg_good<-apply(hg_buone, 1, FUN=min);
max_hg_good<-apply(hg_buone,1, FUN=max)
mean_hg_good<-apply(hg_buone,1, FUN=mean)

min_hg_bad<-apply(hg_male, 1, FUN=min);
max_hg_bad<-apply(hg_male,1, FUN=max)
mean_hg_bad<-apply(hg_male,1, FUN=mean)

good_shape<-c(min_hg_good,rev(max_hg_good))
yy<-c(prof,rev(prof))

bad_shape<-c(min_hg_bad,rev(max_hg_bad))

setwd('C:/Users/Ginevra/Desktop')

tiff('god_and_bad_sim456781233.tiff', height=25, width=40, units='cm', 
    compression="lzw", res=300)
par(mfrow=c(1,2),cex.axis=1.6, cex.lab=1.3, bg='black',fg = 'white',
    col.axis = "white", col.clab = "white",
    cex.main=1.4, mar=c(4.5,5.5,1,4.5),oma=c(0,0,2,0), bty='n')
plot(medie_hg_pM, prof,  bty='n',lwd=1.8, cex=3,
     ylim=c(17.5,11), lty=1, 
     xlim=c(0,5), pch=21, yaxt='n',
     ylab=" ",  type="b", xlab='pM', 
     col="#00000000", bg='#00000000',main=" ") 
mtext(expression(paste('Modeled and observed Hg'[D]*' in the water column')), 
      line=1, cex=1.9)
mtext('a',line=0.2,at=-1, col='grey50', cex=3)
polygon(good_shape,yy,col='#E69F00',border = '#E69F00')
y<-prof
abline(h=15.64, lty=2, col='grey60')
abline(h=16.2,  lty=2, col='grey60')
segments(mean1-sd1,y,mean1+sd1,y, col='grey90', lwd=1.8)
epsilon <- 0.12
segments(mean1-sd1,y-epsilon,mean1-sd1,y+epsilon, col='grey90', lwd=1.8)
segments(mean1+sd1,y-epsilon,mean1+sd1,y+epsilon, col='grey90',lwd=1.8)
#polygon(bad_shape,yy,col= '#cd8d0044',border ='#cd8d00')
#polygon(good_shape,yy,col='#E69F0044',border = '#E69F0044')
par(new=T)
plot(medie_hg_pM, prof,  bty='n',lwd=1.8, cex=3,
     ylim=c(17.5,11), lty=1, 
     xlim=c(0,5), pch=21, yaxt='n',
     ylab=" ",  type="b", xlab='pM', 
     col="#E5E5E5", bg='#E5E5E555',main=" ") 
par(new=T)
plot(hg_buone[,1], type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone$IN1,
     type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,3],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,4],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,5],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,6],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,7],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,8],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,9],type='b',pch=25, prof, ylab='',
     bty='n', cex=2.4, col='#333333', bg='#33333366',yaxt='n',  
     ylim=c(17.5,11), lty=4,xlab='',lwd=1.8,
     xlim=c(0,5))  ##e69100  4c4cff   #d19200
par(new=T)
plot(hg_male[,1],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,2],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,3],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,4],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,5],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,6], prof,type='l',  ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,7], prof,type='l',  ylab='',
     bty='n',lwd=1.8, cex=2,col='grey50',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
y2<-c(11.5,12.5,13.5,14.5,15.5,
      16.5,17, 17.5)
y1<-c(11,12,13,14,15,16,17)

axis(2, at=y1,line=0,  cex.axis=1.6 , las=2)
axis(2, at=y2,line=0,labels=F, tck =-.02, cex.axis=1.6)
mtext(expression(paste(sigma[theta]*' (kg m'^-3*')')), 2, line=3.2,at=14.5,
      col="black", cex=1.6)

legend(2.75,12,legend=c('data', 'model mean'), pch=c(21,25), 
       col=c('#E5E5E5'), bty='n', cex=2)

text(3.9,14,'range of \n model output', cex=1.9,font=2, col='#E69F00')

y1<-c( 11.5, 13, 14.25,  15.64, 16.2, 16.6, 17.04, 17.45)
why<-c(10,   25,      50,   75,   100,  250, 500,    2000) 

axis(4, at = y1, labels = why, tick = TRUE, cex.axis=1.5, las=2)
mtext('depth (m)', at=14.5, side=4,line=3.2, cex=1.6)
#mtext('density (m)', at=14.5, side=4,line=3.2, cex=1.6)
mtext(expression(paste('potential density (kg m'^-3*')')), 2, line=3,at=14,
      col="white", cex=1.5)

nomi<-c('data', 'model')
par(mar=c(4.5, 7.5, 1, 2.5)) 
boxplot(sed,a_ord,col=c('#E5E5E5','#E69F00'), 
        xlim=c(0.5,2.5),ylim=c(600,1200),
        names=nomi,
        ylab=' ',cex.lab=1.6,
        horizontal = F, las=c(1),
        range = F, outline = F)
mtext(expression(paste('pmol g'^-1)), 
      at=880, side=2,line=3.6, cex=1.6)
mtext(expression(paste('Hg'[T]*' sediment concentrations')),
      line=1, cex=1.9)
mtext('b',line=0.2,at=0.1, col='grey50', cex=3)
dev.off()
getwd()

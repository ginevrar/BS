sedHg_mean<-798
medie_hg_pM<-c(1.86,2.127058824,1.7675,1.902,2.056666667,3.0875,2.810909091,3.714,3.713684211)
sd1<-c(0.4911890,0.6179782,0.5060026,0.5832838,0.6269617,0.7147727,0.5266774,0.3722066,0.4352804)
mean1<-medie_hg_pM

setwd('C:/Users/gi/Desktop')
dat<-read.table('sed2.txt', header=T)
sed<-dat$sed/200.59*1000

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/In1')
out1<-read.table('mod_out.txt', header=T)

IN1_hg<-out1$disshg_pM
out1_sed<-out1$surface[1]

rmse1<-out1$RMSE_hg[1]
error1<-sedHg_mean-out1_sed# Example of invocation of functions

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b')
out1b<-read.table('mod_out.txt', header=T)
rmse1b<-out1b$RMSE_hg[1]

IN1b_hg<-out1b$disshg_pM
out1b_sed<-out1b$surface[1]

error1b<-sedHg_mean-out1b_sed# Example of invocation of functions

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c')
out1c<-read.table('mod_out.txt', header=T)
rmse1c<-out1c$RMSE_hg[1]

IN1c_hg<-out1c$disshg_pM
out1c_sed<-out1c$surface[1]

error1c<-sedHg_mean-out1c_sed# Example of invocation of functions
sed_rmse1c<-rmse(error1c)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/In2')
out2<-read.table('mod_out.txt', header=T)
rmse2<-out2$RMSE_hg[1]

out2_sed<-out2$surface[1]
error2<-sedHg_mean-out2_sed# Example of invocation of functions
sed_rmse2<-rmse(error2)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b')
out2b<-read.table('mod_out.txt', header=T)
rmse2b<-out2b$RMSE_hg[1]

out2b_sed<-out2b$surface[1]
error2b<-sedHg_mean-out2b_sed# Example of invocation of functions
sed_rmse2b<-rmse(error2b)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/Centrale_nome')
outc<-read.table('mod_out.txt', header=T)
rmsec<-outc$RMSE_hg[1]

outc_sed<-outc$surface[1]
errorc<-sedHg_mean-outc_sed# Example of invocation of functions
sed_rmsec<-rmse(errorc)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c')
out2c<-read.table('mod_out.txt', header=T)
rmse2c<-out2c$RMSE_hg[1]

out2c_sed<-out2c$surface[1]
error2c<-sedHg_mean-out2c_sed# Example of invocation of functions
sed_rmse2c<-rmse(error2c)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c')
out3c<-read.table('mod_out.txt', header=T)
rmse3c<-out3c$RMSE_hg[1]

out3c_sed<-out3c$surface[1]
error3c<-sedHg_mean-out3c_sed# Example of invocation of functions
sed_rmse3c<-rmse(error3c)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c')
out4c<-read.table('mod_out.txt', header=T)
rmse4c<-out4c$RMSE_hg[1]

out4c_sed<-out4c$surface[1]
error4c<-sedHg_mean-out4c_sed# Example of invocation of functions
sed_rmse4c<-rmse(error4c)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IVe/In1d')
out1d<-read.table('mod_out.txt', header=T)
rmse1d<-out1d$RMSE_hg[1]

out1d_sed<-out1d$surface[1]
error1d<-sedHg_mean-out1d_sed
sed_rmse1d<-rmse(error1d)
prof<-c(11.4525,13.3275,14.715,15.41, 15.92,16.41,16.83,17.14,17.25)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IVe/In2d')
out2d<-read.table('mod_out.txt', header=T)
rmse2d<-out2d$RMSE_hg[1]

out2d_sed<-out2d$surface[1]
error2d<-sedHg_mean-out2d_sed# Example of invocation of functions
sed_rmse2d<-rmse(error2d)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IVe/In3d')
out3d<-read.table('mod_out.txt', header=T)
rmse3d<-out3d$RMSE_hg[1]

out3d_sed<-out3d$surface[1]
error3d<-sedHg_mean-out3d_sed# Example of invocation of functions
sed_rmse3d<-rmse(error3d)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/In3')
out3<-read.table('mod_out.txt', header=T)
rmse3<-out3$RMSE_hg[1]

out3_sed<-out3$surface[1]
error3<-sedHg_mean-out3_sed# Example of invocation of functions
sed_rmse3<-rmse(error3)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/In4')
out4<-read.table('mod_out.txt', header=T)
rmse4<-out4$RMSE_hg[1]

out4_sed<-out4$surface[1]
error4<-sedHg_mean-out4_sed# Example of invocation of functions
sed_rmse4<-rmse(error4)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In3b')
out3b<-read.table('mod_out.txt', header=T)
rmse3b<-out3b$RMSE_hg[1]

out3b_sed<-out3b$surface[1]
error3b<-sedHg_mean-out3b_sed# Example of invocation of functions
sed_rmse3b<-rmse(error3b)

setwd('C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In4b')
out4b<-read.table('mod_out.txt', header=T)
rmse4b<-out4b$RMSE_hg[1]

out4b_sed<-out4b$surface[1]
error4b<-sedHg_mean-out4b_sed# Example of invocation of functions
sed_rmse4b<-rmse(error4b)

hg_buone<-data.frame(out1$disshg_pM,out1b$disshg_pM, out1c$disshg_pM,
out2$disshg_pM,out2b$disshg_pM,out2c$disshg_pM,
out3c$disshg_pM,out4c$disshg_pM)

names(hg_buone)<-c('IN1','IN1b','IN1c','IN2', 'IN2b', 'IN2c', 
                   'IN3c', 'IN4c') 

sed_buone<-data.frame(out1_sed,out1b_sed,out1c_sed,out2_sed,
                      out2b_sed,out2c_sed,out3c_sed,out4c_sed)
a_ord<-as.numeric(sort(sed_buone))
hg_male<-data.frame(out1d$disshg_pM,out2d$disshg_pM,out3$disshg_pM,
           out3b$disshg_pM,out3d$disshg_pM,out4$disshg_pM,out4b$disshg_pM)

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

setwd('C:/Users/gi/Desktop/ULTIME_hgII___')
tiff('god_and_bad_sim.tiff', height=25, width=35, units='cm', 
    compression="lzw", res=300)
par(mfrow=c(1,2),cex.axis=1.6, cex.lab=1.3, 
    cex.main=1.4, mar=c(4.5,5.5,1,4.5),oma=c(0,0,2,0), bty='n')
plot(medie_hg_pM, prof,  bty='n',lwd=1.8, cex=3,
     ylim=c(17.5,11), lty=1, 
     xlim=c(0,5), pch=21, yaxt='n',
     ylab=" ",  type="b", xlab='pM', 
     col="#00000000", bg='#00000000',main=" ") 
mtext(expression(paste('Modeled and observed Hg'[D]*' in the water column')), 
      line=1, cex=1.5)
mtext('a',line=0.2,at=-1, col='grey50', cex=3)
y<-prof
abline(h=15.64, lty=2, col='grey60')
abline(h=16.2,  lty=2, col='grey60')
segments(mean1-sd1,y,mean1+sd1,y, col='#000000', lwd=1.8)
epsilon <- 0.12
segments(mean1-sd1,y-epsilon,mean1-sd1,y+epsilon, col='#000000', lwd=1.8)
segments(mean1+sd1,y-epsilon,mean1+sd1,y+epsilon, col='#000000',lwd=1.8)
polygon(bad_shape,yy,col= '#e2e3e866',border ='#e2e3e8')
polygon(good_shape,yy,col='#E69F0066',border = '#E69F00')
#polygon(good_shape,yy,col='#E69F0044',border = '#E69F0044')
par(new=T)
plot(medie_hg_pM, prof,  bty='n',lwd=1.8, cex=3,
     ylim=c(17.5,11), lty=1, 
     xlim=c(0,5), pch=21, yaxt='n',
     ylab=" ",  type="b", xlab='pM', 
     col="#000000", bg='#00000044',main=" ") 
par(new=T)
plot(hg_buone[,1], type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone$IN1,
     type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,3],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,4],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,5],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,6],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,7],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_buone[,8],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,1],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,2],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,3],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,4],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,5],type='l', prof, ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
par(new=T)
plot(hg_male[,6], prof,type='l',  ylab='',
     bty='n',lwd=1.8, cex=2,col='grey90',yaxt='n',  
     ylim=c(17.5,11), lty=3,xlab='',
     xlim=c(0,5))
y2<-c(11.5,12.5,13.5,14.5,15.5,
      16.5,17, 17.5)
y1<-c(11,12,13,14,15,16,17)

axis(2, at=y1,line=0, col="black", cex.axis=1.6 , las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)
mtext(expression(paste(sigma[theta]*' (kg m'^-3*')')), 2, line=3.2,at=14.5,
      col="black", cex=1.6)

y1<-c( 11.5, 13, 14.25,  15.64, 16.2, 16.6, 17.04, 17.45)
why<-c(10,   25,      50,   75,   100,  250, 500,    2000) 

axis(4, at = y1, labels = why, tick = TRUE, cex.axis=1.5, las=2)
mtext('depth (m)', at=14.5, side=4,line=3.2, cex=1.6)

nomi<-c('data', 'model')
par(mar=c(4.5, 7.5, 1, 2.5)) 
boxplot(sed,a_ord,col=c('#00000077','#E69F0077'), 
        xlim=c(0.5,2.5),ylim=c(600,1200),
        names=nomi,
        ylab=' ',cex.lab=1.6,
        horizontal = F, las=c(1),
        range = F, outline = F)
mtext(expression(paste('pmol g'^-1)), 
      at=880, side=2,line=3.6, cex=1.6)
mtext(expression(paste('Modeled and observed Hg'[T]*' in the sediment')),
      line=1, cex=1.5)
mtext('b',line=0.2,at=0.1, col='grey50', cex=3)

dev.off()

setwd("C:/Users/gi/Dropbox/BlackSea2/nuovi_script")
min_max_data<-read.table('MAX_min_hg_mehg_9_layers.txt',header=T)

setwd('C:/Users/gi/Desktop')
dat<-read.table('sed2.txt', header=T)
sed<-dat$sed/200.59*1000

setwd('C:/Users/gi/Desktop/nuoveMEt/Fosfati/F1')
F_base<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Fosfati/F2')
F_met_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Fosfati/F3')
F_met_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Fosfati/F4')
F_demet_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Fosfati/F5')
F_demet_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Fosfati/F6')
F_min_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Fosfati/F7')
F_max_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb/L1')
L1_base<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb/L2')
L1_met_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb/L3')
L1_met_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb/L4')
L1_demet_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb/L5')
L1_demet_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb/L6')
L1_max_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb/L7')
L1_min_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb_piuDEM/L1')
L_base<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb_piuDEM/L2')
L_met_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb_piuDEM/L3')
L_met_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb_piuDEM/L4')
L_demet_min<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb_piuDEM/L5')
L_demet_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb_piuDEM/L6')
L_max_max<-read.table('mod_out.txt',header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt/Lamb_piuDEM/L7')
L_min_min<-read.table('mod_out.txt',header=T)

Hg_f<-data.frame(F_base$disshg_pM,F_met_min$disshg_pM, F_met_max$disshg_pM,  
                 F_demet_min$disshg_pM,F_demet_max$disshg_pM,
                 F_min_min$disshg_pM,F_max_max$disshg_pM)
names(Hg_f)<-c('b','metmin','metmax','demmin',
               'demmax','minmin','maxmax')
Hg_L<-data.frame(L_base$disshg_pM, L_met_min$disshg_pM, L_met_max$disshg_pM,  
                 L_demet_min$disshg_pM,L_demet_max$disshg_pM,
                 L_min_min$disshg_pM, L_max_max$disshg_pM)
names(Hg_L)<-c('b','metmin','metmax','demmin',
               'demmax','minmin','maxmax')
Hg_L_nom<-data.frame(L1_base$disshg_pM, L1_met_min$disshg_pM,
                     L1_met_max$disshg_pM,  
                     L1_demet_min$disshg_pM, L1_demet_max$disshg_pM,
                     L1_min_min$disshg_pM,L1_max_max$disshg_pM)
names(Hg_L_nom)<-c('b','metmin','metmax','demmin',
                   'demmax','minmin','maxmax')

sedhg_f<-data.frame(F_base$surface,F_met_min$surface, F_met_max$surface,  
                    F_demet_min$surface,F_demet_max$surface,
                    F_min_min$surface,F_max_max$surface)
names(sedhg_f)<-c('b','metmin','metmax','demmin',
                  'demmax','minmin','maxmax')
sedhg_L<-data.frame(L_base$surface, L_met_min$surface, L_met_max$surface,  
                    L_demet_min$surface,L_demet_max$surface,
                    L_min_min$surface, L_max_max$surface)
names(sedhg_L)<-c('b','metmin','metmax','demmin',
                  'demmax','minmin','maxmax')
sedhg_L_nom<-data.frame(L1_base$surface, L1_met_min$surface,
                        L1_met_max$surface,  
                        L1_demet_min$surface, L1_demet_max$surface,
                        L1_min_min$surface,L1_max_max$surface)
names(sedhg_L_nom)<-c('b','metmin','metmax','demmin',
                      'demmax','minmin','maxmax')

df_hgw<-data.frame(Hg_L_nom,Hg_L,Hg_f)
df_hgs<-data.frame(sedhg_L_nom,sedhg_L,sedhg_f)

min_hgw<-apply(df_hgw,1,FUN = min)
max_hgw<-apply(df_hgw,1,FUN = max)

min_hgs<-apply(df_hgs,1,FUN = min)
max_hgs<-apply(df_hgs,1,FUN = max)

n<-as.numeric(df_hgs[1,])

boo<-c(min_hgs,rev(max_hgs))
s<-seq(from=0.5, to=1.5, by=((1.5 - 0.5)/(9 - 1)))
yyy<-c(s,rev(s))
sed_b<-rep(out1c_sed,18)

sed_male<-data.frame(out1d_sed,out2d_sed,out3_sed,
                     out3b_sed,out3d_sed,
                     out4_sed,out4b_sed)

ccc<-rep(min(a_ord),9)
c_m<-rep(min(sed_male),9)
ddd<-rep(max(a_ord),9)
d_m<-rep(max(sed_male),9)

bii<-c(ccc,rev(ddd))
s_m<-c(c_m,rev(d_m))

hg_male<-data.frame(out1d$disshg_pM,out2d$disshg_pM,out3$disshg_pM,
                    out3b$disshg_pM,out3d$disshg_pM,out4$disshg_pM,out4b$disshg_pM)
names(hg_male)<-c('In1d', 'In2d', 'IN3', 'IN3b', 'IN3d', 'In4', 'IN4b')


hg_buone<-data.frame(out1$disshg_pM,out1b$disshg_pM, out1c$disshg_pM,
                     out2$disshg_pM,out2b$disshg_pM,out2c$disshg_pM,
                     out3c$disshg_pM,out4c$disshg_pM)

min_hg_good<-apply(hg_buone, 1, FUN=min);
max_hg_good<-apply(hg_buone,1, FUN=max)

min_hg_bad<-apply(hg_male, 1, FUN=min);
max_hg_bad<-apply(hg_male,1, FUN=max)

w_1c<-(out1c$disshg_pM); w_3c<-(out3c$disshg_pM)
ccc1<-min(min_hg_good);  ddd1<-max(max_hg_good)
eee1<-min(min_hg_bad);   ggg1<-max(max_hg_bad)

bii1<-c(ccc1,rev(ddd1))
bii2<-c(rep(ccc1,9),rep(ddd1,9))
str(bii2)
bii_bad<-c(eee1,rev(ggg1))

boo1<-c(min_hgw,rev(max_hgw))
w_best<-rbind(w_1c,w_3c)
ii<-rep(min(min_hgw),9)
hh<-rep(max(max_hgw),9)
ii2<-rep(min(eee1),9)
hh2<-rep(max(ggg1),9)
boo2<-c(ii,hh )
boo_bad<-c(ii2,hh2)
arg<-c(w_best[1,1:9],rev(w_best[2,1:9]))
sed_best<-c(800, 738) 


sed_male<-data.frame(out1d_sed,out2d_sed,out3_sed,
                     out3b_sed,out3d_sed,
                     out4_sed,out4b_sed)

wdatamin<-min(min_max_data$x_Hg_min)
wdatamax<-max(min_max_data$x_Hg_max)

setwd('C:/Users/gi/Desktop/nuoveMEt')
tiff('sed_var.png', height=25, width=35, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,2),cex.axis=1.6, cex.lab=1.3, 
    cex.main=1.4, mar=c(0,5.5,1,4.5),oma=c(0,0,2,0), bty='n')
boxplot(arg, ylim=c(1,5.2),type='l', 
        xlim=c(0.5,1.5), lwd=2, col='#00000000')
text(1, 5.2,'Water', font=2, cex=1.5)
mtext(expression(paste('Modeled Hg concentrations - Sensitivity analysis')),
      side=3, outer=T, line=-0.5, font=2, cex=1.8)
polygon(yyy,boo_bad, col='#e2e3e866', border='#e2e3e8')
polygon(yyy,bii2, col='#E69F0066', border='#E69F00')
polygon(yyy,boo2,    col='#25b3db66', border='#25b3db')
#polygon(yyy,arg,xlim=c(0.5,1.5), lwd=2, col='#E69F00')
text(1,4.8,expression(paste('Tested interval')),
     col='grey30', cex=1.3) 
par(new=T)
boxplot(arg, ylim=c(1,5.2),type='l',
        xlim=c(0.5,1.5), lwd=2, col='#E69F0099')
text(1,4.3, 
     expression(paste('Confidence interval')),
     col='#cd8d00', cex=1.3) 
text(1,4.15, 
     expression(paste('for modeled Hg'[D]*' in water')), 
     col='#cd8d00', cex=1.3) 
text(1,3.55, 
     expression(paste('Variation of modeled Hg'[D])),
     col='#11586b', cex=1.3)
text(1,3.4, 
     expression(paste('induced by k'[m]*' and k'[dm])),
     col='#11586b', cex=1.3)
mtext(expression(paste('pM')),side=2, cex=1.5, line=3)
abline(h=wdatamin, lty=3, lwd=3.5, col='black')
abline(h=wdatamax, lty=3, lwd=3.5,col='black')

text(.65,2.5, 'Reference',col=1, cex=1.3)
text(.65,2.35,'simulation',col=1, cex=1.3)

mm<-min(sed)
mn<-max(sed)

boxplot(sed_best, ylim=c(500,1220),main=' ',
        xlim=c(0.5,1.5), lwd=2, col='#000000')
text(1,1220,'Sediment', font=2, cex=1.5)
polygon(yyy, s_m,col='#e2e3e866', border='#e2e3e8')
polygon(yyy,bii,col='#E69F0066', border='#E69F00')
polygon(yyy, boo,col='#25b3db66', border='#25b3db')
abline(h=mm, lty=3, lwd=3.5, col='black')
abline(h=mn,  lty=3, lwd=3.5, col='black')
mtext(expression(paste('pmol g'^-1)),side=2, cex=1.5,
      line=3)
text(1,1000,expression(paste('Confidence interval')),
     col='#cd8d00', cex=1.3) 
text(1,980,expression(paste('for modeled Hg'[T]*' in sediment')), 
     col='#cd8d00', cex=1.3)

text(1,1170,expression(paste('Tested interval')),
     col='grey30', cex=1.3) 
text(1,860,expression(paste('Variation of modeled Hg'[T])),
     col='#11586b', cex=1.3)
text(1,840, 
     expression(paste('induced by k'[m]*' and k'[dm])),
     col='#11586b', cex=1.3)
text(.65,790, 'Reference',col=1, cex=1.3)
text(.65,770,'simulation',col=1, cex=1.3)
par(new=T)
boxplot(sed_best, ylim=c(500,1220),
        xlim=c(0.5,1.5), lwd=2, col='#E69F0099')
dev.off()

getwd()
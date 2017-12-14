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




setwd('C:/Users/gi/Desktop/nuoveMEt')
tiff('sed_var_VER2.png', height=25, width=35, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,2),cex.axis=1.6, cex.lab=1.3, 
    cex.main=1.4, mar=c(1,5.5,1,4.5),oma=c(0,0,0,0), bty='n')
boxplot(arg, ylim=c(1,5),type='l', horizontal = T,
        xlim=c(0.5,1.5), lwd=2, col='#000000')
polygon(bii2, yyy,col='#E69F0066', border='#E69F00')
polygon(boo2,yyy, col='#25b3db66', border='#25b3db')
#polygon(yyy,arg,xlim=c(0.5,1.5), lwd=2, col='#E69F00')
#par(new=T)
#boxplot(arg, ylim=c(1,5),type='l',horizontal = T,
 #       xlim=c(0.5,1.5), lwd=2, col='#E69F00')
text(5,1.2, 
     expression(paste('Confidence interval')),
     col='#cd8d00', cex=1.3) 
text(5,1.1, 
     expression(paste('for modeled Hg'[D]*' in water')), 
     col='#cd8d00', cex=1.3) 
text(3.55,1, 
     expression(paste('Variation of modeled Hg'[D])),
     col='#11586b', cex=1.3)
text(3.4,1, 
     expression(paste('induced by k'[m]*' and k'[dm])),
     col='#11586b', cex=1.3)
mtext(expression(paste('pM')),side=2, cex=1.5, line=3)

text(.65,2.5, 'Reference',col=1, cex=1.3)
text(.65,2.35,'simulation',col=1, cex=1.3)

boxplot(sed_best, ylim=c(600,1200),horizontal = T,
        xlim=c(0.5,1.5), lwd=2, col='#000000')

polygon(bii,yyy, col='#E69F0066', border='#E69F00')
polygon(boo,yyy, col='#25b3db66', border='#25b3db')
mtext(expression(paste('pmol g'^-1)),side=2, cex=1.5,
      line=3)
text(1000,1, 
     expression(paste('Confidence interval')),
     col='#cd8d00', cex=1.3) 
text(980, 1,
     expression(paste('for modeled Hg'[T]*' in sediment')), 
     col='#cd8d00', cex=1.3) 
text(860, 1,
     expression(paste('Variation of modeled Hg'[T])),
     col='#11586b', cex=1.3)
text(840,1, 
     expression(paste('induced by k'[m]*' and k'[dm])),
     col='#11586b', cex=1.3)
text(790, .65,'Reference',col=1, cex=1.3)
text(770, .65,'simulation',col=1, cex=1.3)
#par(new=T)
#boxplot(sed_best, ylim=c(600,1200),horizontal = T,
 #       xlim=c(0.5,1.5), lwd=2, col='#E69F00')
dev.off()
getwd()
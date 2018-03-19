setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In1")
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]

oxic_conc1<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_conc1_pM<-rowMeans(oxic_conc1)/200.59*1000
suboxic_conc1<-data.frame(hgT$Suboxic1)
suboxic_conc1_pM<-rowMeans(suboxic_conc1)/200.59*1000

anoxic_conc1<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_conc1_pM<-rowMeans(anoxic_conc1)/200.59*1000

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b")
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_conc1b<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_conc1b_pM<-rowMeans(oxic_conc1b)/200.59*1000
suboxic_conc1b<-data.frame(hgT$Suboxic1)
suboxic_conc1b_pM<-rowMeans(suboxic_conc1b)/200.59*1000

anoxic_conc1b<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_conc1b_pM<-rowMeans(anoxic_conc1b)/200.59*1000

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b")
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_conc2b<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_conc2b_pM<-rowMeans(oxic_conc2b)/200.59*1000
suboxic_conc2b<-data.frame(hgT$Suboxic1)
suboxic_conc2b_pM<-rowMeans(suboxic_conc2b)/200.59*1000

anoxic_conc2b<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_conc2b_pM<-rowMeans(anoxic_conc2b)/200.59*1000

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c")
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_conc1c<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_conc1c_pM<-rowMeans(oxic_conc1c)/200.59*1000
suboxic_conc1c<-data.frame(hgT$Suboxic1)
suboxic_conc1c_pM<-rowMeans(suboxic_conc1c)/200.59*1000

anoxic_conc1c<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_conc1c_pM<-rowMeans(anoxic_conc1c)/200.59*1000

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c")
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_conc2c<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_conc2c_pM<-rowMeans(oxic_conc2c)/200.59*1000
suboxic_conc2c<-data.frame(hgT$Suboxic1)
suboxic_conc2c_pM<-rowMeans(suboxic_conc2c)/200.59*1000

anoxic_conc2c<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_conc2c_pM<-rowMeans(anoxic_conc2c)/200.59*1000

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c")
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_conc3c<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_conc3c_pM<-rowMeans(oxic_conc3c)/200.59*1000
suboxic_conc3c<-data.frame(hgT$Suboxic1)
suboxic_conc3c_pM<-rowMeans(suboxic_conc3c)/200.59*1000

anoxic_conc3c<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_conc3c_pM<-rowMeans(anoxic_conc3c)/200.59*1000

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c")
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_conc4c<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_conc4c_pM<-rowMeans(oxic_conc4c)/200.59*1000

suboxic_conc4c<-data.frame(hgT$Suboxic1)
suboxic_conc4c_pM<-rowMeans(suboxic_conc4c)/200.59*1000

anoxic_conc4c<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_conc4c_pM<-rowMeans(anoxic_conc4c)/200.59*1000

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/Centrale_NOme")
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_concb<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_concb_pM<-rowMeans(oxic_concb)/200.59*1000

suboxic_concb<-data.frame(hgT$Suboxic1)
suboxic_concb_pM<-rowMeans(suboxic_concb)/200.59*1000

anoxic_concb<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_concb_pM<-rowMeans(anoxic_concb)/200.59*1000

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_concf6<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_concf6_pM<-rowMeans(oxic_concf6)/200.59*1000
suboxic_concf6<-data.frame(hgT$Suboxic1)
suboxic_concf6_pM<-rowMeans(suboxic_concf6)/200.59*1000

anoxic_concf6<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_concf6_pM<-rowMeans(anoxic_concf6)/200.59*1000

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_concf2<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_concf2_pM<-rowMeans(oxic_concf2)/200.59*1000

suboxic_concf2<-data.frame(hgT$Suboxic1)
suboxic_concf2_pM<-rowMeans(suboxic_concf2)/200.59*1000

anoxic_concf2<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_concf2_pM<-rowMeans(anoxic_concf2)/200.59*1000

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim1')#Fminmin
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_concn1<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_concn1_pM<-rowMeans(oxic_concn1)/200.59*1000

suboxic_concn1<-data.frame(hgT$Suboxic1)
suboxic_concn1_pM<-rowMeans(suboxic_concn1)/200.59*1000
anoxic_concn1<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_concn1_pM<-rowMeans(anoxic_concn1)/200.59*1000


setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_concn2<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_concn2_pM<-rowMeans(oxic_concn2)/200.59*1000

suboxic_concn2<-data.frame(hgT$Suboxic1)
suboxic_concn2_pM<-rowMeans(suboxic_concn2)/200.59*1000

anoxic_concn2<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_concn2_pM<-rowMeans(anoxic_concn2)/200.59*1000

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin
hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]
oxic_concn3<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_concn3_pM<-rowMeans(oxic_concn3)/200.59*1000

suboxic_concn3<-data.frame(hgT$Suboxic1)
suboxic_concn3_pM<-rowMeans(suboxic_concn3)/200.59*1000

anoxic_concn3<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_concn3_pM<-rowMeans(anoxic_concn3)/200.59*1000

oxic_pool<-data.frame(oxic_conc1_pM, oxic_conc1b_pM, oxic_conc2b_pM,  
                      oxic_conc1c_pM, oxic_conc2c_pM,oxic_conc3c_pM,
                      oxic_conc4c_pM,oxic_concb_pM,oxic_concn3_pM,
                      oxic_concf2_pM,oxic_concn1_pM,oxic_concn2_pM,oxic_concf6_pM)  


subox_pool<-data.frame(suboxic_conc1_pM, suboxic_conc1b_pM, suboxic_conc2b_pM,  
                       suboxic_conc1c_pM, suboxic_conc2c_pM,suboxic_conc3c_pM,
                       suboxic_conc4c_pM,suboxic_concb_pM,suboxic_concn3_pM,
                       suboxic_concf2_pM,suboxic_concn1_pM,
                       suboxic_concn2_pM,suboxic_concf6_pM)  

anox_pool<-data.frame(anoxic_conc1_pM, anoxic_conc1b_pM, anoxic_conc2b_pM,  
                      anoxic_conc1c_pM, anoxic_conc2c_pM,anoxic_conc3c_pM,
                      anoxic_conc4c_pM,anoxic_concb_pM,anoxic_concn3_pM,
                      anoxic_concf2_pM,anoxic_concn1_pM,anoxic_concn2_pM,
                      anoxic_concf6_pM)  

anox_pool
sd1<-apply(oxic_pool, 1, FUN=sd)
sd2<-apply(subox_pool, 1, FUN=sd)
sd3<-apply(anox_pool, 1, FUN=sd)

SE_hg_ol<-sd1/sqrt(13)
o1<- rowMeans(oxic_pool)-sd1
o2<- rowMeans(oxic_pool)+sd1
SE_hg_sol<-sd2/sqrt(13)
s1<- rowMeans(subox_pool)-sd2
s2<- rowMeans(subox_pool)+sd2
SE_hg_aol<-sd3/sqrt(13)
a1<- rowMeans(anox_pool)-sd3
a2<- rowMeans(anox_pool)+sd3

min1<-apply(oxic_pool, 1, FUN=min)
max1<-apply(oxic_pool, 1, FUN=max)

min2<-apply(subox_pool, 1, FUN=min)
max2<-apply(subox_pool, 1, FUN=max)

min3<-apply(anox_pool, 1, FUN=min)
max3<-apply(anox_pool, 1, FUN=max)


p1<-as.numeric(c(o1,rev(o2)))
p1b<-as.numeric(c(min1,rev(max1)))

p2<-c(s1,rev(s2))
p2b<-as.numeric(c(min2,rev(max2)))
p3<-c(a1,rev(a2))
p3b<-as.numeric(c(min3,rev(max3)))

ax2<-seq(1:2412)
yy<-c(ax2,rev(ax2))


setwd('C:/Users/gi/Desktop/nuoveMEt3/')

tiff('Fig.9c_HgConc_sd.tiff', height=14.5, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(4.5,5,4,1), bty='n')

plot(rowMeans(oxic_pool), col="#0098cc", type="l",  ylim=c(0,5.0), 
     main=expression(paste('Hg'[T]*' fluxes to the Black Sea')),
     ylab= " ", xaxt='n',
     xlab= " ",  lwd=1, cex.axis=2, cex.lab=2,cex.main=2.3)
polygon(yy,p1,col='#0098cc44',border = '#0098cc44')
par(new=T)
plot(rowMeans(subox_pool), col="#65cc00", type="l",  ylim=c(0,5.0), 
     main=expression(paste('Hg'[T]*' fluxes to the Black Sea')),
     ylab= " ", xaxt='n',
     xlab= " ",  lwd=1, cex.axis=2, cex.lab=2,cex.main=2.3)
polygon(yy,p2,col='#65cc0044',border = '#65cc0044')
par(new=T)
plot(rowMeans(anox_pool), col="800026", type="l",  ylim=c(0,5.0), 
     main=expression(paste('Hg'[T]*' fluxes to the Black Sea')),
     ylab= " ", xaxt='n',
     xlab= " ",  lwd=1, cex.axis=2, cex.lab=2,cex.main=2.3)
polygon(yy,p3,col='#80002644',border = '#80002644')

dev.off()


tiff('Fig.9c_HgConc_min_max.tiff', height=14.5, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(4.5,5,4,1), bty='n')

plot(rowMeans(oxic_pool), col="#0098cc", type="l",  ylim=c(0,5.0), 
     main=expression(paste('Hg'[T]*' fluxes to the Black Sea')),
     ylab= " ", xaxt='n',
     xlab= " ",  lwd=1, cex.axis=2, cex.lab=2,cex.main=2.3)
polygon(yy,p1b,col='#0098cc44',border = '#0098cc44')
par(new=T)
plot(rowMeans(subox_pool), col="#65cc00", type="l",  ylim=c(0,5.0), 
     main=expression(paste('Hg'[T]*' fluxes to the Black Sea')),
     ylab= " ", xaxt='n',
     xlab= " ",  lwd=1, cex.axis=2, cex.lab=2,cex.main=2.3)
polygon(yy,p2b,col='#65cc0044',border = '#65cc0044')
par(new=T)
plot(rowMeans(anox_pool), col="#800026", type="l",  ylim=c(0,5.0), 
     main=expression(paste('Hg'[T]*' fluxes to the Black Sea')),
     ylab= " ", xaxt='n',
     xlab= " ",  lwd=1, cex.axis=2, cex.lab=2,cex.main=2.3)
polygon(yy,p3b,col='#80002644',border = '#80002644')

dev.off()
getwd()




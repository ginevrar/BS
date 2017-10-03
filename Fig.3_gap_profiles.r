
#medie<-read.table("C:/Users/gi/Dropbox/BlackSea2/buoni_script/medie_layer_Mn2.txt", 
#                header=TRUE)
medie<-read.table("C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/implementazione/nuovi_script/medie_dati_new_12layers.txt", sep="\t", 
                  header=TRUE)

setwd('C:/Users/gi/Documents/Lavoro/SIM_finale2')
medie<-read.table("medie_dati_new_12layers.txt", sep="\t", 
                  header=TRUE)
# if you are passing an explicit xlim or ylim.
#  remember to subtract the width(s) of the gap(s) 

dev.new()
plot(medie$Hg,medie$Density,ylim=c(17.3,15),
         xlim=c(0,0.9), pch=21,ylab=" ",xlab=" ",cex=2.2,cex.axis=1.6, 
         bgcol = 'white', bg="#3690c0",col='#25648688',
         type="b",lty=1, gap=c(11.5,15.5), gap.axis="y",add=TRUE, xticlab=NA)
plot(medie$MeHg,medie$Density,ylim=c(15,17.3),
         bgcol = 'white', col="#e7298a", bg="#df65b088",
         xlim=c(0,0.9), pch=22, ylab='',
         xlab=" ",cex=2.2, cex.axis=1.6, type="b",lty=1, cex.lab=1.6,
         gap=c(11.5,15.5), gap.axis="y", add=TRUE, xticlab=NA)


library(plotrix)
head(medie)
asse<-c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9)
#dev.new(heigt=11,weight=5.5)


tiff('fS2_300dpi_ex3.tiff', height = 25, width = 23, units = 'cm', 
     compression = "lzw", res = 300)
par(mar=c(4.5,4.5,1,2))
gap.plot(medie$HS,medie$Density,ylim=c(13.25,15), xlim=c(0,0.9), pch=4,
         ylab=" ",xlab=" ", type="b",lty=5,col="#e31a1c00", gap=c(11.5,15.5), 
         gap.axis="y", xtics=NULL, xticlab=NA, cex.axis=1.6, cex=2, las=3)
gap.plot(medie$HS,medie$Density,ylim=c(13.25,15),xlim=c(0,0.9), pch=25,
         ylab=" ",xlab=" ",xticlab=NA, type="b",bgcol = 'white', 
         bg = '#fb6a4a88',cex=2,cex.axis=1.6, 
         lty=5,col="#fb6a4a", gap=c(11.5,15.5), gap.axis="y")
gap.plot(medie$Oxy,medie$Density,ylim=c(13.25,15),cex=2,
         xlim=c(0,0.9), pch=8,ylab=" ",xlab=" ",
         type="b",lty=4, col="#66c2a5", gap=c(11.5,15.5), gap.axis="y",add=TRUE, xticlab=NA)
gap.plot(medie$Fe,medie$Density,ylim=c(13.25,15),cex=2,cex.axis=1.6, 
         bgcol = 'white', bg = '#f49b4288',
         xlim=c(0,0.9), pch=23, ylab=" ",xlab=" ",
         type="b",lty=3,col="#ff7f00", gap=c(11.5,15.5), gap.axis="y", add=TRUE, xticlab=NA)
gap.plot(medie$Mn,medie$Density,ylim=c(13.25,15),xlim=c(0,0.9), cex=2, cex.axis=1.6, 
         pch=24,ylab=" ",xlab=" ",col="#e1e22f",  
         bgcol = 'white', bg = '#e1e22f88',
         type="b",lty=5, gap=c(11.5,15.5), gap.axis="y",add=TRUE, xticlab=NA)

gap.plot(medie$Hg,medie$Density,ylim=c(13.25,15),
         xlim=c(0,0.9), pch=21,ylab=" ",xlab=" ",cex=2.2,cex.axis=1.6, 
         bgcol = 'white', bg="#3690c0",col='#25648688',
         type="b",lty=1, gap=c(11.5,15.5), gap.axis="y",add=TRUE, xticlab=NA)
gap.plot(medie$MeHg,medie$Density,ylim=c(13.25,15),
         bgcol = 'white', col="#e7298a", bg="#df65b088",
         xlim=c(0,0.9), pch=22, ylab='',
         xlab=" ",cex=2.2, cex.axis=1.6, type="b",lty=1, cex.lab=1.6,
         gap=c(11.5,15.5), gap.axis="y", add=TRUE, xticlab=NA)
abline(h=16.2-4,  lty=2, col='grey60')

text(0.35,11.2,"OL", adj=0, font=2,     cex=1.6)  
text(0.35,16-4,"SOL", adj=0, font=2,    cex=1.6)  
text(0.55,16.5-4,"AOL", adj=0, font=2, cex=1.6) 

axis(1, at=asse,labels=asse, cex.axis=1.6)
axis.break(2,11.5,style="slash",brw=0.03)  
# hiding vertical lines
legend(0.5,11, pch=c(21,22,24,23,25,8), cex=1.8,
       legend=c((expression('Hg'[D]*'          pM 10'^-1)), 
                (expression('MeHg'[D]*'     pM')),
                (expression('Mn'[D]*'          µM 10'^-1)),
                (expression('Fe'[D]*'          µM')),
                (expression('HS'^-'           m
                            M')),
                (expression('O'[2]*'          mM'))),
       col=c("#256486","#e7298a", "#e1e22f","#ff7f00","#fb6a4a88","#66c2a5"), 
       pt.bg=c('#3690c088','#df65b088','#e1e22f88','#ff7f0088','#fb6a4a'))
mtext(expression(paste(sigma[theta]*'  (kg m'^-3*')')), 2, 
      line=2.5,at=12,col="black", cex=1.6)
mtext('Concentrations', 1, line=2.5,
      at=.42,col="black", cex=1.6)



dev.off()


rect(-1.5, 10.9, 1, 15.64-4, density = NULL, angle= 45, col = '#abd9e922', border = '#abd9e9', lty = NULL, lwd = par("lwd"),
     xpd = NULL)

rect(-1.5, 16.2-4, 1,17.04-4, density = NULL, angle = 45, 
     col = '#eadede22', border = '#eadede', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 15.64-4, 1,16.2-4, density = NULL, angle = 45, 
     col = '#1d932722', border = '#35978f', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 17.04-4, 1,17.23-4, density = NULL, angle = 45, 
     col = '#a39b9b22', border = '#a39b9b', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 17.23-4, 1,17.35-4, density = NULL, angle = 45, 
     col = '#25232322', border = '#252323', lty = NULL, lwd = par("lwd"),
     xpd = NULL)

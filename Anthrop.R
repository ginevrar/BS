
nat_L<-data.frame(118.8244 ,0.9051876,2.745534)
names(nat_L)<-c('AOL','SOL','OL')

nat_U<-data.frame(260.0078,2.014686,6.392945)
names(nat_U)<-c('AOL','SOL','OL')

HgT<-data.frame(1723,14,48)
names(HgT)<-c('AOL','SOL','OL')

MehgT<-data.frame( 371,2,2)
names(MehgT)<-c('AOL','SOL','OL')

Antro_L<-HgT-nat_L
Antro_L_per<-Antro_L/HgT*100
Antro_U<-data.frame(HgT-nat_U)
names(Antro_U)<-c('AOL','SOL','OL')

Antro_U_per<-Antro_U/HgT*100


neg<-rbind(nat_L, nat_U)
neg2<-colMeans(neg)
x1<-neg2
neg_sd<-apply(neg, 2, sd)
sd1<-neg_sd

pos<-rbind(Antro_L, Antro_U)
pos2<-colMeans(pos)
x2<-pos2
pos_sd<-apply(pos, 2, sd)
sd2<-pos_sd



tiff('OL_SOL_antro.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=600)
par(mar=c(0.5, 6, 5, 1), mfrow=c(1,1))  #bottom-left-top-right
plot.new()
plot.window(xlim=c(-10, 50), ylim=c(-1, 1.2))
ticks <- seq(-10, 50, 10)
y <- c(.3,1) # posizione barre
h <- 0.1
### aggiungere produzione interna e degradazione  m
lines(rep(0, 2), c(0, 2), col="grey")
segments(-10, y, 50, y, lty="dotted", col="grey")  #linee orizzontali 

rect(-neg2[2:3], y-h, 0, y+h, col='#3690c0')
segments(-x1[2:3]-sd1[2:3],y,-x1[2:3]+sd1[2:3],y, col='black', lwd=1)
text(-8,1.1, "OL", cex=1.8)
text(-7,.4, "SOL", cex=1.8)

rect(0, y-h, pos2[2:3], y+h, col='#256486')
axis(1, at=ticks, labels=(ticks), pos=0, cex.axis=2)
segments(x2[2:3]-sd2[2:3],y,x2[2:3]+sd2[2:3],y, col='black', lwd=1)


#.text(9,1.9, expression("Hg"[D]*~"Diffusion"), cex=1.5)

mtext("Natural \n [15% - 7%]",3,  at=-10, cex=2.1,font=1, col='#3690c0', outer=F)
mtext("Anthropogenic \n [85% - 93%]",3,  at=20, cex=2.1,font=1, col='#256486', outer=F)

dev.off()


tiff('AOL_antro.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=600)
plot.new()
plot.window(xlim=c(-300, 1800), ylim=c(-1, 1))
ticks <- seq(-300, 1800, 400)
y <- c(.5,1.5,2.5,3.5) # posizione barre
y2 <- c(.8,1.8,2.8,3.8) # posizione barre
h <- 0.1
### aggiungere produzione interna e degradazione  m
lines(rep(0, 2), c(0, 2), col="grey")
segments(-300, y, 1800, y, lty="dotted", col="grey")  #linee orizzontali 

rect(-neg2[1], y-h, 0, y+h, col='#3690c0')
text(-300,.6, "AOL", cex=1.8)

segments(-x1[1]-sd1[1],y,-x1[1]+sd1[1],y, col='black', lwd=1)
segments(x2[1]-sd2[1],y,x2[1]+sd2[1],y, col='black', lwd=1)

rect(0, y-h, pos2[1], y+h, col='#256486')
axis(1, at=ticks, labels=(ticks), pos=0, cex.axis=2)


dev.off()















##
#      output nuove simulazioni (10 genn 2017)
#    sa2 is the new sa1!
##   meglio con met in UAL1 e UAL2
#
#      !!! controllare output wh1b in dissmehg_out.txt
#       !!!!
#
setwd("C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/implementazione/new_sim0/_met")
#
#
#----- model out
mheg_out<-read.table('dissmehg_out.txt', header=T); str(mheg_out)
o1<-mheg_out$O1
s1<-mheg_out$S1
sa1<-mheg_out$SA1
a1<-mheg_out$A1
#wh1<-mheg_out$Wh1
sed1<-mheg_out$Sed1
nomet<-mheg_out$Nomet
wh1<-mheg_out$Wh1

#----- DATI 9 LAYER
medie_mehg_pM<-c   (0.116285714,
		                0.1408125,
				          	0.120611111,
				          	0.108857143,
				          	0.157888889,
				          	0.767916667,
				          	0.551913043,
			          		0.751090909,
			          		0.737428571)	

sd(medie_mehg_pM)				
mheg_out<-data.frame(mheg_out,medie_mehg_pM, sa2)
 
# SAVE as SVG and modify with inkscape
library('plotrix')
#svg(filename="meHg_m1_m6-m7.svg", pointsize = 18)
#win.graph()
par(oma=c(1,1,1,1))
taylor.diagram(medie_mehg_pM, nomet,add=FALSE,col="black",bg='gray',pos.cor=T,
               xlab="",ylab="",main=" ",show.gamma=TRUE,ngamma=3,
               gamma.col="gray50",sd.arcs=0,ref.sd=T, mar=c(1.5,3,3,1.3),
               sd.method="sample",pcex=4.2, pch=21,
               grad.corr.lines=c(0.2,0.4,0.6,0.8,0.9, .95,0.99),
               cex.axis=1,normalize=FALSE)
text(0.035,0.04, labels = "m7", font=4, cex=1)

taylor.diagram(medie_mehg_pM,o1,add=T,col='#80b1d3', pos.cor=T,
               xlab="",ylab="",main="T ",show.gamma=TRUE,ngamma=3,
               gamma.col="gray50",sd.arcs=0,ref.sd=T,
               sd.method="sample",pcex=4.2, pch=22,
               grad.corr.lines=c(0.2,0.4,0.6,0.8,0.9, 0.99),cex.axis=1,normalize=FALSE)
text(0.08,0.01, labels = "m1", col="#80b1d3", font=4, cex=1)

taylor.diagram(medie_mehg_pM,s1,add=T,col='#b3de69',pos.cor=T,
               xlab="", ylab="",main="T ", show.gamma=TRUE,ngamma=3,
               gamma.col="gray50", sd.arcs=0, ref.sd=T,
               sd.method="sample", pcex=4.2, pch=23,
               grad.corr.lines=c(0.2,0.4,0.6,0.8,0.9, 0.99), cex.axis=1, normalize=FALSE)
text(0.09,0.03, labels = "m2", col='#b3de69', font=4,cex=1)


taylor.diagram(medie_mehg_pM,sa1,add=T,col='#ffed6f',pos.cor=T,
            xlab="", ylab="",main="T ", show.gamma=TRUE,ngamma=3,
            gamma.col="gray50", sd.arcs=0, ref.sd=T,
             sd.method="sample", pcex=3.9, pch=24,
          grad.corr.lines=c(0.2,0.4,0.6,0.8,0.9, 0.99), cex.axis=1, normalize=FALSE)
text(0.18,0.06, labels = "m3", col='#ffd757', font=4, cex=1)

taylor.diagram(medie_mehg_pM,a1,add=T,col='#f6b740',pos.cor=T,
               xlab="",ylab="",main="T ",show.gamma=TRUE,ngamma=3,
               gamma.col="gray50",sd.arcs=0,ref.sd=T,
               sd.method="sample",pcex=3.9,pch=25,
               grad.corr.lines=c(0.2,0.4,0.6,0.8,0.9, 0.99),cex.axis=1,normalize=FALSE)
text(0.18,0.1, labels = "m4", col='#fdb462', font=4,cex=1)

taylor.diagram(medie_mehg_pM,wh1,add=T,col='#FA5340',pos.cor=T,
               xlab="",ylab="",main="T ",show.gamma=TRUE,ngamma=3,
               gamma.col="gray50",sd.arcs=0,ref.sd=T,
               sd.method="sample",pcex=4.2,pch=21,
               grad.corr.lines=c(0.2,0.4,0.6,0.8,0.9, 0.99),cex.axis=1,normalize=FALSE)
text(0.28,0.06, labels = "m5", col='#FA5340', font=4, cex=1)

taylor.diagram(medie_mehg_pM,sed1,add=T,col='#85518c',pos.cor=T,
               xlab="",ylab="",main="T ",show.gamma=TRUE,ngamma=3,
               gamma.col="gray50",sd.arcs=0,ref.sd=T,
               sd.method="sample",pcex=4.2,pch=3,
               grad.corr.lines=c(0.2,0.4,0.6,0.8,0.9, 0.99),cex.axis=1,normalize=FALSE)
text(0.035,0.05,labels = "m6", col='#85518c', font=4, cex=1)

#dev.off()

# --------- No met out
x <- medie_mehg_pM
y <- nomet
E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
xprime <- x- mean(x, na.rm = TRUE)
yprime <- y - mean(y, na.rm = TRUE)
sumofsquares <- (xprime - yprime)^2
Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
#No met out
E2 <- E^2 + Eprime^2; E2
R <- cor(x, y); R
sd(y); sd(x)
#------O1  out
x <- medie_mehg_pM
y <- o1
E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
xprime <- x- mean(x, na.rm = TRUE)
yprime <- y - mean(y, na.rm = TRUE)
sumofsquares <- (xprime - yprime)^2
Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
#----O1  out
E2 <- E^2 + Eprime^2; E2
R <- cor(x, y); R
sd(y); sd(x)

#------S1  out
x <- medie_mehg_pM
y <- s1
E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
xprime <- x- mean(x, na.rm = TRUE)
yprime <- y - mean(y, na.rm = TRUE)
sumofsquares <- (xprime - yprime)^2
Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
#----S1  out
E2 <- E^2 + Eprime^2; E2
R <- cor(x, y); R
sd(y); sd(x)

#------SA 1  out
x <- medie_mehg_pM
y <- sa1
E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
xprime <- x- mean(x, na.rm = TRUE)
yprime <- y - mean(y, na.rm = TRUE)
sumofsquares <- (xprime - yprime)^2
Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
#----SA 1  out
E2 <- E^2 + Eprime^2; E2
R <- cor(x, y); R
sd(y); sd(x)

#------SA 2  out
x <- medie_mehg_pM
y <- sa2
E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
xprime <- x- mean(x, na.rm = TRUE)
yprime <- y - mean(y, na.rm = TRUE)
sumofsquares <- (xprime - yprime)^2
Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
#----SA 2  out
E2 <- E^2 + Eprime^2; E2
R <- cor(x, y); R
sd(y); sd(x)

#------A1  out
x <- medie_mehg_pM
y <- a1
E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
xprime <- x- mean(x, na.rm = TRUE)
yprime <- y - mean(y, na.rm = TRUE)
sumofsquares <- (xprime - yprime)^2
Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
#----A1  out
E2 <- E^2 + Eprime^2; E2
R <- cor(x, y); R
sd(y); sd(x)
(sd(y)-sd(x))/sd(x)

#------Wh1  out
x <- medie_mehg_pM
y <- wh1
E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
xprime <- x- mean(x, na.rm = TRUE)
yprime <- y - mean(y, na.rm = TRUE)
sumofsquares <- (xprime - yprime)^2
Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
#----Wh1  out
E2 <- E^2 + Eprime^2; E2
R <- cor(x, y); R
sd(y); sd(x)
(sd(y)-sd(x))/sd(x)

#------Sed1  out
x <- medie_mehg_pM
y <- sed1
E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
xprime <- x- mean(x, na.rm = TRUE)
yprime <- y - mean(y, na.rm = TRUE)
sumofsquares <- (xprime - yprime)^2
Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
#----Sed1 out
E2 <- E^2 + Eprime^2; E2
R <- cor(x, y); R
sd(y)
(sd(y)-sd(x))/sd(x)

#------Wh1  out
x <- medie_mehg_pM
y <- wh1
E <- mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)
xprime <- x- mean(x, na.rm = TRUE)
yprime <- y - mean(y, na.rm = TRUE)
sumofsquares <- (xprime - yprime)^2
Eprime <- sqrt(sum(sumofsquares)/length(complete.cases(x)))
#----Wh1  out
E2 <- E^2 + Eprime^2; E2
R <- cor(x, y); R
sd(y); sd(x)
(sd(y)-sd(x))/sd(x)

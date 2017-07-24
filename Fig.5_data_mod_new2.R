#setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0/_met/S1")
setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")

medie_hg_pM<-c(1.86,
               2.127058824,
               1.7675,
               1.902,
               2.056666667,
               3.0875,
               2.810909091,
               3.714,
               3.713684211)

medie_mehg_pM<-c(0.116285714,
                 0.1408125,
                 0.120611111,
                 0.108857143,
                 0.157888889,
                 0.767916667,
                 0.551913043,
                 0.751090909,
                 0.737428571)

sd1<-c(0.4911890,
       0.6179782,
       0.5060026, 
       0.5832838,
       0.6269617, 
       0.7147727,
       0.5266774,
       0.3722066, 
       0.4352804)

sd2<-c(0.036545471,
       0.034533498,
       0.034428338,
       0.035267684,
       0.083861152,
       0.170347104,
       0.149375644,
       0.130289388,
       0.095633974)

prof<-c(11.4525,
        13.3275,
        14.715,
        15.41,
        15.92,
        16.41,
        16.83,
        17.14,
        17.25)

#Leggi model output
hg<-read.csv("Dissolved_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
str(hg)
hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

dhg0<-read.csv("Dissolved_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(dhg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg0<-read.csv("DOC_Sorbed_Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

# dati utimo anno

fine_hgT<-hgT[1957:1968,]
fine_hg<- hg [1957:1968,]
fine_Phg<- Phg [1957:1968,]
fine_DOChg<- DOChg [1957:1968,]
fine_DOCmehg<- DOCmehg [1957:1968,]
fine_mehg<- mehg [1957:1968,]
fine_hg0<- hg0 [1957:1968,]
fine_mehgT<- mehgT [1957:1968,]
fine_solids<- solids [1957:1968,]

hgII_pM<-(hg+DOChg0+DOChg)/200.59*1000
tail(hgII_pM,3)
mehg_pM_<-(mehg+DOCmehg)/215*1000
tail(mehg_pM_,3)
mehgT_pM<-mehgT/215*1000
tail(mehg_pM_,3)/tail(mehgT_pM,3)*100


B_Phg<- fine_hgT - (fine_DOChg+fine_hg+fine_mehgT+fine_hg0)
B_Phg$Oxic1
fine_Phg$Oxic1

#medie layer
layer_hg <-c(layer1<-mean(fine_hg$Oxic1),
             layer2<-mean(fine_hg$Oxic2),
             layer3<-mean(fine_hg$CIL),
             layer4<-mean(fine_hg$Oxycline),
             layer5<-mean(fine_hg$Suboxic1),
             layer6<-mean(fine_hg$Suboxic2),
             layer7<-mean(fine_hg$Anoxic),
             layer8<-mean(fine_hg$Anoxic2),
             layer9<-mean(fine_hg$Anoxic3))

layer_hgT <-c(layer1<-mean(fine_hgT$Oxic1),
              layer2<-mean(fine_hgT$Oxic2),
              layer3<-mean(fine_hgT$CIL),
              layer4<-mean(fine_hgT$Oxycline), 
              layer5<-mean(fine_hgT$Suboxic1),
              layer6<-mean(fine_hgT$Suboxic2),
              layer7<-mean(fine_hgT$Anoxic),
              layer8<-mean(fine_hgT$Anoxic2),
              layer9<-mean(fine_hgT$Anoxic3))

layer_mehg <-c(layer1<-mean(fine_mehg$Oxic1),
               layer2<-mean(fine_mehg$Oxic2),
               layer3<-mean(fine_mehg$CIL),
               layer4<-mean(fine_mehg$Oxycline),
               layer5<-mean(fine_mehg$Suboxic1),
               layer6<-mean(fine_mehg$Suboxic2),
               layer7<-mean(fine_mehg$Anoxic),
               layer8<-mean(fine_mehg$Anoxic2),
               layer9<-mean(fine_mehg$Anoxic3))

layer_mehgT <-c(layer1<-mean(fine_mehgT$Oxic1),
                layer2<-mean(fine_mehgT$Oxic2), 
                layer3<-mean(fine_mehgT$CIL),
                layer4<-mean(fine_mehgT$Oxycline),
                layer5<-mean(fine_mehgT$Suboxic1),
                layer6<-mean(fine_mehgT$Suboxic2),
                layer7<-mean(fine_mehgT$Anoxic),
                layer8<-mean(fine_mehgT$Anoxic2),
                layer9<-mean(fine_mehgT$Anoxic3))

layer_mehgT22 <-data.frame(layer1<- fine_mehgT$Oxic1[1],
                           layer2<- fine_mehgT$Oxic2[1], 
                           layer3<- fine_mehgT$CIL[1],
                           layer4<- fine_mehgT$Oxycline[1],
                           layer5<- fine_mehgT$Suboxic1[1],
                           layer6<- fine_mehgT$Suboxic2[1],
                           layer7<- fine_mehgT$Anoxic,
                           layer8<- fine_mehgT$Anoxic2,
                           layer9<- fine_mehgT$Anoxic3)
layer_mehgT22<-t(layer_mehgT22)
names(layer_mehgT22)<-c('ol1','ol2','cil','oxy','sol','uaol1',
                        'uaol2','daol','bbl')
str(layer_mehgT22)

layer_Phg <-c(layer1<-mean(fine_Phg$Oxic1),
              layer2<-mean(fine_Phg$Oxic2),
              layer3<-mean(fine_Phg$CIL),
              layer4<-mean(fine_Phg$Oxycline),
              layer5<-mean(fine_Phg$Suboxic1),
              layer6<-mean(fine_Phg$Suboxic2),
              layer7<-mean(fine_Phg$Anoxic),
              layer8<-mean(fine_Phg$Anoxic2),
              layer9<-mean(fine_Phg$Anoxic3))

layer_DOChg <-c(layer1<-mean(fine_DOChg$Oxic1),
                layer2<-mean(fine_DOChg$Oxic2),
                layer3<-mean(fine_DOChg$CIL),
                layer4<-mean(fine_DOChg$Oxycline),
                layer5<-mean(fine_DOChg$Suboxic1),
                layer6<-mean(fine_DOChg$Suboxic2),
                layer7<-mean(fine_DOChg$Anoxic),
                layer8<-mean(fine_DOChg$Anoxic2),
                layer9<-mean(fine_DOChg$Anoxic3))


layer_DOCmehg <-c(layer1<-mean(fine_DOCmehg$Oxic1),
                  layer2<-mean(fine_DOCmehg$Oxic2),
                  layer3<-mean(fine_DOCmehg$CIL),
                  layer4<-mean(fine_DOCmehg$Oxycline),
                  layer5<-mean(fine_DOCmehg$Suboxic1),
                  layer6<-mean(fine_DOCmehg$Suboxic2),
                  layer7<-mean(fine_DOCmehg$Anoxic),
                  layer8<-mean(fine_DOCmehg$Anoxic2),
                  layer9<-mean(fine_DOCmehg$Anoxic3))

layer_hg0 <-c(layer1<-mean(fine_hg0$Oxic1),
              layer2<-mean(fine_hg0$Oxic2),
              layer3<-mean(fine_hg0$CIL),
              layer4<-mean(fine_hg0$Oxycline),
              layer5<-mean(fine_hg0$Suboxic1),
              layer6<-mean(fine_hg0$Suboxic2),
              layer7<-mean(fine_hg0$Anoxic),
              layer8<-mean(fine_hg0$Anoxic2),
              layer9<-mean(fine_hg0$Anoxic3))


concentrazioni<-cbind(layer_hg,layer_DOChg, layer_Phg, layer_hgT, 
                      layer_hg0, layer_mehg, layer_DOCmehg, layer_mehgT)
layer_hgT_pm<-layer_hgT/200.59*1000
disshg<-(layer_hg+layer_DOChg+layer_hg0)
dissmehg<-(layer_mehg+layer_DOCmehg)

disshgII_pM<-disshg/200.59*1000
dissMehg_pM<-dissmehg/215*1000

disshg_pM<-(disshgII_pM+dissMehg_pM)
disshg_pM/layer_hgT_pm*100

cor<-cor(disshg_pM,medie_hg_pM)
x1<-medie_hg_pM
y<-prof


x2<-medie_mehg_pM

mean(disshg_pM[1:4])


##-----SEDIMENT conc
hgT_fine<-hgT[1957:1968, 1:13]
b<-mean(hgT_fine$Sed1/200.59*1000);b
c<-mean(hgT_fine$Sed2/200.59*1000);c

mehgT_fine<-mehgT[1957:1968, 1:13]
d<-mean(mehgT_fine$Sed1/200.59*1000)
e<-mean(mehgT_fine$Sed2/200.59*1000)

sed_hg_pmol_g<-data.frame(b,c)
names(sed_hg_pmol_g)<-c('surface','subsurface')

sed_mehg_pmol_g<-data.frame(d,e)
names(sed_mehg_pmol_g)<-c('surface','subsurface')
sed_hg_pmol_g
sed_mehg_pmol_g

# ----end sed conc

setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/BlackSea_IIDraft/submission_figures")

#----- PLOT----------------
#svg('dato_model_hg_mehg.svg')
#tiff('dato_model_hg_mehg.tiff')

tiff('dato_model_hg_mehg33331.tiff', height=25, width=23, units='cm', 
   compression="lzw", res=300)
#dev.new(width=7, height=7)

par(mfrow=c(1,2),cex.axis=1.2, cex.lab=1.3, 
    cex.main=1.4, mar=c(4.5,5,1,0))
plot(medie_hg_pM, prof,  bty='n',lwd=2, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n',xaxt='n',
     xlim=c(0, 5), pch=21,
     ylab=" ", xlab=" ", type="b",     
     col="#3288bd00", bg='#41b6c400',main=" ")                   
rect(0, 10.5 , 5,15.64 , density = NULL, angle = 45, 
     col = '#abd9e933', border = '#abd9e9', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 14.25 , 5,15.285 , density = NULL, angle = 45, 
     col = '#ffffd933', border = '#e8e888', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 16.2 , 5, 17.04 , density = NULL, angle = 45, 
     col = '#eadede22', border = '#eadede', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 15.64 , 5,16.2 , density = NULL, angle = 45, 
     col = '#1d932722', border = '#1d9327', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 17.04 , 5,17.23 , density = NULL, angle = 45, 
     col = '#a39b9b22', border = '#a39b9b', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 17.23 , 5,17.3 , density = NULL, angle = 45, 
     col = '#25232322', border = '#252323', lty = NULL, lwd = par("lwd"),
     xpd = NULL) 
par(new=T)
plot(medie_hg_pM, prof,  bty='n',lwd=1, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n', xaxt='n',
     xlim=c(0, 5), pch=21,
     ylab=" ", xlab=" ", type="b", col="#5716a2", bg='#5716a244',main=" ")
par(new=TRUE) 
segments(x1-sd1,y,x1+sd1,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x1-sd1,y-epsilon,x1-sd1,y+epsilon, col='#5716a2')
segments(x1+sd1,y-epsilon,x1+sd1,y+epsilon, col='#5716a2')
par(new=TRUE)
plot(disshg_pM,prof, type="b",pch=23,  lwd=1,cex=4, yaxt='n',
     ylim=c(17.5,10.5),  bty='n', xlim=c(0, 5), lty=3,
     xlab=" ", col="#b3db25", bg='#b3db2577', cex.axis=1.8,
     ylab='')
yy<-c(11,12,13,14,15,16,17)
#axis(side=2, at = yy, col="black",  line=.50, cex.axis=1.8)
y2<-c(10.5,11.5,12.5,13.5,14.5,15.5,
      16.5,17, 17.5)
y1<-c(11,12,13,14,15,16,17)

axis(2, at=y1,line=0, col="black", cex.axis=1.6 , las=2)
axis(2, at=y2,line=0,labels=F, col="black" , tck =-.02, cex.axis=1.6)
#axis(2, at=y,line=0, col="black", cex.axis=1.6 )
mtext(expression('Hg'[D]*' (pM)'),side=1,line=3.5, cex=1.6)

mtext(expression(paste(sigma[theta]*' (kg m'^-3*')')), 2, line=3.2,at=13.5,
      col="black", cex=1.6)

p<-c(21,23)
#legend(4,11, pch=p,legend=c("Observations", 
 #                             'Model'),
  #     col=c("#5716a2", '#b3db25'), 
   #    pt.bg=c('#5716a255','#b3db2577'))
#text(3,15,"OM=7*10^5 \n silt=2.
text(4,12,'OL', cex=1.4, font=2)
text(4,14.7,'CIL', cex=1.4, font=2)
text(4,15.9,'SOL', cex=1.4, font=2)
text(1,16.6,'AOL', cex=1.4, font=2)


# --- PLOT Mehg----------------------mehg
#mar=c(4.5,4,1,0)
#win.graph()  mar=c(4.5,4,1,0)  ylim=c(17.5,10.5),
#dev.new(width=12, height=4)
par(mar=c(4.5,.5,1,5), cex.axis=1.2, cex.lab=1.3, cex.main=1.4 )

plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=4,
     ylim=c(17.5,10.5), lty=1, 
     xlim=c(0, 1.1), pch=22,yaxt='n',xaxt='n',
     ylab=" ", xlab=" ", type="b", col="#c51b7d00", main=" ")
rect(0, 10.5 , 1.1,15.64 , density = NULL, angle = 45, 
     col = '#abd9e933', border = '#abd9e9', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 14.25 , 1.1,15.285 , density = NULL, angle = 45, 
     col = '#ffffd933', border = '#e8e888', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 16.2 , 1.1,17.04 , density = NULL, angle = 45, 
     col = '#eadede22', border = '#eadede', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 15.64 , 1.1,16.2 , density = NULL, angle = 45, 
     col = '#1d932722', border = '#1d9327', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 17.04 , 1.1,17.23 , density = NULL, angle = 45, 
     col = '#a39b9b22', border = '#a39b9b', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(0, 17.23 , 1.1,17.3 , density = NULL, angle = 45, 
     col = '#25232322', border = '#252323', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
#plot(layer_Pmehg*20 ,prof, type="b",pch=23,  lwd=1.3,cex=1.3,
#    ylim=c(17.3,10.9),  bty='n', xlim=c(0,1),lty=3,
#   xlab="MeHg concentrations (pM)", col='#103513', bg='#10351322', ylab=expression(paste(sigma[theta]*'  (kg/m'^3*')')),
#  main=expression(paste("MeHg vertical profiles \n along the water column")))
par(new=T)
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=4,
     ylim=c(17.5,10.5), lty=1, yaxt='n',xaxt='n',
     xlim=c(0, 1.1), pch=21,
     ylab=" ", xlab=" ", type="b", col="#5716a2",bg='#5716a255', main=" ")
segments(x2-sd2,y,x2+sd2,y, col='#5716a2', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#5716a2')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#5716a2')
par(new=TRUE)
#plot(sa2,prof, type="b",pch='*',  lwd=1.3,cex=3,
#     ylim=c(17.3,10.9),  bty='n', xlim=c(0,1),lty=3,

#    xlab="MeHg concentrations (pM)", col="#92e128", bg='#92e12833', ylab=expression(paste(sigma[theta]*'  (kg/m'^3*')')),
#   main=expression(paste("MeHg vertical profiles \n along the water column")))
par(new=TRUE)
plot(dissMehg_pM, prof, type="b",pch=23,  lwd=1.3,cex=4,cex.axis=1.8,
     ylim=c(17.5,10.5),  bty='n', xlim=c(0,1.1), lty=2,
     xlab=" ", col="#b3db25", yaxt='n',xaxt='n',
     bg='#b3db2577', ylab='',   main='')
#mtext(expression(paste(sigma[theta]*'  (kg/m'^3*')')),
#      2, line=2.5 ,at=14,col="black", cex=1.2)

p<-c(21,23)
#legend(.4,11, pch=p,legend=c("Observations", 
 #                            'Model'),pt.cex=2,
  #     col=c("#5716a2", '#b3db25'), 
   #    pt.bg=c('#5716a255','#b3db2577'), cex=1.5)
text(.8,12,'OL', cex=1.4, font=2)
text(.8,14.7,'CIL', cex=1.4, font=2)
text(.8,15.9,'SOL', cex=1.4, font=2)
text(.1,16.6,'AOL', cex=1.4, font=2)

at=c(0,0.1,.3,.5,.7,.9,1.1)
atx=c(0.2,.4,.6,.8,1)
axis(1, at = at, labels = F ,tick=T, cex.axis=1.8)
axis(1, at = atx, labels = atx,tick=T, cex.axis=1.8)
mtext(expression('MeHg'[D]*' (pM)'),side=1,line=3.5, cex=1.6)

#aty<-c(,11.5, 12.5, 13.5, 14.5, 15.5, 16.5, 17.5)

y1<-c( 10.5, 12.05, 14.25, 15.285, 15.64, 16.2, 16.6, 17.04, 17.35)
why<-c(0,   20,      40,    55,    75,   100,  280,  460,   2000)
str(why)
str(y1)

#axis(4, at = aty, labels = F, cex.axis=1.8)
axis(4, at = y1, labels = why, tick = TRUE, cex.axis=1.5, las=2)
mtext('depth (m)', at=13.5, side=4,line=3.2, cex=1.6)
dev.off()

sed_hg_pmol_g
sed_mehg_pmol_g/ sed_hg_pmol_g*100 # % of Mehg sed


disshg_pM$Sed1
disshg_pM_upper<-disshg_pM
sed_hg_pmol_g_upper<-sed_hg_pmol_g
s3<-c(disshg_pM_upper, sed_hg_pmol_g_upper$surface)
dati<-c(1.86,2.127058824,1.7675,1.902,2.056,3.0875,2.81090,3.714,3.7137,798.06)

#setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0")
#sim_hgII<-data.frame(s1, s2, s3, dati)
#write.table(sim_hgII, file='sim_hgII_out.txt')

#sub_met<-data.frame(dissMehg_pM_O1, dissMehg_pM_O2, dissMehg_pM_O3)
#   names(sub_met)<-c('s1','s2','s3')
#setwd("C:/Users/gi/Dropbox/BlackSeA3/implementazione/new_sim0/_met")
# write.table(sub_met, file='sub_met_mehg_out.txt')
# Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))}
# Function that returns Mean Absolute Error
mae <- function(error)
{
  mean(abs(error))
}
error<-medie_hg_pM-disshg_pM# Example of invocation of functions
rmse(error)

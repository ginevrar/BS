setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0/medio/new_17jan")
#setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1b")
evasion<-read.csv("Volatilization_Loss_Rate.csv", header=FALSE, skip = 1, sep = ",", dec=".")
names(evasion)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
kvol_adj<-evasion[2:1969,1:13]
d<-tail(kvol_adj$Oxic1, 12)

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

fine_hgT<-hgT[1968:1979,]
fine_hg<- hg [1968:1979,]
fine_Phg<- Phg [1968:1979,]
fine_DOChg<- DOChg [1968:1979,]
fine_DOCmehg<- DOCmehg [1968:1979,]
fine_mehg<- mehg [1968:1979,]
fine_hg0<- hg0 [1968:1979,]
fine_mehgT<- mehgT [1968:1979,]
fine_solids<- solids [1968:1979,]

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

win.graph()
par(mfrow=c(1,1),cex.axis=1.2, cex.lab=1.3, cex.main=1.4 )
plot(medie_hg_pM, prof,  bty='n',lwd=2, cex=2.5,
     ylim=c(17.25,10.9), lty=1,
     xlim=c(0, 5), pch=21,
     ylab=" ", xlab=" ", type="b", col="#3288bd00", bg='#41b6c44400',main=" ")
rect(-1.5, 10.5 , 5,15.64 , density = NULL, angle = 45, 
     col = '#abd9e922', border = '#abd9e922', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 14.25 , 5,15.285 , density = NULL, angle = 45, 
     col = '#ffffd933', border = '#e8e888', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 16.2 , 5, 17.04 , density = NULL, angle = 45, 
     col = '#d2c7c722', border = '#d2c7c7', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 15.64 , 5,16.2 , density = NULL, angle = 45, 
     col = '#35978f22', border = '#35978f', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 17.04 , 5,17.23 , density = NULL, angle = 45, 
     col = '#a39b9b22', border = '#a39b9b', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 17.23 , 5,17.25 , density = NULL, angle = 45, 
     col = '#25232322', border = '#252323', lty = NULL, lwd = par("lwd"),
     xpd = NULL) 
par(new=T)
plot(medie_hg_pM, prof,  bty='n',lwd=1, cex=2.5,
     ylim=c(17.3,10.9), lty=1,
     xlim=c(0, 5), pch=21,
     ylab=" ", xlab=" ", type="b", col="#3288bd", bg='#41b6c444',main=" ")
par(new=TRUE)
segments(x1-sd1,y,x1+sd1,y, col='#3288bd', lwd=1)
epsilon <- 0.12
segments(x1-sd1,y-epsilon,x1-sd1,y+epsilon, col='#3288bd')
segments(x1+sd1,y-epsilon,x1+sd1,y+epsilon, col='#3288bd')
par(new=TRUE)
plot(disshg_pM,prof, type="b",pch=24,  lwd=1,cex=1.5,
     ylim=c(17.3,10.9),  bty='n', xlim=c(0, 5),lty=3,
     xlab="Hg concentrations (pM)", col="#fe9929", bg='#fee08b44', ylab=expression(paste(sigma[theta]*'  (kg/m'^3*')')),
     main=expression(paste("S5 Hg vertical profiles along the water column")))
legend(3,11, pch=c(21,21),legend=c("Data", "Model"),
       col=c("#1f78b4", "#fe9929", '#fee08b44','#fee08b44'), cex=1.5)
#text(3,15,"OM=7*10^5 \n silt=2.
text(4,12,'OL', cex=.9, font=2)
text(4,14.7,'CIL', cex=.9, font=2)
text(4,15.9,'SOL', cex=.9, font=2)
text(1,16.6,'AOL', cex=.9, font=2)


x2<-medie_mehg_pM

mean(disshg_pM[1:4])


##-----SEDIMENT conc
hgT_fine<-hgT[1968:1979, 1:13]
b<-mean(hgT_fine$Sed1/200.59*1000);b
c<-mean(hgT_fine$Sed2/200.59*1000);c

mehgT_fine<-mehgT[1968:1979, 1:13]
d<-mean(mehgT_fine$Sed1/200.59*1000)
e<-mean(mehgT_fine$Sed2/200.59*1000)

sed_hg_pmol_g<-data.frame(b,c)
names(sed_hg_pmol_g)<-c('surface','subsurface')

sed_mehg_pmol_g<-data.frame(d,e)
names(sed_mehg_pmol_g)<-c('surface','subsurface')
sed_hg_pmol_g
sed_mehg_pmol_g

# ----end sed conc

# --- PLOT Mehg----------------------mehg
#
win.graph()
#dev.new(width=12, height=4)
par(mfrow=c(1,1),mar=c(4,3,5,3), cex.axis=1.2, cex.lab=1.3, cex.main=1.4 )
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=1.3,
     ylim=c(17.3,10.9), lty=1,
     xlim=c(0, 1), pch=22,
     ylab=" ", xlab=" ", type="b", col="#c51b7d00",bg='#de77ae4400', main=" ")
rect(-1.5, 10.5 , 1,15.64 , density = NULL, angle = 45, 
     col = '#abd9e922', border = '#abd9e922', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 14.25 , 1,15.285 , density = NULL, angle = 45, 
     col = '#ffffd933', border = '#e8e888', lty = NULL, lwd = par("lwd"),
     xpd = NULL)

rect(-1.5, 16.2 , 1,17.04 , density = NULL, angle = 45, 
     col = '#d2c7c722', border = '#d2c7c7', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 15.64 , 1,16.2 , density = NULL, angle = 45, 
     col = '#35978f22', border = '#35978f', lty = NULL, lwd = par("lwd"),
     xpd = NULL)

rect(-1.5, 17.04 , 1,17.23 , density = NULL, angle = 45, 
     col = '#a39b9b22', border = '#a39b9b', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
rect(-1.5, 17.23 , 1,17.25 , density = NULL, angle = 45, 
     col = '#25232322', border = '#252323', lty = NULL, lwd = par("lwd"),
     xpd = NULL)
#plot(layer_Pmehg*20 ,prof, type="b",pch=23,  lwd=1.3,cex=1.3,
 #    ylim=c(17.3,10.9),  bty='n', xlim=c(0,1),lty=3,
  #   xlab="MeHg concentrations (pM)", col='#103513', bg='#10351322', ylab=expression(paste(sigma[theta]*'  (kg/m'^3*')')),
   #  main=expression(paste("MeHg vertical profiles \n along the water column")))
par(new=T)
par(new=T)
plot(medie_mehg_pM, prof,  bty='n',lwd=1.3, cex=2.5,
     ylim=c(17.3,10.9), lty=1,
     xlim=c(0, 1), pch=22,
     ylab=" ", xlab=" ", type="b", col="#c51b7d",bg='#de77ae44', main=" ")
segments(x2-sd2,y,x2+sd2,y, col='#c51b7d', lwd=1)
epsilon <- 0.12
segments(x2-sd2,y-epsilon,x2-sd2,y+epsilon, col='#c51b7d')
segments(x2+sd2,y-epsilon,x2+sd2,y+epsilon, col='#c51b7d')
par(new=TRUE)
#plot(sa2,prof, type="b",pch='*',  lwd=1.3,cex=3,
#     ylim=c(17.3,10.9),  bty='n', xlim=c(0,1),lty=3,
#    xlab="MeHg concentrations (pM)", col="#92e128", bg='#92e12833', ylab=expression(paste(sigma[theta]*'  (kg/m'^3*')')),
#   main=expression(paste("MeHg vertical profiles \n along the water column")))
par(new=TRUE)
plot(dissMehg_pM, prof, type="b",pch=23,  lwd=1.3,cex=2.5,
     ylim=c(17.3,10.9),  bty='n', xlim=c(0,1), lty=2,
     xlab="MeHg concentrations (pM)", col="#38bd45", 
     bg='#38bd4555', ylab='',   main='')
par(new=TRUE)
p<-c(22,23,25)
legend(.6,11, pch=p,legend=c("MeHgd Data", 'MeHgd sim m5',
                             'MeHgP sim m5'),
       col=c("#c51b7d", "#7fbc41", '#007e00'), 
       pt.bg=c('#de77ae44','#b8e18644','#10351333'))
text(.4,12,'OL', cex=1.1, font=2)
text(.4,14.7,'CIL', cex=1.1, font=2)
text(.4,15.9,'SOL', cex=1.1, font=2)
text(.1,16.6,'UAOL', cex=1.1, font=2)
text(.2,17.1,'DAOL', cex=1.1, font=2)
text(.35,17.3,'BBL', cex=1.1, font=2)

cor
sd(disshg_pM)
#disshg_pM
dissMehg_pM
sed_hg_pmol_g
sed_mehg_pmol_g/ sed_hg_pmol_g*100 # % of Mehg sed


disshg_pM$Sed1
disshg_pM_upper<-disshg_pM
sed_hg_pmol_g_upper<-sed_hg_pmol_g
s3<-c(disshg_pM_upper, sed_hg_pmol_g_upper$surface)
dati<-c(1.86,2.127058824,1.7675,1.902,2.056,3.0875,2.81090,3.714,3.7137,798.06)

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


##
# extract sim data, calculates Reservoirs of Hg and MeHg
# and compare with observed data.
#
# Wh1b is the new wh1
#
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e_morehg_tris")


medie_hg_pM<-c(1.86,2.127058824,1.7675,1.902,
               2.056666667,3.0875,2.810909091,3.714, 3.713684211)

medie_mehg_pM<-c(0.116285714,
                 0.1408125,
                 0.120611111,
                 0.108857143,
                 0.157888889,
                 0.767916667,
                 0.551913043,
                 0.751090909,
                 0.737428571)
# Standard dev of Hg 
sd1<-c(0.4911890,
       0.6179782,
       0.5060026, 
       0.5832838,
       0.6269617, 
       0.7147727,
       0.5266774,
       0.3722066, 
       0.4352804)
# Standard dev of meHg 
sd2<-c(0.036545471,
       0.034533498,
       0.034428338,
       0.035267684,
       0.083861152,
       0.170347104,
       0.149375644,
       0.130289388,
       0.095633974)
# sigma teta
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

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

Phg<-read.csv("Total_Sorbed_Divalent_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

Pmehg<-read.csv("Total_Sorbed_Methyl_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Pmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

summary(Phg)
summary(Pmehg)
# Pmehg ng/g

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
str(mehgT)
solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Temp<-read.csv("Segment_Temperature.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Temp)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
str(Temp)
# model out luglio 2013
july_hgT<-hgT[1975,]; str(july_hgT)
july_hg<- hg [1975,]
july_Phg<- Phg [1975,]
july_DOChg<- DOChg [1974,]
july_DOCmehg<- DOCmehg [1974,]
july_mehg<- mehg [1974,]
july_hg0<- hg0 [1974,]
july_mehgT<- mehgT [1974,]
july_solids<- solids [1974,]
july_t<-Temp[1975,]

# model out luglio 2013
fine_hgT<-hgT[1958:1969,]
fine_hg<- hg [1958:1969,]
fine_Phg<- Phg [1958:1969,]
fine_Pmehg<- Pmehg [1958:1969,]
fine_DOChg<- DOChg [1958:1969,]
fine_DOCmehg<- DOCmehg [1958:1969,]
fine_mehg<- mehg [1958:1969,]
fine_hg0<- hg0 [1958:1969,]
fine_mehgT<- mehgT [1958:1969,]
fine_T<- Temp [1958:1969,]
plot(fine_T$Oxic1)


hgII_pM<-(hg+DOChg0+DOChg)/200.59*1000
tail(hgII_pM[1975:2,13])
mehg_pM_<-(mehg+DOCmehg)/215*1000
tail(mehg_pM_[1974])
mehgT_pM<-mehgT/215*1000
tail(mehg_pM_,3)/tail(mehgT_pM,3)*100

B_Phg<- fine_hgT - (fine_DOChg+fine_hg+fine_mehgT+fine_hg0)
B_Phg$Oxic1
fine_Phg$Oxic1

str((fine_hg$Oxic1))
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


layer_hgT_sd <-c(layer1<-sd(fine_hgT$Oxic1),
                 layer2<-sd(fine_hgT$Oxic2),
                 layer3<-sd(fine_hgT$CIL),
                 layer4<-sd(fine_hgT$Oxycline),
                 layer5<-sd(fine_hgT$Suboxic1),
                 layer6<-sd(fine_hgT$Suboxic2),
                 layer7<-sd(fine_hgT$Anoxic),
                 layer8<-sd(fine_hgT$Anoxic2),
                 layer9<-sd(fine_hgT$Anoxic3))

layer_hgT_july <-c(layer1<-(july_hgT$Oxic1),
                   layer2<-(july_hgT$Oxic2),
                   layer3<-(july_hgT$CIL),
                   layer4<-(july_hgT$Oxycline), 
                   layer5<-(july_hgT$Suboxic1),
                   layer6<-(july_hgT$Suboxic2),
                   layer7<-(july_hgT$Anoxic),
                   layer8<-(july_hgT$Anoxic2),
                   layer9<-(july_hgT$Anoxic3))

layer_mehg <-c(layer1<-mean(fine_mehg$Oxic1),
               layer2<-mean(fine_mehg$Oxic2),
               layer3<-mean(fine_mehg$CIL),
               layer4<-mean(fine_mehg$Oxycline),
               layer5<-mean(fine_mehg$Suboxic1),
               layer6<-mean(fine_mehg$Suboxic2),
               layer7<-mean(fine_mehg$Anoxic),
               layer8<-mean(fine_mehg$Anoxic2),
               layer9<-mean(fine_mehg$Anoxic3))

layer_mehg_sd<-c(layer1<-sd(fine_mehg$Oxic1/215*1000),
                 layer2<-sd(fine_mehg$Oxic2/215*1000),
                 layer3<-sd(fine_mehg$CIL/215*1000),
                 layer4<-sd(fine_mehg$Oxycline/215*1000),
                 layer5<-sd(fine_mehg$Suboxic1/215*1000),
                 layer6<-sd(fine_mehg$Suboxic2/215*1000),
                 layer7<-sd(fine_mehg$Anoxic/215*1000),
                 layer8<-sd(fine_mehg$Anoxic2/215*1000),
                 layer9<-sd(fine_mehg$Anoxic3/215*1000))

layer_mehgT <-c(layer1<-mean(fine_mehgT$Oxic1),
                layer2<-mean(fine_mehgT$Oxic2), 
                layer3<-mean(fine_mehgT$CIL),
                layer4<-mean(fine_mehgT$Oxycline),
                layer5<-mean(fine_mehgT$Suboxic1),
                layer6<-mean(fine_mehgT$Suboxic2),
                layer7<-mean(fine_mehgT$Anoxic),
                layer8<-mean(fine_mehgT$Anoxic2),
                layer9<-mean(fine_mehgT$Anoxic3))

layer_mehgT_sd <-c(layer1<-sd(fine_mehgT$Oxic1),
                   layer2<-sd(fine_mehgT$Oxic2), 
                   layer3<-sd(fine_mehgT$CIL),
                   layer4<-sd(fine_mehgT$Oxycline),
                   layer5<-sd(fine_mehgT$Suboxic1),
                   layer6<-sd(fine_mehgT$Suboxic2),
                   layer7<-sd(fine_mehgT$Anoxic),
                   layer8<-sd(fine_mehgT$Anoxic2),
                   layer9<-sd(fine_mehgT$Anoxic3))
plot((fine_mehgT$Oxic1))

layer_mehgT_july <-c(layer1<-(july_mehgT$Oxic1),
                     layer2<-(july_mehgT$Oxic2), 
                     layer3<-(july_mehgT$CIL),
                     layer4<-(july_mehgT$Oxycline),
                     layer5<-(july_mehgT$Suboxic1),
                     layer6<-(july_mehgT$Suboxic2),
                     layer7<-(july_mehgT$Anoxic),
                     layer8<-(july_mehgT$Anoxic2),
                     layer9<-(july_mehgT$Anoxic3))

layer_Phg <-c(layer1<-mean(fine_Phg$Oxic1),
              layer2<-mean(fine_Phg$Oxic2),
              layer3<-mean(fine_Phg$CIL),
              layer4<-mean(fine_Phg$Oxycline),
              layer5<-mean(fine_Phg$Suboxic1),
              layer6<-mean(fine_Phg$Suboxic2),
              layer7<-mean(fine_Phg$Anoxic),
              layer8<-mean(fine_Phg$Anoxic2),
              layer9<-mean(fine_Phg$Anoxic3))

layer_Pmehg <-c(layer1<-mean(fine_Pmehg$Oxic1),
                layer2<-mean(fine_Pmehg$Oxic2),
                layer3<-mean(fine_Pmehg$CIL),
                layer4<-mean(fine_Pmehg$Oxycline),
                layer5<-mean(fine_Pmehg$Suboxic1),
                layer6<-mean(fine_Pmehg$Suboxic2),
                layer7<-mean(fine_Pmehg$Anoxic),
                layer8<-mean(fine_Pmehg$Anoxic2),
                layer9<-mean(fine_Pmehg$Anoxic3))

layer_Phg_sd<-c(layer1<-sd(fine_Phg$Oxic1),
                layer2<-sd(fine_Phg$Oxic2),
                layer3<-sd(fine_Phg$CIL),
                layer4<-sd(fine_Phg$Oxycline),
                layer5<-sd(fine_Phg$Suboxic1),
                layer6<-sd(fine_Phg$Suboxic2),
                layer7<-sd(fine_Phg$Anoxic),
                layer8<-sd(fine_Phg$Anoxic2),
                layer9<-sd(fine_Phg$Anoxic3))

layer_Phg_july <-c(layer1<-(july_Phg$Oxic1),
                   layer2<-(july_Phg$Oxic2),
                   layer3<-(july_Phg$CIL),
                   layer4<-(july_Phg$Oxycline),
                   layer5<-(july_Phg$Suboxic1),
                   layer6<-(july_Phg$Suboxic2),
                   layer7<-(july_Phg$Anoxic),
                   layer8<-(july_Phg$Anoxic2),
                   layer9<-(july_Phg$Anoxic3))

layer_DOChg <-c(layer1<-mean(fine_DOChg$Oxic1),
                layer2<-mean(fine_DOChg$Oxic2),
                layer3<-mean(fine_DOChg$CIL),
                layer4<-mean(fine_DOChg$Oxycline),
                layer5<-mean(fine_DOChg$Suboxic1),
                layer6<-mean(fine_DOChg$Suboxic2),
                layer7<-mean(fine_DOChg$Anoxic),
                layer8<-mean(fine_DOChg$Anoxic2),
                layer9<-mean(fine_DOChg$Anoxic3))

layer_DOChg_sd <-c(layer1<-sd(fine_DOChg$Oxic1),
                   layer2<-sd(fine_DOChg$Oxic2),
                   layer3<-sd(fine_DOChg$CIL),
                   layer4<-sd(fine_DOChg$Oxycline),
                   layer5<-sd(fine_DOChg$Suboxic1),
                   layer6<-sd(fine_DOChg$Suboxic2),
                   layer7<-sd(fine_DOChg$Anoxic),
                   layer8<-sd(fine_DOChg$Anoxic2),
                   layer9<-sd(fine_DOChg$Anoxic3))


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

concentrazion_pM<-data.frame(layer_hg/200.59,layer_DOChg/200.59, layer_Phg/200.59, layer_hgT/200.59, 
                             layer_hg0/200.59, layer_mehg/215, layer_DOCmehg/215, layer_mehgT/215)
names(concentrazion_pM)<-c('layer_hg','layer_DOChg','layer_Phg', 'layer_hgT',
                           'layer_hg0','layer_mehg','layer_DOCmehg','layer_mehgT')
concentrazioni_pM<-concentrazion_pM*1000

layer_hgT_pm<-concentrazioni_pM$layer_hgT	   		  
layer_mehgT_pm<-concentrazioni_pM$layer_mehgT	   		  
disshg<-(layer_hg+layer_DOChg+layer_hg0)
dissmehg<-(layer_mehg+layer_DOCmehg)
disshgII_pM<-disshg/200.59*1000
dissMehg_pM<-dissmehg/215*1000
disshg_pM<-(disshgII_pM+dissMehg_pM)
disshg_pM/layer_hgT_pm*100

layer_Pmehg<-layer_mehgT_pm - dissMehg_pM


OL_hgt_pM<-(layer_hgT_pm[1:4])
summary(OL_hgt_pM)
OL_hgd<-disshg_pM[1:4]; mean(OL_hgd)
mean(OL_hgd/OL_hgt_pM*100)

OL_mehgt_pM<-(layer_mehgT_pm[1:4])
summary(OL_mehgt_pM)
OL_mehgd<-dissMehg_pM[1:4]; mean(OL_mehgd)*1000
mean(OL_mehgd/OL_mehgt_pM*100)

SOL_hgt_pM<-layer_hgT_pm[5]; ì
SOL_hgd<-disshg_pM[5]; mean(SOL_hgd)
mean(SOL_hgd/SOL_hgt*100)

SOL_mehgt<-layer_mehgT_pm[5];  mean(SOL_mehgt)
SOL_mehgd<-dissMehg_pM[5];  mean(SOL_mehgd)
mean(SOL_mehgd/SOL_mehgt*100)

AOL_mehgt<-layer_mehgT_pm[6:9];  mean(AOL_mehgt)
AOL_mehgd<-dissMehg_pM[6:9];  mean(AOL_mehgd)
mean(AOL_mehgd/AOL_mehgt*100)

AOL_hgt_pM<-layer_hgT_pm[6:9];  mean(AOL_hgt)
AOL_hgd<-disshg_pM[6:9];  mean(AOL_hgd)

mean(AOL_hgd/AOL_hgt*100)

OL_datihg<-medie_hg_pM[1:4]
SOL_datihg<-medie_hg_pM[5]
AOL_datihg<-medie_hg_pM[6:9]

OL_datimehg<-medie_mehg_pM[1:4]
SOL_datimehg<-medie_mehg_pM[5]
AOL_datimehg<-medie_mehg_pM[6:9]

OL_v<-c(5.9*10^12,(5.9*10^12),(4.5*10^12),(5.9*10^12))
SOL_v<-7.4*10^12
AOL_v<-c(5.3*10^13,5.3*10^13,2.9*10^14,10^14)
t_vol<-sum(OL_v)+sum(SOL_v)+sum(AOL_v); t_vol
OL_v_l<-OL_v*10^3
SOL_v_l<-SOL_v*10^3
AOL_v_l<-AOL_v*10^3

AOL_v[1]*AOL_hgd[1]/10^12
#  ------ HgD reservoir
a<-sum(OL_hgd*OL_v_l)/10^15
b<-sum(OL_datihg*OL_v_l)/10^15
(b-a)/b*100      # OL error +2%

c<-sum(SOL_hgd*SOL_v_l)/10^15
d<-sum(SOL_datihg*SOL_v_l)/10^15
(d-c)/d*100     # SOL error -9%

e<-sum(AOL_hgd*AOL_v_l)/10^15
f<-sum(AOL_datihg*AOL_v_l)/10^15
(f-e)/f*100    # AOL error -4%
(a+c+e)   #tot HgD kmol
(b+d+f)-(a+c+e) #data - model reservoir
(f-e)/((b+d+f)-(a+c+e))

#-----------314   kmols missing 

#  ------ MeHgD reservoir
a1<-sum(OL_mehgd*OL_v)/10^12
b1<-sum(OL_datimehg*OL_v)/10^12
(b1-a1)/b1*100      # OL error +13%

c1<-sum(SOL_mehgd*SOL_v)/10^12
d1<-sum(SOL_datimehg*SOL_v)/10^12
(d1-c1)/d1*100     # SOL error +23%

e1<-sum(AOL_mehgd*AOL_v)/10^12
f1<-sum(AOL_datimehg*AOL_v)/10^12
(f1-e1)/f1*100    # AOL error +1.5%

(a1+c1+e1)/(a+c+e)*100  # ------ MeHg%
(a1+c1+e1) # ------ tot MehgD kmol
(b1+d1+f1)-(a1+c1+e1) #data - model reservoir
(a1+c1+e1)*215/10^3 #------ tot MehgD tons
#  ------ HgT reservoir
g<-sum(OL_hgt_pM*OL_v_l)/10^15
h<-sum(SOL_hgt_pM*SOL_v)/10^12
i<-sum(SOL_hgt_pM*AOL_v)/10^12
i
(g+h+i)   #--------tot Hgt kmol
(g+h+i)*200.59/10^3   #--------tot Hgt kmol
i/(g+h+i) 
#  ------ MeHgT reservoir
g1<-sum(OL_mehgt_pM *OL_v)/10^12
h1<-sum(SOL_mehgt*SOL_v)/10^12
i1<-sum(AOL_mehgt*AOL_v)/10^12

g1+h1+i1  #tot Mehg kmol
(g1+h1+i1)/(g+h+i)*100   # ------ MeHg%
(g1+h1+i1)*200.59/10^3 


Phg$Sed1[1968]/100
Phg$Sed1[1968]/100/hgT$Sed1[1968]*100
Phg$Sed2[1968]/100/hgT$Sed2[1968]


#  ------ SED HgT reservoir

##-----SEDIMENT conc
hgT_fine<-hgT[1968, 1:13]
b<-mean(hgT_fine$Sed1/200.59*1000);b  #ng/g
c<-mean(hgT_fine$Sed2/200.59*1000);c

mehgT_fine<-mehgT[1968, 1:13]
d<-mean(mehgT_fine$Sed1/200.59*1000);d
e<-mean(mehgT_fine$Sed2/200.59*1000);e

sed_hg_pmol_g<-data.frame(b,c)
names(sed_hg_pmol_g)<-c('surface','subsurface')

sed_mehg_pmol_g<-data.frame(d,e)
names(sed_mehg_pmol_g)<-c('surface','subsurface')
sed_hg_pmol_g
sed_mehg_pmol_g

sed_mehg_pmol_g/sed_hg_pmol_g*100



solids_sed<-data.frame(solids$Sed1[1968],solids$Sed2[1968]) #g/m3

sed_hg_pmol_m3<-sed_hg_pmol_g*solids_sed
sed_mehg_pmol_m3<-sed_mehg_pmol_g*solids_sed


Vol_Sed1_m3<-8.8*10^9
Vol_Sed2_m3<-2*10^10
Vol_Sed_m3<-data.frame(Vol_Sed1_m3,Vol_Sed2_m3)

sed_hg_pmols<-sed_hg_pmol_m3*Vol_Sed_m3
sed_hg_kmols<-sed_hg_pmols/10^15
##-----SEDIMENT HgT reservoir
rowSums(sed_hg_kmols)
rowSums(sed_hg_kmols)*200.59/1000

sed_mehg_pmols<-sed_mehg_pmol_m3*Vol_Sed_m3
sed_mehg_kmols<-sed_mehg_pmols/10^15
rowSums(sed_mehg_kmols)##-----SEDIMENT MeHgT reservoir
rowSums(sed_mehg_kmols)*215/1000

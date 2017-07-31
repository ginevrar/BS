
setwd("C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/implementazione/nuovi_script")
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale2')
Clean_data<-read.table('Dataset_Finale_new_no_bosforo.txt', header=T)
str(Clean_data)

MeHg_per<-(Clean_data$MeHg/Clean_data$Hg)
str(MeHg_per)

Hg<-data.frame(Clean_data$Station, Clean_data$sigma, Clean_data$Depth, MeHg_per)
names(Hg)<-c("Station","Density", "Depth" ,"MeHg_per")


str(Clean_data$Fe)
Fe_5<-Clean_data[(Clean_data$Station=='UCC5_1'),]
Fe_5$Fe

Fe_HR1<-Clean_data[(Clean_data$Station=='UCC5_4'),]
Fe_HR1$Fe

plot(Fe_HR1$Fe)
(Fe_HR1$Depth)


Hg_NoBosforo<-Hg[(Hg$Station!="UCC12" & Hg$Station!="LV11" & Hg$Station!="UCC2"),] 
#exclude station UCC12

summary(Hg_NoBosforo)
plot(Hg_NoBosforo$Hg, Hg_NoBosforo$Density,ylim=c(17.5,15))
abline(h=13)
abline(h=14)
abline(h=14.5)
abline(h=15)
abline(h=15.5)
abline(h=16)
abline(v=10)

#-----SUBSET FOR Density-------------
## --layer1 ------ 10<=dens<13    OXy1
Hg_dens1<-Hg_NoBosforo[(Hg_NoBosforo$Density <=12.05),]   
summary(Hg_dens1)
str(Hg_dens1)
Densmean1<- mean(Hg_dens1$Density, na.rm=TRUE)
Hgmean1<- mean(Hg_dens1$MeHg_per , na.rm=TRUE)
Hgmean1
## --layer1B ------ 13<=dens<14   Oxy2
Hg_dens1B<-Hg_NoBosforo[(Hg_NoBosforo$Density >12.05 & Hg_NoBosforo$Density<=14.25),]   
summary(Hg_dens1B)
str(Hg_dens1B)
Densmean1B<- mean(Hg_dens1B$Density, na.rm=TRUE)
Hgmean1B<- mean(Hg_dens1B$MeHg_per, na.rm=TRUE)
Hgmean1B

##  ---- layer2 --------     CIL
Hg_dens2<-Hg_NoBosforo[(Hg_NoBosforo$Density >14.25 & Hg_NoBosforo$Density <=15.18),]
summary(Hg_dens2)
Hgmean2<- mean (Hg_dens2$MeHg_per, na.rm=TRUE)
Densmean2<- mean (Hg_dens2$Density, na.rm=TRUE)
Hgmean2
## 14.5<dens<15.5    -->  Oxycline fino a picco NO3

Hg_dens3<-Hg_NoBosforo[(Hg_NoBosforo$Density >15.18 & Hg_NoBosforo$Density<=15.64),]
str(Hg_dens3$Hg)
Hgmean3<- mean (Hg_dens3$MeHg_per, na.rm=TRUE)
Densmean3<- mean (Hg_dens3$Density, na.rm=TRUE)
Hgmean3
library(lattice)
## 15.5<dens<15.95  --> SUboxic 1 
Hg_dens4<-Hg_NoBosforo[(Hg_NoBosforo$Density >15.64 & Hg_NoBosforo$Density<=16.2),]
summary(Hg_dens4$Station)
Hgmean4<- mean (Hg_dens4$MeHg_per, na.rm=TRUE); str(Hg_dens4); xyplot(Hg ~ Density | Station, data=Hg_dens4)
xyplot(Density ~ Hg , data=Hg_dens4, groups=Station, pch=19)

Densmean4<- mean (Hg_dens4$Density, na.rm=TRUE)
Hgmean4

## 15.95<dens<16.15  --> Suboxic2                            
Hg_dens5<-Hg_NoBosforo[(Hg_NoBosforo$Density >16.2 & Hg_NoBosforo$Density<=16.6),]
Hgmean5<- mean (Hg_dens5$MeHg_per, na.rm=TRUE)
Densmean5<- mean (Hg_dens5$Density, na.rm=TRUE)

summary(Hg_dens5$MeHg_per*100, na.rm=TRUE)

Hgmean5

#----- layer 6

Hg_dens6<-Hg_NoBosforo[(Hg_NoBosforo$Density >16.6 & Hg_NoBosforo$Density<17.04),]
Hgmean6<- mean (Hg_dens6$MeHg_per, na.rm=TRUE)
Densmean6<- mean (Hg_dens6$Density, na.rm=TRUE)
Hg_dens6

summary(Hg_dens6$MeHg_per*100, na.rm=TRUE)

#---layer 7 -- 16.25 - 16.35

Hg_dens7<-Hg_NoBosforo[(Hg_NoBosforo$Density >=17.04 & Hg_NoBosforo$Density<17.24),]
Hgmean7<- mean (Hg_dens7$MeHg_per, na.rm=TRUE)
Densmean7<- mean (Hg_dens7$Density, na.rm=TRUE)
Hgmean7

summary(Hg_dens7$MeHg_per*100, na.rm=TRUE)

#---layer 8 -- 

Hg_dens8<-Hg_NoBosforo[(Hg_NoBosforo$Density >=17.24 ),]
Hgmean8<- mean (Hg_dens8$MeHg_per, na.rm=TRUE)
Densmean8<- mean (Hg_dens8$Density, na.rm=TRUE)
Hgmean8

x_Hg=c(Hgmean1, Hgmean1B, Hgmean2, Hgmean3, Hgmean4, Hgmean5, 
       Hgmean6, Hgmean7, Hgmean8)
x_Hg*100 

y_Dens=c(Densmean1,Densmean1B,Densmean2,Densmean3,Densmean4,Densmean5,Densmean6,
         Densmean7,Densmean8)

plot(x_Hg, y_Dens, ylim=c(17.3, 10.5), col="blue", type="b")



aa<-(Hg_dens5$MeHg_per*100)
bb<-(Hg_dens6$MeHg_per*100)
cc<-(Hg_dens7$MeHg_per*100)
dd<-(Hg_dens8$MeHg_per*100)
ee<-(Hg_dens8$MeHg_per*100)

anox<-c(aa,bb,cc,dd,ee)
summary(anox)

a<-summary(Hg_dens1$Station); a; s1tr(a)
a1<-summary(Hg_dens1B$Station); a; str(a1)
b<-summary(Hg_dens2$Station)
c<-summary(Hg_dens3$Station)
d<-summary(Hg_dens4$Station)
e<-summary(Hg_dens5$Station)
g<-summary(Hg_dens6$Station)
h<-summary(Hg_dens7$Station)
i<-summary(Hg_dens8$Station)

tutti<-c(a,b,c,d,e,g,h,i)
boxplot(tutti)

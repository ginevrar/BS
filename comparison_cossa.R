
## DATI LARS

setwd("C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/implementazione/nuovi_script")

data<-read.table('Dataset_Finale_new_no_bosforo.txt', header=T)
str(data)

data_eu<-data[(data$sigma<14.25),]
data_CIL_oxyc<-data[(data$sigma>=14.25 & data$sigma<15.64),]


data_OL<-data[(data$sigma<15.64),]
data_SOL<-data[(data$sigma>=15.64 & data$sigma<16.2),]
data_AOL<-data[(data$sigma>=16.2),]


setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/Data/Lamborg_data')

dati<-read.table('Lamborg_data.txt', header = T)
str(dati)
names(dati)<-c('Station','CTD','btl','Depth','den', 'O2', 'Pot_t',
               'Sal', 'Trans', 'HgT','Hg0','MeHg','Me2Hg','percHg','percMeHg','percMe2Hg')

dati_WG<-dati[(dati$Station=="WG"),]
dati_CS<-dati[(dati$Station=="CS"),]

dati_WG_OL<-dati_WG[(dati_WG$O2>20),]
dati_WG_AOL<-dati_WG[(dati_WG$den>16.2),]
dati_WG_SOL<-dati_WG[(dati_WG$O2<=20 & dati_WG$den<16.2),]


setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2")

ax2<-(seq(1850,2050, by=.08291874))

hgT<-read.csv('Total_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgT<-hgT [2:2413,]

hgD<-read.csv('Dissolved_Divalent_Hg.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(hgD)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
hgD<-hgD [2:2413,]

Temp<-read.csv('Segment_Temperature.csv', header=FALSE, skip = 1,sep = ",", dec=".")
names(Temp)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1","Suboxic2", "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
Temp<-Temp[2:2413,]
DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOChg<-DOChg[2:2413,]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
mehg<-mehg[2:2413,]
DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")
DOCmehg<-DOCmehg[2:2413,]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2")

hg0<-hg0[2:2413,]

str(hgT)
2412/200

disshgII_pM<-(hgD+DOChg+hg0)/200.59*1000
dissMehg_pM<-(mehg+DOCmehg)/215*1000

disshg_pM<-(disshgII_pM+dissMehg_pM)


## Lamborg = 2005  [1869:1881]
## Cossa =    1990 - 1995 [1688:1760]
Temp<-tail(Temp,36)
1748+12
plot(hgT$Sed1)

oxic_conc<-data.frame(hgT$Oxic1,hgT$Oxic2,hgT$CIL,hgT$Oxycline)
oxic_conc_pM<-rowMeans(oxic_conc)/200.59*1000
sd_ox<-apply( oxic_conc, 1, sd ) 
dat1<-data.frame(ax2,oxic_conc_pM,sd_ox)
ses1<-oxic_conc_pM+outer(sd_ox, c(1,-1))

oxic_concHgD<-data.frame(disshg_pM$Oxic1,disshg_pM$Oxic2,disshg_pM$CIL,disshg_pM$Oxycline)
oxic_conc_HgDpM<-rowMeans(oxic_concHgD)

sub_conc_pM<-hgT$Suboxic1/200.59*1000
sub_conc_HgDpM<-disshg_pM$Suboxic1

anoxic_conc<-data.frame(hgT$Suboxic2,hgT$Anoxic,hgT$Anoxic2,hgT$Anoxic3)
anoxic_conc_pM<-rowMeans(anoxic_conc)/200.59*1000
sd_anox<-apply( anoxic_conc, 1, sd ) 

anoxic_concHgD<-data.frame(disshg_pM$Suboxic2,disshg_pM$Anoxic,disshg_pM$Anoxic2,disshg_pM$Anoxic3)
anoxic_conc_HgDpM<-rowMeans(anoxic_concHgD)

dat2<-data.frame(ax2,anoxic_conc_pM,sd_anox)
ses2<-anoxic_conc_pM+outer(sd_anox, c(1,-1))

om<-mean(oxic_conc_pM[1957:1968])
empty_v1<-rep('NA',2412)
empty_v1[1957]<- om

sub_pM<-hgT$Suboxic1/215*1000
os<-mean(sub_pM[1957:1968])
empty_v2<-rep('NA',2412)
empty_v2[1957]<- os

oa<-mean(anoxic_conc_pM[1957:1968])
empty_v3<-rep('NA',2412)
empty_v3[1957]<- oa

ax<-(1850:2050)


oxic_conc_pM_media   <-tapply(oxic_conc_pM,rep(1:(length(oxic_conc_pM)/12),each = 12), mean)
suboxic_conc_pM_media   <-tapply(sub_conc_pM,rep(1:(length(sub_conc_pM)/12),each = 12), mean)
anoxic_conc_pM_media   <-tapply(anoxic_conc_pM,rep(1:(length(anoxic_conc_pM)/12),each = 12), mean)

as.numeric(oxic_conc_pM_media[164] )-as.numeric(oxic_conc_pM_media[165] )
as.numeric(oxic_conc_pM_media[165] )-as.numeric(oxic_conc_pM_media[166] )

vol_OL<-((5.9*10^12)*2)+4.5*10^12+5.9*10^12
vol_OL_L<-vol_OL*1000
OLinc<- -0.0016 *vol_OL_L # pmol/y
OLinc_kmol<-OLinc/10^15   # kmol/y
OLinc_kmol

as.numeric(suboxic_conc_pM_media[164] )-as.numeric(suboxic_conc_pM_media[165] )
as.numeric(suboxic_conc_pM_media[165] )-as.numeric(suboxic_conc_pM_media[166] )

vol_SOL<-7.4*10^12
vol_SOL_L<-vol_SOL*1000
SOLinc<- -0.003 *vol_SOL_L #pmol/y
SOLinc_kmol<-SOLinc/10^15 #kmol/y
SOLinc_kmol


as.numeric(anoxic_conc_pM_media[164] )-as.numeric(anoxic_conc_pM_media[165] )
as.numeric(anoxic_conc_pM_media[165] )-as.numeric(anoxic_conc_pM_media[166] )

vol_AOL<-((5.3*10^13)*2)+(2.9*10^14)+(10^14)
vol_AOL_L<-vol_AOL*1000

AOLinc<-0.01 *vol_AOL_L #pmol/y
AOLinc_kmol<-AOLinc/10^15 #kmol/y
AOLinc_kmol




as.numeric(anoxic_conc_pM_media[164] )
as.numeric(anoxic_conc_pM_media[165] )
as.numeric(anoxic_conc_pM_media[166] )

vol_AOL<-(5.3*10^13)*2+(2.9*10^14)+(10^14)
vol_AOL_L<-vol_AOL*1000

inc<-0.01 *vol_AOL_L #pmol/y
inc_kmol<-inc/10^15 #kmol/y
inc_kmol


setwd('C:\\Users\\Ginevra\\Google Drive\\MERCURIO\\BlackSea\\REvision2') 
datac<-read.table('cossa_data.txt',header=T)

ox_cossa<-datac[(datac$redox=='O'),]
sox_cossa<-datac[(datac$redox=='SO'),]
aox_cossa<-datac[(datac$redox=='AO'),]


plot(as.numeric(anoxic_conc_pM_media ))

tiff('Comaprison.tiff', height=14.5, width=30, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(2,1), mar=c(4.5,5,4,1), bty='n') 

boxplot(oxic_conc_pM[1748:1760], ox_cossa$Hg_pM,  sub_conc_pM[1748:1760],
        sox_cossa$Hg_pM,  anoxic_conc_pM[1748:1760], aox_cossa$Hg_pM,
        col=c('#00BFFF44','#00BFFF44','#66CD0044','#66CD0044',
              '#80002644', '#80002644'),boxwex=.2, cex.axis=1,
        ylim=c(0,6), xlim=c(0,3.5), at=c(.3,.6,1.5,1.8,2.65,2.95),
        names=c('Model ','Data','Model ','Data','Model ','Data'))
text(.5,5.5,'OL', font=2, col='#00BFFF')
abline(v=1.1, lty=3)
text(1.6,5.5,'SOL', font=2, col='#66CD00')
abline(v=2.3, lty=3)
text(2.8,5.5,'AOL', font=2, col='#800026')
mtext(side=3, line=1.4,(expression(paste('Hg'[T]*' concentrations'))), font=2) 
mtext(side=3,line=.5,'(1995)')

boxplot(oxic_conc_HgDpM[1869:1968],dati_WG_OL$HgT,data_OL$Hg, 
        sub_conc_HgDpM[1869:1968],dati_WG_SOL$HgT,data_SOL$Hg,
        anoxic_conc_HgDpM[1869:1968],dati_WG_AOL$HgT,data_AOL$Hg, 
        col=c('#00BFFF44','#00BFFF44','#00BFFF44','#66CD0044','#66CD0044',
              '#66CD0044','#80002644', '#80002644','#80002644'),
        boxwex=.2,cex.axis=.8,
        ylim=c(0,12), xlim=c(0,3.5), at=c(.2,.5,.8,
                                         1.3,1.7,2.1,
                                         2.5,2.9,3.3),
        names=c('Model ','Data (2005)','Data (2013)',
                'Model ','Data (2005)','Data (2013)',
                'Model ','Data (2005)','Data (2013)'))

text(.5,11,'OL', font=2, col='#00BFFF')
abline(v=1.1, lty=3)
text(1.6,11,'SOL', font=2, col='#66CD00')
abline(v=2.3, lty=3)
text(2.7,11,'AOL', font=2, col='#800026')
mtext(side=3, line=1.4,(expression(paste('Hg'[D]*' concentrations'))), font=2) 
mtext(side=3,line=.5,'(2005 - 2013)')
dev.off()




## Lamborg = 2005  [1869:1881]
## Cossa =    1990 - 1995 [1688:1760]
Temp<-tail(Temp,36)

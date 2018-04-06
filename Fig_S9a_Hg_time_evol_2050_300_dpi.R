# 164 anni per 12 mesi = 1968
# attenzione !!
###   Budget HgT !!
#
ax2<-(seq(1850,2050, by=.08291874))
str(ax2)

setwd('C:/Users/gi/Documents/Lavoro/SIM_finale2')
setwd("C:/Users/Ginevra/Desktop/new_sim_BS")

input_hg1 <-read.table("input_Hg.txt", header=TRUE); str(input_hg1)

setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2")

setwd('C:/Users/Ginevra/Google Drive/MERCURIO/BlackSea/REvision2/SImulazioni_FInali/ULTIME_hgII___/In1')
=======
setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In1")

#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=","); str(ore1)
ore1_mehg  <-read.table("water_input_output_long_mehg_1_2050", header=TRUE, sep=","); str(ore1_mehg)

hgT_inflow_kmol_y     <- ore1$hgT_inflow_kmol_y[1:2412]; str(hgT_inflow_kmol_y)
river_hgT_kmol_y       <- ore1$river_hg_kmol_y[1:2412];  (river_hgT_kmol_y[1958:1967])
river_hgII_kmol_y<- input_hg1$river_load_hgII_kg_d*365*10^6/200.59; tail(river_hgII_kmol_y)

atm_hg_kmol_y         <- ore1$atm_hg_kmol_y[1:2412]
evasione_kmol_y     <-ore1$evasione_kmol_y[1:2412]

hgT_outflow_kmol_y <-ore1$hgT_outflow_kmol_y[1:2412]

diffusion_hgIIkmol_y    <-ore1$diffusion_kmol_y[1:2412]
diffusion_mehgkmol_y    <-ore1_mehg$diffusion_kmol_y[1:2412]
diffusion_kmol_y   <-diffusion_hgIIkmol_y+diffusion_mehgkmol_y

diffusion_hgIIkmol_y[1958:1967]
diffusion_mehgkmol_y[1958:1967]
str(ore1_mehg)
burialhgii_kmol_y      <-ore1$burial1_kmol_y[1:2412]
burialmehg_kmol_y      <-ore1_mehg$burial1_kmol_y[1:2412]
burialhgii_kmol_y      <-ore1$burial1_kmol_y[1:2412]

burial1_kmol_y      <-burialhgii_kmol_y +burialmehg_kmol_y

depo_PhgII_kmol_y    <-ore1$depo_Phg_kmol_y[1:2412]
depo_Pmehg_kmol_y<-ore1_mehg$depo_Pmehg_kmol_y[1:2412]
depo_Phg_kmol_y  <-depo_Pmehg_kmol_y+depo_PhgII_kmol_y
burialhgII_kmol_y      <- ore1$burial2_kmol_y[1:2412]
burialmehg_kmol_y      <- ore1_mehg$burial2_kmol_y[1:2412]
burial2_kmol_y<-burialhgII_kmol_y+burialmehg_kmol_y

mean(burialhgII_kmol_y[1958:1967]) 
mean(burialmehg_kmol_y[1958:1967])

Output_terms<-(evasione_kmol_y+depo_Phg_kmol_y+hgT_outflow_kmol_y)
Input_terms<-(hgT_inflow_kmol_y +river_hgT_kmol_y +atm_hg_kmol_y + diffusion_kmol_y)
Output_terms[2:164]; summary(Output_terms)

mean(depo_PhgII_kmol_y[1957:1968])+mean(depo_Pmehg_kmol_y[1957:1968])


diff<-Input_terms-Output_terms
cumulative_diff_kmol<-cumsum(diff)
summary(cumulative_diff_kmol)

cum_in<-cumsum(Input_terms)
cum_out<-cumsum(Output_terms)
summary(cum_in)
summary(cum_out)

str(ax2)
at<-mean(atm_hg_kmol_y[1957:1968])
empty_v<-rep('NA',2412)
empty_v[1957]<- at

ri<-mean(river_hgT_kmol_y[1957:1968])
empty_v2<-rep('NA',2412)
empty_v2[1957]<-ri
mean(river_hgT_kmol_y[1957:1968])
mean(river_hgII_kmol_y[1957:1968])

ri/T_in
inc<-mean(hgT_inflow_kmol_y[1957:1968])
empty_v3<-rep('NA',2412)
empty_v3[1957]<- inc

di<-mean(diffusion_kmol_y[1957:1968])
empty_v4<-rep('NA',2412)
empty_v4[1957]<- di

0.4/T_in*100

T_in<-mean(Input_terms[1957:1968])
empty_v5<-rep('NA',2412)
empty_v5[1957]<- T_in

ev<-mean(evasione_kmol_y[1957:1968])
empty_v6<-rep('NA',2412)
empty_v6[1957]<- -ev

dp<-mean(depo_Phg_kmol_y[1957:1968])
empty_v7<-rep('NA',2412)
empty_v7[1957]<- -dp

ev/T_ou*100
dp/T_ou*100

mean(burial2_kmol_y[1957:1968])/dp*100

di/dp*100

outc<-mean(hgT_outflow_kmol_y[1957:1968])
empty_v8<-rep('NA',2412)
empty_v8[1957]<--outc
outc/T_ou*100

T_ou<-mean(Output_terms[1957:1968])
empty_v9<-rep('NA',2412)
empty_v9[1957]<--T_ou

bilancio_hg<-c(T_in,ri,di,ev,dp, outc,T_ou)
names(bilancio_hg)<-c('input','river','diff','evas','depo','outflow','output')
bilancio_hg
#setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/BlackSea_IIDraft/submission_figures")
str(atm_hg_kmol_y)
setwd('C:/Users/Ginevra/Documents')

tiff('Fig.7A_Hg.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(5,5,4,1), bty='n') 

plot(ax2, atm_hg_kmol_y, col="cyan3", type="l",  ylim=c(-35,45), 
     main=expression(paste('Hg'[T]*' fluxes to the Black Sea')), ylab= " ", 
     xlab= " ",  lwd=1, cex.axis=2.2, cex.lab=2,cex.main=2.3)
par(new=T)
plot(ax2,empty_v, type='p', xlab= " ", ylab= " ", pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-35,45), bg='cyan4',col='black')
#axis(1,at=c(1850,1900,1950,2000,2050),labels=T, cex.axis=2.5)
#abline(v=2013, lty=2, col='gray60', lwd=2)
#text(2025,38,'2013',col='gray60', cex=1.9)
par(new=TRUE)
plot(ax2,river_hgT_kmol_y, col="chartreuse3", type="l", 
     xaxt='n',yaxt='n',ylim=c(-35,45), 
     ylab= " ",xlab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v2, bg='chartreuse4' ,col='black',type='p', xlab= " ", ylab= " ", 
     pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-35,45))
par(new=TRUE)
plot(ax2,hgT_inflow_kmol_y, col="darkblue", type="l", 
     xaxt='n',yaxt='n',
     ylim=c(-35,45), ylab= " ", xlab= " ",  lwd=2)
par(new=TRUE)
plot(ax2,empty_v3, bg='darkblue' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-35,45))
par(new=TRUE)
plot(ax2,diffusion_kmol_y, col="darkgoldenrod1", type="l", 
       xaxt='n',yaxt='n',
     ylim=c(-35,45), ylab= " ", xlab= " ",  lwd=2)
par(new=TRUE)
plot(ax2,empty_v4, bg='darkgoldenrod' ,col='black',type='p', xlab= " ", ylab= " ",
     pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-35,45))
par(new=TRUE)
plot(ax2, Input_terms, col="black", type="l", lty=2, 
       xaxt='n',yaxt='n',
     ylim=c(-35,45), ylab= " ", xlab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v5, bg='grey90' ,col='darkgrey',type='p', xlab= " ", ylab= " ", pch=23, cex=4, xaxt='n',yaxt='n', ylim=c(-35,45))
par(new=TRUE)
plot(ax2,-evasione_kmol_y, col="cyan4", type="l", xlab= " ", 
       ylim=c(-35,45), xaxt='n',yaxt='n',
     main=" ", ylab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v6, bg='cyan4' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-35,45))
par(new=TRUE)
plot(ax2,-depo_Phg_kmol_y, col="orange", type="l", xlab= " ", 
       ylim=c(-35,45), xaxt='n',yaxt='n',
     ylab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v7, bg='darkorange' ,col='black',type='p', xlab= " ", ylab= " ", 
     pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-35,45))
par(new=TRUE)
plot(ax2, -hgT_outflow_kmol_y, col="darkblue", type="l", 
     ylim=c(-35,45),xlab= " ",xaxt='n',yaxt='n',
     ylab= " ",  lwd=2)
par(new=TRUE)
plot(ax2,empty_v8, bg=' darkblue' ,col='black',type='p', xlab= " ", ylab= " ", 
     pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-35,45))
par(new=TRUE)
plot(ax2,-Output_terms, col="black", type="l", lty=2, 
       ylim=c(-35,45), xaxt='n',yaxt='n',
     xlab= " ", ylab= "",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v9, bg='grey90' ,col='darkgrey',type='p', xlab= " ", ylab= " ", pch=23, cex=4, xaxt='n',yaxt='n', ylim=c(-35,45))

mtext(expression(paste('kmol yr'^-1)), 2, at= 0, line=2.6, cex=2)

text(2000.0,10,'Atmospheric deposition',col='cyan4', cex=1.9)
text(1975,20,' River \n load',col='chartreuse4', cex=1.9)
#text(1980,12,'Inflow from Marmara Sea',col='darkblue')
text(1950,3,'Sediment Diffusion',col='darkgoldenrod', cex=1.9)
text(1850+60-20,36,'Input',col=1, cex=2.2)
text(1850+170,-10.5,'Evasion',col='cyan4',cex=1.9)
text(1950,-30,'Deposition to \n the sediment',col='darkorange',cex=1.9)
text(130+1850,-.5,'Inflow - Outflow',col='darkblue', cex=1.9)
text(1900,-23,'Output',col=1,cex=2.2)

dev.off()



mean(depo_Phg_kmol_y[1957:1964])
depo_Pmehg_kmol_y_media[164]+ mean(depo_PhgII_kmol_y[1957:1964])



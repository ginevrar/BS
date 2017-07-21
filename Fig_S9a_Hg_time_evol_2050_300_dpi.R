# 164 anni per 12 mesi = 1968
setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e")

ax<-seq(1851,2050, by=1)
a<-c(2.1,2,3)
ax2<-(seq(1850,2050, by=.0833))
str(ax2)
ax3<-(seq(1850,2050, by=1))
#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=","); str(ore1)

hgT_inflow_kmol_y     <- ore1$hgT_inflow_kmol_y[12:2412]; str(hgT_inflow_kmol_y)
river_hg_kmol_y       <- ore1$river_hg_kmol_y[12:2412]
atm_hg_kmol_y         <- ore1$atm_hg_kmol_y[12:2412]
evasione_kmol_y     <-ore1$evasione_kmol_y[12:2412]
diffusion_kmol_y    <-ore1$diffusion_kmol_y[12:2412]
hgT_outflow_kmol_y  <-ore1$hgT_outflow_kmol_y[12:2412]
burial1_kmol_y      <-ore1$burial1_kmol_y[12:2412]
depo_Phg_kmol_y     <-ore1$depo_Phg_kmol_y[12:2412]
burial2_kmol_y      <- ore1$burial2_kmol_y[12:2412]
str(burial2_kmol_y)
plot(depo_Phg_kmol_y)
plot(hgT_inflow_kmol_y)
plot(diffusion_kmol_y)
plot(river_hg_kmol_y)

Output_terms<-(evasione_kmol_y+depo_Phg_kmol_y+hgT_outflow_kmol_y)
Input_terms<-(hgT_inflow_kmol_y +river_hg_kmol_y +atm_hg_kmol_y + diffusion_kmol_y)
Output_terms[2:164]; summary(Output_terms)


diff<-Input_terms-Output_terms
cumulative_diff_kmol<-cumsum(diff)
summary(cumulative_diff_kmol)

cum_in<-cumsum(Input_terms)
cum_out<-cumsum(Output_terms)
summary(cum_in)
summary(cum_out)

#setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/BlackSea_IIDraft/submission_figures")
str(atm_hg_kmol_y)
tiff('Fig.7A_Hg.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(5,5,4,1), bty='n') 
plot(ax2,atm_hg_kmol_y, col="cyan3", type="l",  ylim=c(-40,40), 
     main=expression("Hg fluxes to the Black Sea"), ylab= " ", 
     xlab= "years",  lwd=1, cex.axis=2, cex.lab=2,cex.main=2.3)
#axis(1,at=c(1850,1900,1950,2000,2050),labels=T, cex.axis=2.5)
abline(v=2013, lty=2, col='gray60', lwd=2)
text(2025,38,'2013',col='gray60', cex=1.9)
par(new=TRUE)
plot(ax2,river_hg_kmol_y, col="darkgreen", type="l", 
     xaxt='n',yaxt='n',ylim=c(-40,40), 
     ylab= " ",xlab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,hgT_inflow_kmol_y, col="darkblue", type="l", 
     xaxt='n',yaxt='n',
     ylim=c(-40,40), ylab= " ", xlab= " ",  lwd=2)
par(new=TRUE)
plot(ax2,diffusion_kmol_y, col="#cdcd00", type="l", 
       xaxt='n',yaxt='n',
     ylim=c(-40,40), ylab= " ", xlab= " ",  lwd=2)
par(new=TRUE)
plot(ax2, Input_terms, col="black", type="l", lty=2, 
       xaxt='n',yaxt='n',
     ylim=c(-40,40), ylab= " ", xlab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,-evasione_kmol_y, col="cyan4", type="l", xlab= " ", 
       ylim=c(-40,40), xaxt='n',yaxt='n',
     main=" ", ylab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,-depo_Phg_kmol_y, col="orange", type="l", xlab= " ", 
       ylim=c(-40,40), xaxt='n',yaxt='n',
     ylab= " ",  lwd=1)
par(new=TRUE)
plot(  -hgT_outflow_kmol_y, col="darkblue", type="l", 
     ylim=c(-40,40),xlab= " ",xaxt='n',yaxt='n',
     ylab= " ",  lwd=2)
par(new=TRUE)
plot(ax2,-Output_terms, col="black", type="l", lty=2, 
       ylim=c(-40,40), xaxt='n',yaxt='n',
     xlab= " ", ylab= "",  lwd=1)

mtext(expression(paste('kmol y'^-1)), 2, at= 0, line=2.6, cex=2)

text(2000.0,10,'Atmospheric deposition',col='cyan3', cex=1.9)
text(1975,20,' Rivers \n load',col='darkgreen', cex=1.9)
#text(1980,12,'Inflow from Marmara Sea',col='darkblue')
text(1850+170-20,2.5,'Sediment Diffusion',col='#b8b800', cex=1.9)
text(1850+60-20,36,'Input',col=1, cex=2.5)

text(1850+170,-10.5,'Evasion',col='cyan4',cex=1.9)
text(170+1850,-17,'Deposition to \n the sediment',col='orange',cex=1.9)
text(140+1850,0,'Mediterranean Inflow - Outflow',col='darkblue', cex=1.9)
text(50+1850,-22,'Output',col=1,cex=2.5)

dev.off()






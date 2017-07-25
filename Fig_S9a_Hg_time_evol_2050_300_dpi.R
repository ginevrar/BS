# 164 anni per 12 mesi = 1968
setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e_morehg")

ax<-seq(1851,2050, by=1)
a<-c(2.1,2,3)
ax2<-(seq(1850,2050, by=.08291874))
str(ax2)
ax3<-(seq(1850,2050, by=1))
#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=","); str(ore1)

hgT_inflow_kmol_y     <- ore1$hgT_inflow_kmol_y[0:2412]; str(hgT_inflow_kmol_y)
river_hg_kmol_y       <- ore1$river_hg_kmol_y[0:2412]
atm_hg_kmol_y         <- ore1$atm_hg_kmol_y[0:2412]
evasione_kmol_y     <-ore1$evasione_kmol_y[1:2412];str(diffusion_kmol_y)
ore1$evasione_kmol_y[0:12]
diffusion_kmol_y    <-ore1$diffusion_kmol_y[1:2412]
hgT_outflow_kmol_y  <-ore1$hgT_outflow_kmol_y[1:2412]
burial1_kmol_y      <-ore1$burial1_kmol_y[1:2412]
depo_Phg_kmol_y     <-ore1$depo_Phg_kmol_y[1:2412]
burial2_kmol_y      <- ore1$burial2_kmol_y[1:2412]
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

str(ax2)
mean(atm_hg_kmol_y[1957:1968])
empty_v<-rep('NA',2412)
empty_v[1957]<- 5.2739

empty_v2<-rep('NA',2412)
empty_v2[1957]<-24.35274
mean(river_hg_kmol_y[1957:1968])

mean(hgT_inflow_kmol_y[1957:1968])
empty_v3<-rep('NA',2412)
empty_v3[1957]<- 0.8849407

mean(diffusion_kmol_y[1957:1968])
empty_v4<-rep('NA',2412)
empty_v4[1957]<- 2.177538

mean(Input_terms[1957:1968])
empty_v5<-rep('NA',2412)
empty_v5[1957]<- 32.68912

mean(evasione_kmol_y[1957:1968])
empty_v6<-rep('NA',2412)
empty_v6[1957]<- -5.522279

mean(depo_Phg_kmol_y[1957:1968])
empty_v7<-rep('NA',2412)
empty_v7[1957]<- -22.81346

mean(hgT_outflow_kmol_y[1957:1968])
empty_v8<-rep('NA',2412)
empty_v8[1957]<--1.501057

mean(Output_terms[1957:1968])
empty_v9<-rep('NA',2412)
empty_v9[1957]<--29.8368

#setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/BlackSea_IIDraft/submission_figures")
str(atm_hg_kmol_y)

tiff('Fig.7A_Hg.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)

par(mfrow=c(1,1), mar=c(5,5,4,1), bty='n') 

plot(ax2,atm_hg_kmol_y, col="cyan3", type="l",  ylim=c(-45,45), 
     main=expression("Hg fluxes to the Black Sea"), ylab= " ", 
     xlab= " ",  lwd=1, cex.axis=2, cex.lab=2,cex.main=2.3)
par(new=T)
plot(ax2,empty_v, type='p', xlab= " ", ylab= " ", pch=23, cex=2.5, xaxt='n',yaxt='n', ylim=c(-45,45), bg='cyan4',col='black')
#axis(1,at=c(1850,1900,1950,2000,2050),labels=T, cex.axis=2.5)
#abline(v=2013, lty=2, col='gray60', lwd=2)
#text(2025,38,'2013',col='gray60', cex=1.9)
par(new=TRUE)
plot(ax2,river_hg_kmol_y, col="chartreuse3", type="l", 
     xaxt='n',yaxt='n',ylim=c(-45,45), 
     ylab= " ",xlab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v2, bg='chartreuse4' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.5, xaxt='n',yaxt='n', ylim=c(-45,45))
par(new=TRUE)
plot(ax2,hgT_inflow_kmol_y, col="darkblue", type="l", 
     xaxt='n',yaxt='n',
     ylim=c(-45,45), ylab= " ", xlab= " ",  lwd=2)
par(new=TRUE)
plot(ax2,empty_v3, bg='cornflowerblue' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.5, xaxt='n',yaxt='n', ylim=c(-45,45))
par(new=TRUE)
plot(ax2,diffusion_kmol_y, col="darkgoldenrod1", type="l", 
       xaxt='n',yaxt='n',
     ylim=c(-45,45), ylab= " ", xlab= " ",  lwd=2)
par(new=TRUE)
plot(ax2,empty_v4, bg='darkgoldenrod' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.5, xaxt='n',yaxt='n', ylim=c(-45,45))
par(new=TRUE)
plot(ax2, Input_terms, col="black", type="l", lty=2, 
       xaxt='n',yaxt='n',
     ylim=c(-45,45), ylab= " ", xlab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v5, bg='grey90' ,col='darkgrey',type='p', xlab= " ", ylab= " ", pch=23, cex=3, xaxt='n',yaxt='n', ylim=c(-45,45))
par(new=TRUE)
plot(ax2,-evasione_kmol_y, col="cyan4", type="l", xlab= " ", 
       ylim=c(-45,45), xaxt='n',yaxt='n',
     main=" ", ylab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v6, bg='cyan4' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.5, xaxt='n',yaxt='n', ylim=c(-45,45))
par(new=TRUE)
plot(ax2,-depo_Phg_kmol_y, col="orange", type="l", xlab= " ", 
       ylim=c(-45,45), xaxt='n',yaxt='n',
     ylab= " ",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v7, bg='darkorange' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.5, xaxt='n',yaxt='n', ylim=c(-45,45))
par(new=TRUE)
plot(ax2, -hgT_outflow_kmol_y, col="darkblue", type="l", 
     ylim=c(-45,45),xlab= " ",xaxt='n',yaxt='n',
     ylab= " ",  lwd=2)
par(new=TRUE)
plot(ax2,empty_v8, bg=' cornflowerblue' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.5, xaxt='n',yaxt='n', ylim=c(-45,45))
par(new=TRUE)
plot(ax2,-Output_terms, col="black", type="l", lty=2, 
       ylim=c(-45,45), xaxt='n',yaxt='n',
     xlab= " ", ylab= "",  lwd=1)
par(new=TRUE)
plot(ax2,empty_v9, bg='grey90' ,col='darkgrey',type='p', xlab= " ", ylab= " ", pch=23, cex=3, xaxt='n',yaxt='n', ylim=c(-45,45))

mtext(expression(paste('kmol y'^-1)), 2, at= 0, line=2.6, cex=2)

text(2000.0,10,'Atmospheric deposition',col='cyan4', cex=1.7)
text(1975,20,' River \n load',col='chartreuse4', cex=1.7)
#text(1980,12,'Inflow from Marmara Sea',col='darkblue')
text(1950,3,'Sediment Diffusion',col='darkgoldenrod', cex=1.7)
text(1850+60-20,36,'Input',col=1, cex=2)

text(1850+170,-10.5,'Evasion',col='cyan4',cex=1.7)
text(170+1850,-17,'Deposition to \n the sediment',col='orange',cex=1.7)
text(130+1850,-.5,'Inflow - Outflow',col='cornflowerblue', cex=1.5)
text(50+1850,-22,'Output',col=1,cex=2)

dev.off()






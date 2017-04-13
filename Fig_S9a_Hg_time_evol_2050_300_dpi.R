# 164 anni per 12 mesi = 1968
setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")


ax<-seq(1851,2050, by=1)
#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=","); str(ore1)

hgT_inflow_kmol_y     <- ore1$hgT_inflow_kmol_y; str(hgT_inflow_kmol_y)
river_hg_kmol_y       <- ore1$river_hg_kmol_y
atm_hg_kmol_y         <- ore1$atm_hg_kmol_y
evasione_kmol_y     <-ore1$evasione_kmol_y
diffusion_kmol_y    <-ore1$diffusion_kmol_y
hgT_outflow_kmol_y  <-ore1$hgT_outflow_kmol_y
burial1_kmol_y      <-ore1$burial1_kmol_y
depo_Phg_kmol_y     <-ore1$depo_Phg_kmol_y
burial2_kmol_y      <- ore1$burial2_kmol_y

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

setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/BlackSea_IIDraft/submission_figures")

tiff('Fig.7A_Hg.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1))
plot(atm_hg_kmol_y, col="cyan3", type="l",  ylim=c(-35,40), 
     main=expression("Hg fluxes to the Black Sea"), ylab= " ", 
     xlab= " ",  lwd=1, 
     cex.axis=1.4, cex.lab=1.4,cex.main=1.5)
par(new=TRUE)
plot(river_hg_kmol_y, col="darkgreen", type="l", 
     xaxt='n',yaxt='n',ylim=c(-30,40), 
     ylab= " ",xlab= " ",  lwd=1)
par(new=TRUE)
plot(hgT_inflow_kmol_y, col="darkblue", type="l", 
     xaxt='n',yaxt='n',
     ylim=c(-35,40), ylab= " ", xlab= " ",  lwd=2)
par(new=TRUE)
plot(  diffusion_kmol_y, col="#cdcd00", type="l", 
       xaxt='n',yaxt='n',
     ylim=c(-35,40), ylab= " ", xlab= " ",  lwd=2)
par(new=TRUE)
plot(  Input_terms, col="black", type="l", lty=2, 
       xaxt='n',yaxt='n',
     ylim=c(-35,40), ylab= " ", xlab= " ",  lwd=1)
text(900,8,'Atmospheric deposition',col='cyan3', cex=1.5)
text(1520,20,'Rivers load',col='darkgreen', cex=1.5)
text(800,36,'Total Input',col=1, cex=2)
#text(1980,12,'Inflow from Marmara Sea',col='darkblue')
text(1500,2.5,'Diffusion from sediment',col='#b8b800', cex=1.5)
#legend(1850,50, pch=19, legend=c("Atmospheric deposition","Inflow from Marmara Sea",
#                               "Rivers load","Pore-water diffusion","Total Input"), 
#col=c("cyan3", "blue","darkgreen","springgreen3", "black"))
par(new=TRUE)
#dev.new(height=100,width=200)
#par(mfrow=c(1,1))
plot( -evasione_kmol_y, col="cyan4", type="l", xlab= " ", 
       ylim=c(-35,40), xaxt='n',yaxt='n',
     main=" ", ylab= " ",  lwd=1)
par(new=TRUE)
plot( -depo_Phg_kmol_y, col="orange", type="l", xlab= " ", 
       ylim=c(-35,40), xaxt='n',yaxt='n',
     ylab= " ",  lwd=1)
par(new=TRUE)
plot(  -hgT_outflow_kmol_y, col="darkblue", type="l", 
     ylim=c(-35,40),xlab= " ",xaxt='n',yaxt='n',
     ylab= " ",  lwd=2)
par(new=TRUE)
plot(-Output_terms, col="black", type="l", lty=2, 
       ylim=c(-35,40), xaxt='n',yaxt='n',
     xlab= " ", ylab= "",  lwd=1)
mtext(expression(paste('kmol y'^-1)), 2, line=2, cex=1.4)

text(1920,-10,'Evasion',col='cyan4',cex=1.5)
text(2100,-18,'Deposition to \n the sediment',col='orange',cex=1.5)
text(800,-22,'Total Output',col=1,cex=2)
text(1980,0,'Marmara Sea In - Out',col='darkblue', cex=1.4)
#text(1920,2.8,'Diffusion from sediment',col='springgreen3')
#legend(1850,-22, col=c("cyan3","blue","orange","black"), pch=19, 
#    legend=c("Volatilization","Outflow to the Marmara Sea",
#          "Deposition to the sediment","Total Output")) 



dev.off()









str(ax)
dev.new()
par(mfrow=c(1,1))
plot( Output_terms,  col="palegreen2",
     type="l",ylim=c(0,50), main="HgT input and output to the Black Sea Water",
     ylab=" ", xlab=" ")
par(new=TRUE)
plot( Input_terms,col="tomato", type="l",ylim=c(0,50), ylab="kmol/y", xlab=" ")
par(new=TRUE)
plot( diff,col="plum", type="l",ylim=c(0,50), ylab="kmol/y", xlab=" ")
abline(h=0,lty=2, col="gray54")
legend("topleft",legend=c("Input","Output","Difference"),
       col=c("tomato","palegreen2","plum"),pch=19)

ax2<-(seq(1850,2013,by=1))
str(ax2)
dev.new()
par(mfrow=c(1,1))
plot(ax2, cumulative_diff_kmol, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="violetred1",type="l", lwd=1, ylim=c(0,4000))
par(new=TRUE)
plot(ax2, cum_in, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="tomato",type="l",lwd="2", ylim=c(0,4000))
par(new=TRUE)
plot(ax2, cum_out, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="palegreen2",type="l",lwd="2", ylim=c(0,4000))
#Output_terms     

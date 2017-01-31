# 164 anni per 12 mesi = 1968
setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")

#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output1", header=TRUE, sep=","); str(ore1)

hgT_inflow_kmol_y     <- ore1$hgT_inflow_kmol_y_media 
river_hg_kmol_y       <- ore1$river_hg_kmol_y_media
atm_hg_kmol_y         <- ore1$atm_hg_kmol_y_media
evasione_kmol_y     <-ore1$evasione_kmol_y_media
diffusion_kmol_y    <-ore1$diffusion_kmol_y_media
hgT_outflow_kmol_y  <-ore1$hgT_outflow_kmol_y_media
burial1_kmol_y      <-ore1$burial1_kmol_y_media
depo_Phg_kmol_y     <-ore1$depo_Phg_kmol_y_media
burial2_kmol_y      <- ore1$burial2_kmol_y_media
plot(depo_Phg_kmol_y)
plot(hgT_inflow_kmol_y)
plot(diffusion_kmol_y)
plot(river_hg_kmol_y)

Output_terms<-(evasione_kmol_y+depo_Phg_kmol_y+hgT_outflow_kmol_y)
Input_terms<-(hgT_inflow_kmol_y +river_hg_kmol_y +atm_hg_kmol_y + diffusion_kmol_y)

Output_terms[2:164]; summary(Output_terms)
Input_terms[2:164]

diff<-Input_terms-Output_terms
cumulative_diff_kmol<-cumsum(diff)
summary(cumulative_diff_kmol)

cum_in<-cumsum(Input_terms)
cum_out<-cumsum(Output_terms)
summary(cum_in)
summary(cum_out)



dev.new(height=100,width=200)
par(mfrow=c(1,1))
plot(ax,atm_hg_kmol_y, col="cyan3", type="l",  ylim=c(-40,40), 
     main="Input and Output of Hg to the water", ylab= " ", 
     xlab= " ", lwd=2)
par(new=TRUE)
plot(ax, river_hg_kmol_y, col="darkgreen", type="l",  ylim=c(-40,40), 
     ylab= " ",xlab= " ", lwd=2)
par(new=TRUE)
plot(ax, hgT_inflow_kmol_y, col="darkblue", type="l",  
     ylim=c(-40,40), ylab= " ", xlab= " ", lwd=2)
par(new=TRUE)
plot(ax, diffusion_kmol_y, col="springgreen3", type="l", 
     ylim=c(-40,40), ylab= " ", xlab= " ", lwd=2)
par(new=TRUE)
plot(ax, Input_terms, col="black", type="l", lty=2, 
     ylim=c(-40,40), ylab= " ", xlab= " ", lwd=2)
text(1906,7,'Atmospheric deposition',col='cyan3')
text(1975,25,'Rivers load',col='darkgreen')
text(1940,36,'Total Input',col=1)
text(1980,12,'Inflow from Marmara Sea',col='darkblue')
text(1970,8,'Diffusion from sediment',col='springgreen3')
#legend(1850,50, pch=19, legend=c("Atmospheric deposition","Inflow from Marmara Sea",
#                               "Rivers load","Pore-water diffusion","Total Input"), 
#col=c("cyan3", "blue","darkgreen","springgreen3", "black"))
par(new=TRUE)
#dev.new(height=100,width=200)
#par(mfrow=c(1,1))
plot(ax, -evasione_kmol_y, col="cyan4", type="l", xlab= " ", ylim=c(-40,40), 
     main=" ", ylab= "kmol/y", lwd=2)
par(new=TRUE)
plot(ax, -depo_Phg_kmol_y, col="orange", type="l", xlab= " ", ylim=c(-40,40), 
     ylab= " ", lwd=2)
par(new=TRUE)
plot(ax, -hgT_outflow_kmol_y, col="royalblue", type="l", 
     ylim=c(-40,40),xlab= " ",
     ylab= " ", lwd=2)
par(new=TRUE)
plot(ax, -Output_terms, col="black", type="l", lty=2, ylim=c(-40,40), 
     xlab= " ", ylab= "", lwd=2)
text(1930,-6,'Evasion',col='cyan4')
text(1999,-14,'Deposition to \n the sediment',col='orange')
text(1900,-18,'Total Output',col=1)
text(1980,-2.6,'Outflow to Marmara Sea',col='royalblue')
#text(1920,2.8,'Diffusion from sediment',col='springgreen3')
#legend(1850,-22, col=c("cyan3","blue","orange","black"), pch=19, 
#    legend=c("Volatilization","Outflow to the Marmara Sea",
#          "Deposition to the sediment","Total Output")) 







ax<-seq(1850,2013, by=1)
str(ax)
dev.new()
par(mfrow=c(1,1))
plot(ax,Output_terms,  col="palegreen2",
     type="l",ylim=c(0,50), main="HgT input and output to the Black Sea Water",
     ylab="kmol/y", xlab=" ")
par(new=TRUE)
plot(ax,Input_terms,col="tomato", type="l",ylim=c(0,50), ylab="kmol/y", xlab=" ")
par(new=TRUE)
plot(ax,diff,col="plum", type="l",ylim=c(0,50), ylab="kmol/y", xlab=" ")
abline(h=0,lty=2, col="gray54")
legend("topleft",legend=c("Input","Output","Difference"),
       col=c("tomato","palegreen2","plum"),pch=19)

ax2<-(seq(1850,2013,by=1))
str(ax2)
dev.new()
par(mfrow=c(1,1))
plot(ax2, cumulative_diff_kmol, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="violetred1",type="l",lwd=2, ylim=c(0,4000))
par(new=TRUE)
plot(ax2, cum_in, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="tomato",type="l",lwd="2", ylim=c(0,4000))
par(new=TRUE)
plot(ax2, cum_out, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="palegreen2",type="l",lwd="2", ylim=c(0,4000))
#Output_terms     

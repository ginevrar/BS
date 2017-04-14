
setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")

#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output_long_mehg_1_2050", header=TRUE, sep=","); str(ore1)
str(ore1) #2412 

ax<-seq(1851,2050, by=1)
a<-c(2.1,2,3)
ax2<-(seq(1850,2050, by=.0833))
str(ax2)
ax3<-(seq(1850,2050, by=1))


met<-read.csv('mehg_prodotto_kmol_y_2050.csv')
met<-met[12:2412]
str(met)
diffusion_kmol_y<-ore1$diffusion_kmol_y[12:2412]
str(diffusion_kmol_y)

mehgT_outflow_kmol_y<-ore1$mehgT_outflow_kmol_y[12:2412]
depo_Pmehg_kmol_y<-ore1$depo_Pmehg_kmol_y[12:2412]

burial2_kmol_y<-ore1$burial2_kmol_y[12:2412]

mehgT_inflow_kmol_y<-ore1$mehgT_inflow_kmol_y[12:2412]
river_mehg_kmol_y<-ore1$river_mehg_kmol_y[12:2412]

mehg_prodotto_kmol_y<-rowSums(met[2:4])

Output_terms<-(depo_Pmehg_kmol_y+mehgT_outflow_kmol_y)
Input_terms <-(mehgT_inflow_kmol_y + river_mehg_kmol_y +
                 diffusion_kmol_y+
                 mehg_prodotto_kmol_y)
str(mehg_prodotto_kmol_y)
Output_terms[2:164]; 
Input_terms[2:164];
summary(Output_terms);summary(Input_terms)
diff<-Input_terms-Output_terms
ax<-seq(1850,2013, by=1)
str(ax)


cum_in<-cumsum(Input_terms)
cum_out<-cumsum(Output_terms)
summary(cum_in)
summary(cum_out)

setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/BlackSea_IIDraft/submission_figures")

tiff('Fig.7B_MeHg.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(4.5,5,4,1),bty='n')

plot(ax2,river_mehg_kmol_y, col="darkgreen", type="l",
       main=expression("MeHg fluxes to the Black Sea"),
      cex.axis=2.5, cex.lab=2.3,cex.main=2.5,
       ylab= " ", ylim=c(-7,7), xlab= " ", lwd=1, lty=1)
par(new=TRUE)
plot (ax2, mehgT_inflow_kmol_y, col="darkblue", lwd=1, type="l", 
     ylim=c(-7,7), ylab= " ", yaxt='n', xaxt='n',xlab= " ", lty=1)
par(new=TRUE)
plot (ax2, diffusion_kmol_y, col="#cdcd00", lwd=1, type="l",  ylim=c(-7,7), ylab= " ",
     yaxt='n', xaxt='n',xlab= " ")
par(new=TRUE)
plot (ax2,Input_terms, col="black", type="l", lty=2, lwd=1, ylim=c(-7,7), ylab= " ",
     yaxt='n', xaxt='n',xlab= " ")
par(new=TRUE)
plot (ax2,mehg_prodotto_kmol_y, col="hotpink3", type="l", lty=1, 
     lwd=1, ylim=c(-7,7), ylab= " ", yaxt='n', xaxt='n',    xlab= " ")
par(new=TRUE)  
plot (ax2,-depo_Pmehg_kmol_y,  col="orange",ylab=' ',
     type="l", xlab= " ",yaxt='n', xaxt='n', ylim=c(-7,7), lwd=1)
par(new=TRUE)
plot (ax2,-mehgT_outflow_kmol_y, col="darkblue", type="l",yaxt='n', xaxt='n',
     lwd=1, ylim=c(-7,7),xlab= " ", ylab= " ")
par(new=TRUE)
plot (ax2,-Output_terms, col="black", type="l", lty=2, yaxt='n', xaxt='n',
     ylim=c(-7,7), xlab= " ", ylab= "", lwd=1)
#legend(1850,0.22, col=c("blue","orange","black"), pch=19, 
#legend=c("Outflow to the Marmara Sea",
#          "Deposition to the sediment","Total Output")) 
mtext(expression(paste('kmol y'^-1)), 2, line=2, cex=2.3)

text(1850+80,6,'Total input', col=1,cex=2)
text(1850+155,2.7,'Net \n water column \n methylation', cex=1.5, col='hotpink3')
text(190+850,-.4,'Marmara Sea In-Out',cex=1.5, col='darkblue')
text(1850+140,.53,'Diffusion from sediment',cex=1.5, col='#cdcd00')
text(200+1850,1.5,'Rivers load', cex=1.5,col='darkgreen')
text(80+1850,-4,'Total output', col=1,cex=2)
text(199+1850,-3.5,'Deposition to \n the sediment', cex=1.5,col='orange')
##
dev.off()




dev.new()
par(mfrow=c(1,1))
plot (Output_terms,  col="#5aae61",
      type="l",ylim=c(0,2.5), main="MeHgT input and output to the Black Sea Water",
      ylab="kmol/y", xlab=" ", lwd=3, lty=5)
par(new=TRUE)
plot (Input_terms,col="#762a83",lwd=3, lty=2, type="l",ylim=c(0,2.5), ylab="kmol/y", xlab=" ")
par(new=TRUE)
plot (diff,col="#fdb863", type="l",lwd=3, lty=4,ylim=c(0,2.5), ylab="kmol/y", xlab=" ")
abline(h=0,lty=3, col="lightgray")
legend(1850,2.4,legend=c("Input","Output","Difference"), box.col="lightgray",
       col=c("#762a83","#5aae61","#fdb863"),pch=19, lty=c(2,5,4))





cumulative_diff_kmol<-cumsum(diff)
summary(cumulative_diff_kmol)


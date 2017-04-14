
setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")

#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output_long_mehg_1_2050", header=TRUE, sep=","); str(ore1)
str(ore1) #2412 
met<-read.csv('mehg_prodotto_kmol_y_2050.csv')

diffusion_kmol_y<-ore1$diffusion_kmol_y
str(diffusion_kmol_y)

mehgT_outflow_kmol_y<-ore1$mehgT_outflow_kmol_y
depo_Pmehg_kmol_y<-ore1$depo_Pmehg_kmol_y

burial2_kmol_y<-ore1$burial2_kmol_y

mehgT_inflow_kmol_y<-ore1$mehgT_inflow_kmol_y 
river_mehg_kmol_y<-ore1$river_mehg_kmol_y 

mehg_prodotto_kmol_y<-rowSums(met[2:4])

Output_terms<-(depo_Pmehg_kmol_y+mehgT_outflow_kmol_y)
Input_terms <-(mehgT_inflow_kmol_y + river_mehg_kmol_y +
                 diffusion_kmol_y+
                 mehg_prodotto_kmol_y)

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
par(mfrow=c(1,1))

plot(river_mehg_kmol_y, col="darkgreen", type="l",
       main=expression("MeHg fluxes to the Black Sea"),
      cex.axis=1.6, cex.lab=1.5,cex.main=1.5,
       ylab= " ", ylim=c(-7,7), xlab= " ", lwd=1, lty=1)
par(new=TRUE)
plot ( mehgT_inflow_kmol_y, col="darkblue", lwd=1, type="l", 
     ylim=c(-7,7), ylab= " ", yaxt='n', xaxt='n',xlab= " ", lty=1)
par(new=TRUE)
plot ( diffusion_kmol_y, col="#cdcd00", lwd=1, type="l",  ylim=c(-7,7), ylab= " ",
     yaxt='n', xaxt='n',xlab= " ")
par(new=TRUE)
plot ( Input_terms, col="black", type="l", lty=2, lwd=1, ylim=c(-7,7), ylab= " ",
     yaxt='n', xaxt='n',xlab= " ")
par(new=TRUE)
plot ( mehg_prodotto_kmol_y, col="hotpink3", type="l", lty=1, 
     lwd=1, ylim=c(-7,7), ylab= " ", yaxt='n', xaxt='n',    xlab= " ")
par(new=TRUE)  
plot (-depo_Pmehg_kmol_y,  col="orange",ylab=' ',
     type="l", xlab= " ",yaxt='n', xaxt='n', ylim=c(-7,7), lwd=1)
par(new=TRUE)
plot (-mehgT_outflow_kmol_y, col="darkblue", type="l",yaxt='n', xaxt='n',
     lwd=1, ylim=c(-7,7),xlab= " ", ylab= " ")
par(new=TRUE)
plot ( -Output_terms, col="black", type="l", lty=2, yaxt='n', xaxt='n',
     ylim=c(-7,7), xlab= " ", ylab= "", lwd=1)
#legend(1850,0.22, col=c("blue","orange","black"), pch=19, 
#legend=c("Outflow to the Marmara Sea",
#          "Deposition to the sediment","Total Output")) 
mtext(expression(paste('kmol y'^-1)), 2, line=2, cex=1.6)

text(800,6,'Total input', col=1,cex=2)
text(1550,2.7,'Net \n water column \n methylation', cex=1.5, col='hotpink3')
text(1700,-.4,'Mediterranean Inflow - Outflow',cex=1.5, col='darkblue')
text(1600,.53,'Diffusion from sediment',cex=1.5, col='#cdcd00')
text(2000,1.5,'Rivers load', cex=1.5,col='darkgreen')
text(800,-4,'Total output', col=1,cex=2)
text(1990,-3.5,'Deposition to \n the sediment', cex=1.5,col='orange')
#
dev.off()



cumulative_diff_kmol<-cumsum(diff)
summary(cumulative_diff_kmol)


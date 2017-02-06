

#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output_long_mehg_1_2050", header=TRUE, sep=","); str(ore1)
View(ore1)
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


dev.new()
par(mfrow=c(1,1))
plot (river_mehg_kmol_y, col="darkgreen", type="l",
       main=expression("Input and Output of MeHg to the water"),
      cex.axis=1.4, cex.lab=1.4,cex.main=1.5,
       ylab= "kmol/y", 
     ylim=c(-7,7), 
     xlab= " ", lwd=1, lty=1)
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
text(1000,6,'Total input', col=1,cex=1.2)
text(1500,2.6,'Internal \n net production', col='hotpink3')
text(1920,-.4,'Marmara Sea In-Out', col='darkblue')
text(1400,.53,'Diffusion from sediment', col='#cdcd00')
text(2200,1.5,'Rivers load', col='darkgreen')
text(1000,-3.2,'Total output', col=1,cex=1.2)
text(1990,-3.5,'Deposition to \n the sediment', col='orange')
#
#
#





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


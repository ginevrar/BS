
setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")
demtilato<-read.csv(file='demetilato.csv')

#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output_mehg_1", header=TRUE, sep=","); str(ore1)

diffusion_kmol_y<-cbind(ore1$diffusion_kmol_y_media)

mehgT_outflow_kmol_y<-cbind(ore1$mehgT_outflow_kmol_y_media)

depo_Pmehg_kmol_y<-cbind(ore1$depo_Pmehg_kmol_y_media)

burial2_kmol_y<-cbind(ore1$burial2_kmol_y_media)

mehgT_inflow_kmol_y<-ore1$mehgT_inflow_kmol_y_media
river_mehg_kmol_y<-ore1$river_mehg_kmol_y_media

mehg_prodotto_kmol_y<-ore1$mehg_prodotto_kmol_y_media
Output_terms<-(depo_Pmehg_kmol_y+mehgT_outflow_kmol_y-diffusion_kmol_y)
Input_terms <-(mehgT_inflow_kmol_y + river_mehg_kmol_y +mehg_prodotto_kmol_y)

Output_terms[2:164]; 
Input_terms[2:164];
summary(Output_terms);summary(Input_terms)
diff<-Input_terms-Output_terms
ax<-seq(1850,2013, by=1)
str(ax)
dev.new()
par(mfrow=c(1,1))
plot(ax,Output_terms,  col="#5aae61",
     type="l",ylim=c(0,2.5), main="MeHgT input and output to the Black Sea Water",
     ylab="kmol/y", xlab=" ", lwd=3, lty=5)
par(new=TRUE)
plot(ax,Input_terms,col="#762a83",lwd=3, lty=2, type="l",ylim=c(0,2.5), ylab="kmol/y", xlab=" ")
par(new=TRUE)
plot(ax,diff,col="#fdb863", type="l",lwd=3, lty=4,ylim=c(0,2.5), ylab="kmol/y", xlab=" ")
abline(h=0,lty=3, col="lightgray")
legend(1850,2.4,legend=c("Input","Output","Difference"), box.col="lightgray",
       col=c("#762a83","#5aae61","#fdb863"),pch=19, lty=c(2,5,4))

cumulative_diff_kmol<-cumsum(diff)
summary(cumulative_diff_kmol)

cum_in<-cumsum(Input_terms)
cum_out<-cumsum(Output_terms)
summary(cum_in)
summary(cum_out)

ax2<-(seq(1850,2013,by=1))
str(ax2)
dev.new()
par(mfrow=c(1,1))
plot(ax2, cumulative_diff_kmol, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="violetred1",type="b",lwd="2", ylim=c(0,250))
par(new=TRUE)
plot(ax2, cum_in, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="tomato",type="b",lwd="2", ylim=c(0,250))
par(new=TRUE)
plot(ax2, cum_out, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="palegreen2",type="b",lwd="2", ylim=c(0,250))
#Output_terms        evasione_kmol_y    Phg_deposition_kmol_y  hgT_outflow_kmol_y
#Input_terms         river_mehg_kmol_y    atm_hg_kmol_y        hgT_inflow_kmol_y)
dev.new()
par(mfrow=c(1,1))
plot(ax2, cumulative_diff_kmol, main="Cumulative net input to the Black Sea Water",
     ylab="kmol", xlab=" ", col="violetred1",type="b",lwd="2", ylim=c(0,380))

Output_terms<-(depo_Pmehg_kmol_y+mehgT_outflow_kmol_y)
Input_terms<-(mehgT_inflow_kmol_y +river_mehg_kmol_y  +mehg_prodotto_kmol_y+ diffusion_kmol_y)

dev.new(height=100,width=200)
par(mfrow=c(1,1))
plot(ax, river_mehg_kmol_y, col="darkgreen", type="l",  ylim=c(-7,7), ylab= " ",
     xlab= " ", lwd=2, lty=1)
par(new=TRUE)
plot(ax, mehgT_inflow_kmol_y, col="darkblue", lwd=2, type="l", 
     ylim=c(-7,7), ylab= " ",     xlab= " ", lty=1)
par(new=TRUE)
plot(ax, diffusion_kmol_y, col="springgreen3", lwd=2, type="l",  ylim=c(-7,7), ylab= " ",
     xlab= " ")
par(new=TRUE)
plot(ax, Input_terms, col="black", type="l", lty=2, lwd=2, ylim=c(-7,7), ylab= " ",
     xlab= " ")
par(new=TRUE)
plot(ax, mehg_prodotto_kmol_y, col="hotpink3", type="l", lty=1, 
     lwd=2, ylim=c(-7,7), ylab= " ",     xlab= " ")
#&legend(1850,2.8, pch=19,box.col="lightgray",  legend=c("Inflow from Marmara Sea","Rivers load","Pore-water diffusion","Total Input"), 
#col=c( "blue","darkgreen","springgreen3", "black"))
#dev.new(height=100,width=200)
#par(mfrow=c(1,1))
par(new=TRUE)
plot(ax, -depo_Pmehg_kmol_y, main="Input and Output of MeHg to the water", col="orange",
     type="l", xlab= " ", ylim=c(-7,7), ylab= "kmol/y", lwd=2)
par(new=TRUE)
plot(ax, -mehgT_outflow_kmol_y, col="royalblue", type="l",lwd=2, ylim=c(-7,7),xlab= " ", ylab= "kmol/y")
par(new=TRUE)
plot(ax, -Output_terms, col="black", type="l", lty=2, ylim=c(-7,7), xlab= " ", ylab= "", lwd=2)
#legend(1850,0.22, col=c("blue","orange","black"), pch=19, 
#legend=c("Outflow to the Marmara Sea",
#          "Deposition to the sediment","Total Output")) 
text(1940,6,'Total input', col=1)
text(1975,3.5,'Internal \n net production', col='hotpink3')
text(1920,.4,'Inflow from Marmara', col='darkblue')
text(1920,-.4,'Outflow from Marmara', col='royalblue')
text(1980,.8,'Diffusion from sediment', col='springgreen3')
text(1900,1.5,'Rivers load', col='darkgreen')
text(1940,-4,'Total output', col=1)
text(1990,-3,'Deposition to \n the sediment', col='orange')
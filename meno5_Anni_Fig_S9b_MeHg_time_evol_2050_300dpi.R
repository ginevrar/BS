
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e_morehg_tris")
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale/Anne1e_morehg_tris')
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_trisBO")
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2")

#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output_long_mehg_1_2050", header=TRUE, sep=","); str(ore1)
str(ore1) #2412 
met<-read.csv('mehg_prodotto_kmol_y_2050.csv');str(met)
ax2<-(seq(1850,2050, by=.08291874))
str(ax2)
2412/200 
head(met, 40)

diffusion_kmol_y<-ore1$diffusion_kmol_y
str(diffusion_kmol_y)

mehgT_outflow_kmol_y<-ore1$mehgT_outflow_kmol_y
depo_Pmehg_kmol_y<-ore1$depo_Pmehg_kmol_y

depo_Pmehg_kmol_y[1957:1968]

burial2_kmol_y<-ore1$burial2_kmol_y

plot(depo_Pmehg_kmol_y)
mehgT_inflow_kmol_y<-ore1$mehgT_inflow_kmol_y 
river_mehg_kmol_y<-ore1$river_mehg_kmol_y 

mehg_prodotto_kmol_y<-rowSums(met[2:4])

head(mehg_prodotto_kmol_y,70)
min(mehg_prodotto_kmol_y)

Output_terms<-(depo_Pmehg_kmol_y+mehgT_outflow_kmol_y-diffusion_kmol_y)
Input_terms <-(mehgT_inflow_kmol_y + river_mehg_kmol_y + mehg_prodotto_kmol_y)
str(Output_terms)
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


mean(river_mehg_kmol_y[1957:1968])
empty_v<-rep('NA',2412)
empty_v[1957]<- 1.101366

mean(mehgT_inflow_kmol_y[1957:1968])
empty_v2<-rep('NA',2412)
empty_v2[1957]<-0.06241869

mean(burial2_kmol_y[1957:1968])


u<-mean(diffusion_kmol_y[1957:1968])
empty_v3<-rep('NA',2412)
empty_v3[1957]<- u

v<-mean(Input_terms[1957:1968])
empty_v4<-rep('NA',2412)
empty_v4[1957]<- v
1.101366/v*100

v-mm

dpm/Tmo*100


mm<-mean(mehg_prodotto_kmol_y[1957:1968])
empty_v5<-rep('NA',2412)
empty_v5[1957]<- mm

dpm<-mean(depo_Pmehg_kmol_y[1957:1968])
empty_v6<-rep('NA',2412)
empty_v6[1957]<- -dpm

ouu<-mean(mehgT_outflow_kmol_y[1957:1968])
empty_v7<-rep('NA',2412)
empty_v7[1957]<--ouu
str(empty_v7)

Tmo<-mean(Output_terms[1957:1968])
empty_v9<-rep('NA',2412)
empty_v9[1957]<--Tmo

bilancio_mehg<-c(v,u,mm,dpm, ouu,Tmo)
names(bilancio_mehg)<-c('input','diff','met','depo','outflow','output')
bilancio_mehg

tiff('Fig.7B_MeHgver_195years.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)

par(mfrow=c(1,1), mar=c(5,5,4,1), bty='n') 
i<-river_mehg_kmol_y[61:2412]
str(i)
as<-seq(from=1850,to=2050, length.out=length(i))
t<-c(1850,1900,1950,2000,2050)
str(as)
u<-as
plot(as,river_mehg_kmol_y[61:2412], col="chartreuse3", type="l",
       main=expression("MeHg"[T]*" fluxes to the Black Sea"),
     cex.axis=2, cex.lab=2,cex.main=2.3, 
       ylab= " ", ylim=c(-4,7), xlab= " ", lwd=1, lty=1)
#abline(v=2013, lty=2, col='gray60', lwd=2)
#text(2035,6,'2013',col='gray60', cex=1.9)
par(new=TRUE)
plot(as,empty_v[61:2412], bg='chartreuse4' ,col='black',type='p', xlab= " ", ylab= " ", pch=23,
     cex=2.8, xaxt='n',yaxt='n', ylim=c(-4,7))
par(new=TRUE)
plot (mehgT_inflow_kmol_y[61:2412], col="darkblue", lwd=2, type="l", 
     ylim=c(-4,7), ylab= " ", yaxt='n', xaxt='n',xlab= " ", lty=1)
par(new=TRUE)
plot(as,empty_v2[61:2412], bg='darkblue' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-4,7))
par(new=TRUE)
plot (diffusion_kmol_y[61:2412], col="darkgoldenrod1", lwd=2, type="l",  ylim=c(-4,7), ylab= " ",
     yaxt='n', xaxt='n',xlab= " ")
par(new=TRUE)
plot(as,empty_v3[61:2412], bg='darkgoldenrod' ,col='black',type='p', xlab= " ", ylab= " ", 
     pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-4,7))
par(new=TRUE)
plot (Input_terms[61:2412], col="black", type="l", lty=2, lwd=1, ylim=c(-4,7), ylab= " ",
     yaxt='n', xaxt='n',xlab= " ")
par(new=TRUE)
plot(as,empty_v4[61:2412],  bg='grey90' ,col='darkgrey',type='p', xlab= " ", ylab= " ",
     pch=23, cex=4, xaxt='n',yaxt='n', ylim=c(-4,7))
par(new=TRUE)
plot (mehg_prodotto_kmol_y[61:2412], col="hotpink3", type="l", lty=1, 
     lwd=1, ylim=c(-4,7), ylab= " ", yaxt='n', xaxt='n',    xlab= " ")
par(new=TRUE)  
plot(as,empty_v5[61:2412],  bg='hotpink4' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-4,7))
par(new=TRUE)
plot (-depo_Pmehg_kmol_y[61:2412],  col="orange",ylab=' ',
     type="l", xlab= " ",yaxt='n', xaxt='n', ylim=c(-4,7), lwd=1)
par(new=TRUE)
plot(as,empty_v6[61:2412],  bg='darkorange' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-4,7))
par(new=TRUE)
plot (-mehgT_outflow_kmol_y[61:2412], col="darkblue", type="l",yaxt='n', xaxt='n', lwd=2,
      ylim=c(-4,7),xlab= " ", ylab= " ")
par(new=TRUE)
plot(as,empty_v7[61:2412],  bg='darkblue' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.8, xaxt='n',yaxt='n', ylim=c(-4,7))
par(new=TRUE)
plot ( -Output_terms[61:2412], col="black", type="l", lty=2, yaxt='n', xaxt='n',
     ylim=c(-4,7), xlab= " ", ylab= "", lwd=1)
par(new=TRUE)
plot(as,empty_v9[61:2412],  bg='grey90' ,col='darkgrey',type='p', xlab= " ", ylab= " ", pch=23, cex=4, xaxt='n',yaxt='n', ylim=c(-4,7))
par(new=TRUE)
plot(as,empty_v3[61:2412], bg='darkgoldenrod' ,col='black',type='p', xlab= " ", ylab= " ", pch=23, cex=2.5, xaxt='n',yaxt='n', ylim=c(-4,7))
mtext(expression(paste('kmol y'^-1)), 2, at= 0, line=2.6, cex=2)


#legend(1850,0.22, col=c("blue","orange","black"), pch=19, 
#legend=c("Outflow to the Marmara Sea",
#          "Deposition to the sediment","Total Output")) 
#mtext(expression(paste('kmol y'^-1)), 2, line=2, cex=1.6)

text(1900,6,'Input', col=1,cex=2.2)
text(1900,-2.5,'Output', col=1,cex=2.2)
text(2020,2,'River load', cex=1.9,col='chartreuse4')
text(2020,-1.8,'Deposition to \n the sediment', cex=1.9,col='darkorange')
text(1985,3.3,'Net \n water column \n methylation', cex=1.9, col='hotpink4')
text(2025,-.53,'Outflow',cex=1.9, col='darkblue')
text(2020,.53,'Inflow',cex=1.9, col='darkblue')
text(1950,-.53,'Sediment Diffusion ',cex=1.9, col='darkgoldenrod')

#
dev.off()



cumulative_diff_kmol<-cumsum(diff)
summary(cumulative_diff_kmol)


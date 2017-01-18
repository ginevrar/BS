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

# bILANCIO ULTIMI 3 aNNI
f_MB_depo_atm<-mean(tail(atm_hg_kmol_y,3)); plot(f_MB_depo_atm)
f_MB_river<-mean(tail(river_hg_kmol_y,3))
f_MB_inflow<-mean(tail(hgT_inflow_kmol_y,3))
f_MB_evasion<-mean(tail(evasione_kmol_y,3)); str(f_MB_evasion)
f_MB_sed_depo<-mean(tail(depo_Phg_kmol_y,3))
f_MB_outflow<-mean(tail(hgT_outflow_kmol_y,3))
f_MB_diffusion<-mean(tail(diffusion_kmol_y,3))
f_MB_burial1<-mean(tail(burial1_kmol_y,3))
f_MB_burial2<-mean(tail(burial2_kmol_y,3))


f_MB_water<-cbind(f_MB_depo_atm, f_MB_river, f_MB_inflow, f_MB_diffusion,
                  f_MB_evasion, f_MB_sed_depo, f_MB_outflow)
zero<-0
tot_in<-mean(tail(Input_terms,3))
tot_out<-mean(tail(Output_terms,3))
str(f_MB_water)
groups <- dimnames(f_MB_water)[[2]]
neg<-cbind(f_MB_sed_depo, f_MB_evasion,  f_MB_outflow, zero)
pos<-cbind(f_MB_river, f_MB_depo_atm,  f_MB_inflow, f_MB_diffusion)

#BAR PLOT figone
dev.new(height=200, width=100)
par(mar=c(0.5, 3, 2, 1), mfrow=c(1,1))  #bottom-left-top-right
plot.new()
plot.window(xlim=c(-40, 40), ylim=c(-1, 4.5))
ticks <- seq(-40, 40, 16)
y <- 1:4
h <- 0.2

lines(rep(0, 2), c(0, 4.5), col="grey")
segments(-39, y, 39, y, lty="dotted")
rect(-neg, y-h, 0, y+h, col="cyan3")
rect(0, y-h, pos, y+h, col="lightcyan2")
text(-18,1.4, expression("Hg"[P]*~"Deposition to the Sediment"))
text(-12,2.4, expression("Volatilization of Hg"^0))
text(-10,3.4, expression("Hg"[T]*~"Outflow"))
text(10,1.4,  expression("Hg"[T]*~"Rivers Load"))
text(17,2.4,  expression("Hg"^II*~"Atmospheric Deposition"))
text(7,3.4, expression("Hg"[T]*~"Inflow"))
text(8,4.4, expression("Hg"[D]*~~"Diffusion"))
title("Hg Budget in the Black Sea Water \n [kmol/y]")
par(cex.axis=1, mex=0.5)
axis(1, at=ticks, labels=(ticks), pos=0)

tw <- 1.5*strwidth("neg")
rect(-tot_out, -0.6-h, 0, -0.6+h, col="cyan3")
rect(0, -0.6-h, tot_in, -0.6+h, col="lightcyan2")
text(0, -0.6, "Output", pos=2)
text(0, -0.6, "Input", pos=4)


f_MB_sed<-cbind(f_MB_diffusion, f_MB_sed_depo, f_MB_burial2)
zero<-0
tot_in_sed<-f_MB_sed_depo
tot_out_sed<-(f_MB_diffusion+f_MB_burial2)

s_tot_in<-mean(tail(tot_in_sed,3))
s_tot_out<-mean(tail(tot_out_sed,3))
groups <- dimnames(f_MB_sed)[[2]]

neg<-cbind(f_MB_sed_depo, f_MB_evasion,  f_MB_outflow, zero)
pos<-cbind(f_MB_river, f_MB_depo_atm,  f_MB_inflow, f_MB_diffusion)

pos_sed<-cbind(f_MB_sed_depo, zero)
neg_sed<-cbind(f_MB_burial2,f_MB_diffusion)

# BAR PLOT SEDIMENTI
dev.new(height=200, width=100)
par(mar=c(0.5, 3, 2, 1))  #bottom-left-top-right
plot.new()
plot.window(xlim=c(-20, 20), ylim=c(-1, 3))
ticks <- seq(-20, 20, 8)
y <- 1:2
h <- 0.15

lines(rep(0, 2), c(0, 2.5), col="grey")  # lunghezza e colore linea centrale
segments(-20, y, 20, y, lty="dotted")  # lunghezza e stile linee orizzonatli
rect(-neg_sed, y-h, 0, y+h, col="darkorange1")
rect(0, y-h, pos_sed, y+h, col="#fdd49e")
text(10,1.3, expression("Hg"[P]*~~"Deposition to the Sediment"))
text(-6,2.3, expression("Hg"[D]*~~"Diffusion"))
text(-6,1.3, expression("Hg"[P]*~~"Burial"))
title("Hg Budget in the Black Sea Sediment \n [kmol/y]")
par(cex.axis=1, mex=0.5)
axis(1, at=ticks, labels=(ticks), pos=0)

tw <- 1.5*strwidth("neg")
rect(-s_tot_out, -0.6-h, 0, -0.6+h, col="darkorange1")
rect(0, -0.6-h, s_tot_in, -0.6+h, col="#fdd49e")
text(0, -0.6, "Output", pos=2)
text(0, -0.6, "Input", pos=4)




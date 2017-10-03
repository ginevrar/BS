# 164 anni per 12 mesi = 1968

setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2")

#leggo outpout sim per ogni sim partita a ore diverse
ore1  <-read.table("water_input_output1", header=TRUE, sep=","); str(ore1)


river_hg_kmol_y       <- ore1$river_hg_kmol_y_media # HgT (hg+mehg) rivers senza azov
atm_hg_kmol_y         <- ore1$atm_hg_kmol_y_media
evasione_kmol_y     <-ore1$evasione_kmol_y_media
diffusion_kmol_y    <-ore1$diffusion_kmol_y_media
hgT_outflow_kmol_y  <-ore1$hgT_outflow_kmol_y_media
burial1_kmol_y      <-ore1$burial1_kmol_y_media
depo_Phg_kmol_y     <-ore1$depo_Phg_kmol_y_media
burial2_kmol_y      <- ore1$burial2_kmol_y_media
hgT_inflow_kmol_y   <- ore1$hgT_inflow_kmol_y_media
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

## river and azov  kmol y-1 --> g m-3 d-1

0.42*200.59*1000/365/(5.9*10^12)
23.9 *200.59*1000/365/(5.9*10^12)

(24.32)*200.59*1000/365/(5.9*10^12)
2.265312e-09*5/100
((0.42*200.59/365)*1000*5/100)/(5.9*10^12)
((23.9 *200.59/365)*1000*5/100)/(5.9*10^12)

# bILANCIO ULTIMI 3 aNNI
f_MB_depo_atm<-mean(tail(atm_hg_kmol_y,3)); plot(f_MB_depo_atm)
f_MB_river<-mean(tail(river_hg_kmol_y,3))
f_MB_azov<-0.42
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
tot_in<-mean(tail(Input_terms,3))+0.42  #added azov load
tot_out<-mean(tail(Output_terms,3))
str(f_MB_water)
groups <- dimnames(f_MB_water)[[2]]
neg<-cbind(f_MB_sed_depo, f_MB_evasion,  f_MB_outflow, zero)
pos<-cbind(f_MB_river, f_MB_depo_atm,  f_MB_inflow, f_MB_diffusion)

f_MB_river/tot_in
f_MB_depo_atm/tot_in
f_MB_inflow/tot_in
f_MB_diffusion/tot_in*100
f_MB_azov/tot_in*100
#
#@
######## - BARPLOT ACQUE E SEDIMENTI INSIEME


neg2<-cbind(f_MB_burial2, f_MB_diffusion, f_MB_sed_depo, 0,f_MB_outflow,f_MB_evasion)   
pos2<-cbind(f_MB_sed_depo, f_MB_diffusion,  f_MB_river, f_MB_azov, f_MB_inflow,f_MB_depo_atm) # f_MB_met,#f_MB_demet,

setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/BlackSea_IIDraft/submission_figures")

tiff('Fig.8_Barplot_Hg.tiff', height=25, width=23, units='cm', 
      compression="lzw", res=300)
par(mar=c(0.5, 3, 2.5, 1), mfrow=c(1,1))  #bottom-left-top-right
plot.new()
plot.window(xlim=c(-31, 31), ylim=c(-1, 6))
ticks <- seq(-30,30,10)
y <- c(.5,1.5,2.5,3.5,4.5,5.5) # posizione barre
h <- 0.15
### aggiungere produzione interna e degradazione  m
lines(rep(0, 2), c(0, 6), col="grey")
segments(-31, y, 31, y, lty="dotted", col="grey")  #linee orizzontali 

rect(-neg2, y-h, 0, y+h, col=c("darkorange1","darkorange1",
                               "cyan3","cyan3","cyan3","cyan3"))
rect(0, y-h, pos2, y+h, col=c('#fdd49e',"lightcyan2","lightcyan2",
                              "lightcyan2","lightcyan2",
                              "lightcyan2"))
text(12,1, expression("Hg"[P]*~"Deposition"), cex=1.5)
text(12,.8, "to the Sediment", cex=1.5)
text(-12,3, expression("Hg"[P]*~"Deposition"), cex=1.5)
text(-12,2.8, "to the Sediment", cex=1.5)
text(-7.50,4.7, expression("Hg"[T]*~"Mediterranean \n Outflow"), cex=1.5)
text(10,2.9,  expression("Hg"[T]*~"Rivers Load"), cex=1.5)
text(11,3.8,  expression("Hg"[T]*~"Azov Sea Load"), cex=1.5)
text(7,4.7, expression("Hg"[T]*~"Mediterranean \n Inflow"), cex=1.5)
text(7,1.8, expression("Hg"[D]*~"Diffusion"), cex=1.5)
text(-7,1.8, expression("Hg"[D]*~"Diffusion"), cex=1.5)
text(-8,.8, expression("Hg"[P]*~"Burial"), cex=1.5)
text(-10,5.9, expression("Hg"^0*~'Volatilization'), cex=1.5)
text(9,5.9, expression("Hg"^II*~'Deposition'), cex=1.5)
title(expression("Hg"[T]*~"Budget in the Black Sea"), cex=1.5)
par(cex.axis=1, mex=0.5)
axis(1, at=ticks, labels=(ticks), pos=0)
tw <- 1.5*strwidth("neg")
segments(-31, 1.5, 31, 1.5, lty=2, col="black") 
text(-25,6, "Water", cex=1.7, font=4, col='cyan4')
text(-25,1.3, "Sediment", cex=1.7, font=4, col='darkorange1')
text(25,1.5, "Sediment - Water \n Interface", cex=1.6, font=3, col='black')
text(-15, -0.6, "Output", cex=1.9,font=2, pos=2)
text(15, -0.6, "Input",cex=1.9, font=2,pos=4)
text(-3, -0.6, expression('kmol y'^-1), pos=4, font=1, cex=1.9)

dev.off()





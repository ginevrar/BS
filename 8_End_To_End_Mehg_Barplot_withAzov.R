
setwd('C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1')
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
Input_terms <-(mehgT_inflow_kmol_y +0.02+ river_mehg_kmol_y +mehg_prodotto_kmol_y+diffusion_kmol_y)

Input_terms-mehg_prodotto_kmol_y
Output_terms[2:164]; 
Input_terms[2:164];
summary(Output_terms);summary(Input_terms)
diff<-Input_terms-Output_terms
ax<-seq(1850,2013, by=1)
str(ax)
net_sed_input<-(depo_Pmehg_kmol_y-burial1_kmol_y-diffusion_kmol_y) 

met_demet<-read.csv('trasformazioni.csv', header=T,sep=',')
met_demet<-met_demet[,2:9]; str(met_demet)
# bILANCIO ULTIMI 3 aNNI
f_MB_river<-mean(tail(river_mehg_kmol_y,3))
f_MB_inflow<-mean(tail(mehgT_inflow_kmol_y,3))
f_MB_sed_depo<-mean(tail(depo_Pmehg_kmol_y,3))
f_MB_outflow<-mean(tail(mehgT_outflow_kmol_y,3))
f_MB_diffusion<-mean(tail(diffusion_kmol_y,3))
f_MB_burial1<-mean(tail(burial1_kmol_y,3))
f_MB_burial2<-mean(tail(burial2_kmol_y,3))
f_MB_met<-mean(tail(mehg_prodotto_kmol_y,3))
#f_MB_demet<-mean(tail(met_demet$demet_kmol_y,3))

f_MB_water<-cbind(f_MB_river, f_MB_inflow, f_MB_diffusion,f_MB_met, f_MB_demet,
                f_MB_sed_depo, f_MB_outflow)
zero<-0
tot_in<-mean(tail(Input_terms,3))
tot_out<-mean(tail(Output_terms,3))
str(f_MB_water)
groups <- dimnames(f_MB_water)[[2]]
neg<-cbind(f_MB_sed_depo, f_MB_outflow,0,0)   
pos<-cbind(f_MB_river, f_MB_inflow, f_MB_met, f_MB_diffusion) # f_MB_met,#f_MB_demet,
tot_in-f_MB_met
f_MB_azov<-0.02
f_MB_sed_depo/tot_out*100
f_MB_outflow/tot_out*100

f_MB_azov/(tot_in)*100
f_MB_inflow/(tot_in)*100
f_MB_diffusion/(tot_in)*100
neg2<-cbind(f_MB_burial2, f_MB_diffusion,f_MB_sed_depo,0, f_MB_outflow,0)   
pos2<-cbind(f_MB_sed_depo, f_MB_diffusion,  f_MB_river,  f_MB_azov, f_MB_inflow,f_MB_met) # f_MB_met,#f_MB_demet,

#BAR PLOT figone ACQUE E SEDIMENTI INSIEME
dev.new(height=200, width=100)
par(mar=c(0.5, 3, 2.5, 1), mfrow=c(1,1))  #bottom-left-top-right
plot.new()
plot.window(xlim=c(-5, 5), ylim=c(-1, 6))
ticks <- seq(-5,5, 2)             # xticks
y <- c(.5,1.5,2.5,3.5,4.5,5.5)     # y val
h <- 0.15   #height of bars
### aggiungere produzione interna e degradazione  m
lines(rep(0, 2), c(0, 6), col="grey")  # linea vert da o a 6
segments(-5, y, 5, y, lty="dotted", col="grey")  #linee orizzontali 
rect(-neg2, y-h, 0, y+h, col=c("darkorange1","darkorange1",
                               "cyan3","cyan3","cyan3","cyan3"))
rect(0, y-h, pos2, y+h, col=c('#fdd49e',"lightcyan2","lightcyan2",
                              "lightcyan2","lightcyan2",
                              "lightcyan2"))
text(2,1, expression("MeHg"[P]*~"Deposition"))
text(2,.8,"to the Sediment")
text(-2,3, expression("MeHg"[P]*~"Deposition"))
text(-2,2.8,"to the Sediment")
text(-1.50,4.8, expression("MeHg"[T]*~"Outflow"))
text(2,2.9,  expression("MeHg"[T]*~"Rivers Load"))
text(1.5,4.8, expression("MeHg"[T]*~"Inflow"))
text(2.1,5.8, expression("Net methylated MeHg"))
text(2.1,3.8, expression("MeHg"[T]*~"Azov Sea Load"))
text(1.6,1.8, expression("MeHg"[D]*~"Diffusion"))
text(-1.6,1.8, expression("MeHg"[D]*~"Diffusion"))
text(-1.8,.8, expression("MeHg"[P]*~"Burial"))

title(expression("MeHg"[T]*~"Budget in the Black Sea"))
par(cex.axis=1, mex=0.5)
axis(1, at=ticks, labels=(ticks), pos=0)
tw <- 1.5*strwidth("neg")
segments(-5, 1.5, 5, 1.5, lty=2, col="black") 
text(-4.1,5.7, "Water", cex=1.2, font=4, col='cyan4')
text(-4.1,1.3, "Sediment", cex=1.2, font=4, col='darkorange1')
text(4,1.5, "Sediment - Water \n Interface", cex=1.1, font=3, col='black')
text(-3, -0.6, "Output", pos=2, font=2)
text(3, -0.6, "Input", pos=4, font=2)
text(-0.5, -0.6, "kmol/y", pos=4, font=1, cex=1.3)

#rect(-tot_out, -0.6-h, 0, -0.6+h, col="cyan3")
#rect(0, -0.6-h, tot_in, -0.6+h, col="lightcyan2")
#text(-0.2, -0.6, "Output", pos=2)
#text(0.2, -0.6, "Input", pos=4)
















#BAR PLOT figone
#dev.new(height=200, width=100)
#dev.new()
#par(mar=c(0.5, 3, 2.5, 1), mfrow=c(1,1))  #bottom-left-top-right

ticks <- seq(-5.5,5.5);
y <- c(.5,1.5,2.5,3.5) ;
h <- 0.15;
 ### aggiungere produzione interna e degradazione  m
lines(rep(0, 2), c(0, 5), col="grey");
segments(-2.5, y, 2.5, y, lty="dotted")  #linee orizzontali 
rect(-neg, y-h, 0, y+h, col="cyan3")
rect(0, y-h, pos, y+h, col="lightcyan2")
text(-2,0.6, expression("MeHg"[P]*~"Deposition \n to the Sediment"))
text(-1.50,2.3, expression("Hg"[T]*~"Outflow"))
text(2,1.3,  expression("MeHg"[T]*~"Rivers Load"))
text(1.5,2.3, expression("MeHg"[T]*~"Inflow"))
text(1.5,3.3, expression("Net methylated MeHg"))
text(1.5,3.9, expression("MeHg"[D]*~"Diffusion"))
title("MeHg Budget in the Black Sea Water \n [kmol/y]")
par(cex.axis=1, mex=0.5)
axis(1, at=ticks, labels=(ticks), pos=0)
tw <- 1.5*strwidth("neg")
rect(-tot_out, -0.6-h, 0, -0.6+h, col="cyan3")
rect(0, -0.6-h, tot_in, -0.6+h, col="lightcyan2")
text(-0.2, -0.6, "Output", pos=2)
text(0.2, -0.6, "Input", pos=4)


f_MB_sed<-cbind(f_MB_diffusion, f_MB_sed_depo, f_MB_burial2)
zero<-0
tot_in_sed<-f_MB_sed_depo
tot_out_sed<-(f_MB_diffusion+f_MB_burial2)

s_tot_in<-mean(tail(tot_in_sed,3))
s_tot_out<-mean(tail(tot_out_sed,3))
groups <- dimnames(f_MB_sed)[[2]]




# BAR PLOT SEDIMENTI
dev.new(height=200, width=100)
par(mar=c(0.5, 3, 2, 1))  #bottom-left-top-right
plot.new()
plot.window(xlim=c(-5, 5), ylim=c(-1, 3))
ticks <- c(-5,-3, -1,1, 3,5)
y <- 1:2
h <- 0.15
lines(rep(0, 2), c(0, 2.5), col="grey")  # lunghezza e colore linea centrale
segments(-3.5, y, 3.5, y, lty="dotted")  # lunghezza e stile linee orizzonatli
rect(-neg_sed, y-h, 0, y+h, col="darkorange1")
rect(0, y-h, pos_sed, y+h, col="#fdd49e")
text(1.7,1.3, expression("MeHg"[P]*~"Deposition \n to the Sediment"))
text(-0.02,2.3, expression("MeHg"[D]*~"Diffusion"))
text(-1.2,1.3, expression("MeHg"[P]*~"Burial"))
title("MeHg Budget in the Black Sea Sediment \n [kmol/y]")
par(cex.axis=1, mex=0.5)
axis(1, at=ticks, labels=(ticks), pos=0)

tw <- 1.5*strwidth("neg")
rect(-s_tot_out, -0.6-h, 0, -0.6+h, col="darkorange1")
rect(0, -0.6-h, s_tot_in, -0.6+h, col="#fdd49e")
text(-0.02, -0.6, "Output", pos=2)
text(0.02, -0.6, "Input", pos=4)

pos_sed<-cbind(f_MB_sed_depo, zero)
neg_sed<-cbind(f_MB_burial2,f_MB_diffusion)

neg1<-cbind(s_tot_out,f_MB_burial2,f_MB_diffusion, tot_out,f_MB_sed_depo, f_MB_outflow,0,0)   
pos1<-cbind(s_tot_in,f_MB_sed_depo, zero, tot_in, f_MB_river, f_MB_inflow, f_MB_met, f_MB_diffusion) # f_MB_met,#f_MB_demet,

#BAR PLOT figone
dev.new(height=200, width=100)
par(mar=c(0.5, 3, 2.5, 1), mfrow=c(1,1))  #bottom-left-top-right
plot.new()
plot.window(xlim=c(-5.5, 5.5), ylim=c(-1, 9))
ticks <- seq(-5.5,5.5)
y <- c(.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5) 
h <- 0.15
### aggiungere produzione interna e degradazione  m
lines(rep(0, 2), c(0, 5), col="grey")
segments(-2.5, y, 2.5, y, lty="dotted")  #linee orizzontali 
rect(-neg1, y-h, 0, y+h, col=c("darkorange1","darkorange1","darkorange1",
                               "cyan3","cyan3","cyan3","cyan3","cyan3"))
rect(0, y-h, pos1, y+h, col=c('#fdd49e','#fdd49e','#fdd49e',"lightcyan2","lightcyan2",
                              "lightcyan2","lightcyan2",
                              "lightcyan2"))
text(-2,0.6, expression("MeHg"[P]*~"Deposition \n to the Sediment"))
text(-1.50,2.3, expression("Hg"[T]*~"Outflow"))
text(2,1.3,  expression("MeHg"[T]*~"Rivers Load"))
text(1.5,2.3, expression("MeHg"[T]*~"Inflow"))
text(1.5,3.3, expression("Net methylated MeHg"))
text(1.5,3.9, expression("MeHg"[D]*~"Diffusion"))
title("MeHg Budget in the Black Sea Water \n [kmol/y]")
par(cex.axis=1, mex=0.5)
axis(1, at=ticks, labels=(ticks), pos=0)
tw <- 1.5*strwidth("neg")
rect(-tot_out, -0.6-h, 0, -0.6+h, col="cyan3")
rect(0, -0.6-h, tot_in, -0.6+h, col="lightcyan2")
text(-0.2, -0.6, "Output", pos=2)
text(0.2, -0.6, "Input", pos=4)



##



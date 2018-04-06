
setwd("C:/Users/gi/Desktop/ULTIME_hgII___/")
sims<-read.table('Sims.txt')
setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In1")
out_medi1 <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
str(out_medi1) 
riv_in1<-out_medi1$river_hg_kmol_y*0.65

# input
inf_in1<-out_medi1$hgT_inflow_kmol_y
diff_in1<-out_medi1$diffusion_kmol_y
#output
vol_in1<-out_medi1$evasione_kmol_y
outf_in1<-out_medi1$hgT_outflow_kmol_y
pHgdepo_in1<-out_medi1$depo_Phg_kmol_y
bur1_in1<-out_medi1$burial1_kmol_y
bur2_in1<-out_medi1$burial2_kmol_y

ore1  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In2")
out_medi2 <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
riv_in2<-(out_medi2$river_hg_kmol_y*1.41)
inf_in2<-out_medi2$hgT_inflow_kmol_y
diff_in2<-out_medi2$diffusion_kmol_y
#output
vol_in2<-out_medi2$evasione_kmol_y
outf_in2<-out_medi2$hgT_outflow_kmol_y
pHgdepo_in2<-out_medi2$depo_Phg_kmol_y
bur1_in2<-out_medi2$burial1_kmol_y
bur2_in2<-out_medi2$burial2_kmol_y

ore2  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b")
out_medi1b <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
str(out_medi1b) 

riv_in1b<-(out_medi2$river_hg_kmol_y*.65)
# input
inf_in1b<-out_medi1b$hgT_inflow_kmol_y
diff_in1b<-out_medi1b$diffusion_kmol_y
#output
vol_in1b<-out_medi1b$evasione_kmol_y
outf_in1b<-out_medi1b$hgT_outflow_kmol_y
pHgdepo_in1b<-out_medi1b$depo_Phg_kmol_y
bur1_in1b<-out_medi1b$burial1_kmol_y
bur2_in1b<-out_medi1b$burial2_kmol_y

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b")
out_medi2b <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")

riv_in2b<-(out_medi2b$river_hg_kmol_y*1.41)
# input
inf_in2b<-out_medi2b$hgT_inflow_kmol_y
diff_in2b<-out_medi2b$diffusion_kmol_y
#output
vol_in2b<-out_medi2b$evasione_kmol_y
outf_in2b<-out_medi2b$hgT_outflow_kmol_y
pHgdepo_in2b<-out_medi2b$depo_Phg_kmol_y
bur1_in2b<-out_medi2b$burial1_kmol_y
bur2_in2b<-out_medi2b$burial2_kmol_y

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c")
out_medi1c <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
riv_in1c<-(out_medi1c$river_hg_kmol_y*1.07)
# input# input
inf_in1c<-out_medi1c$hgT_inflow_kmol_y
diff_in1c<-out_medi1c$diffusion_kmol_y
#output
vol_in1c<-out_medi1c$evasione_kmol_y
outf_in1c<-out_medi1c$hgT_outflow_kmol_y
pHgdepo_in1c<-out_medi1c$depo_Phg_kmol_y
bur1_in1c<-out_medi1c$burial1_kmol_y
bur2_in1c<-out_medi1c$burial2_kmol_y

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c")
out_medi2c <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")

riv_in2c<-(out_medi2c$river_hg_kmol_y*1.5)

inf_in2c<-out_medi2c$hgT_inflow_kmol_y
diff_in2c<-out_medi2c$diffusion_kmol_y
#output
vol_in2c<-out_medi2c$evasione_kmol_y
outf_in2c<-out_medi2c$hgT_outflow_kmol_y
pHgdepo_in2c<-out_medi2c$depo_Phg_kmol_y
bur1_in2c<-out_medi2c$burial1_kmol_y
bur2_in2c<-out_medi2c$burial2_kmol_y

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c")
out_medi3c <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
riv_in3c<-(out_medi3c$river_hg_kmol_y*.84)
inf_in3c<-out_medi3c$hgT_inflow_kmol_y
diff_in3c<-out_medi3c$diffusion_kmol_y
#output
vol_in3c<-out_medi3c$evasione_kmol_y
outf_in3c<-out_medi3c$hgT_outflow_kmol_y
pHgdepo_in3c<-out_medi3c$depo_Phg_kmol_y
bur1_in3c<-out_medi3c$burial1_kmol_y
bur2_in3c<-out_medi3c$burial2_kmol_y

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c")
out_medi4c <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
riv_in4c<-(out_medi4c$river_hg_kmol_y*1.5)
inf_in4c<-out_medi4c$hgT_inflow_kmol_y
diff_in4c<-out_medi4c$diffusion_kmol_y
#output
vol_in4c<-out_medi4c$evasione_kmol_y
outf_in4c<-out_medi4c$hgT_outflow_kmol_y
pHgdepo_in4c<-out_medi4c$depo_Phg_kmol_y
bur1_in4c<-out_medi4c$burial1_kmol_y
bur2_in4c<-out_medi4c$burial2_kmol_y

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/Centrale_NOme")
out_medibase <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
riv_inb<-(out_medibase$river_hg_kmol_y*1.07)
sims
25/(24.35274-1.1)# input
inf_inbase<-out_medibase$hgT_inflow_kmol_y
diff_inbase<-out_medibase$diffusion_kmol_y
#output
vol_inbase<-out_medibase$evasione_kmol_y
outf_inbase<-out_medibase$hgT_outflow_kmol_y
pHgdepo_inbase<-out_medibase$depo_Phg_kmol_y
bur1_inbase<-out_medibase$burial1_kmol_y
bur2_inbase<-out_medibase$burial2_kmol_y

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin
out_medif6 <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
riv_f6<-(out_medif6$river_hg_kmol_y*1.07)
sims
25/(24.35274-1.1)# input
inf_f6<-out_medif6$hgT_inflow_kmol_y
diff_f6<-out_medif6$diffusion_kmol_y
#output
vol_f6<-out_medif6$evasione_kmol_y
outf_f6<-out_medif6$hgT_outflow_kmol_y
pHgdepo_f6<-out_medif6$depo_Phg_kmol_y
bur1_f6<-out_medif6$burial1_kmol_y
bur2_f6<-out_medif6$burial2_kmol_y

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin
out_medif2 <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
str(out_medif2) 
# input
inf_f2<-out_medif2$hgT_inflow_kmol_y
diff_f2<-out_medif2$diffusion_kmol_y
#output
vol_f2<-out_medif2$evasione_kmol_y
outf_f2<-out_medif2$hgT_outflow_kmol_y
pHgdepo_f2<-out_medif2$depo_Phg_kmol_y
bur1_f2<-out_medif2$burial1_kmol_y
bur2_f2<-out_medif2$burial2_kmol_y

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim1')#Fminmin
out_medinew1 <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
str(out_medinew1) 
# input
inf_new1<-out_medinew1$hgT_inflow_kmol_y
diff_new1<-out_medinew1$diffusion_kmol_y
#output
vol_new1<-out_medinew1$evasione_kmol_y
outf_new1<-out_medinew1$hgT_outflow_kmol_y
pHgdepo_new1<-out_medinew1$depo_Phg_kmol_y
bur1_new1<-out_medinew1$burial1_kmol_y
bur2_new1<-out_medinew1$burial2_kmol_y

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
out_medinew2 <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
str(out_medinew2) 
# input
inf_new2<-out_medinew2$hgT_inflow_kmol_y
diff_new2<-out_medinew2$diffusion_kmol_y
#output
vol_new2<-out_medinew2$evasione_kmol_y
outf_new2<-out_medinew2$hgT_outflow_kmol_y
pHgdepo_new2<-out_medinew2$depo_Phg_kmol_y
bur1_new2<-out_medinew2$burial1_kmol_y
bur2_new2<-out_medinew2$burial2_kmol_y

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin
out_medinew3 <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")
str(out_medinew3) 
# input
inf_new3<-out_medinew3$hgT_inflow_kmol_y
diff_new3<-out_medinew3$diffusion_kmol_y
#output
vol_new3<-out_medinew3$evasione_kmol_y
outf_new3<-out_medinew3$hgT_outflow_kmol_y
pHgdepo_new3<-out_medinew3$depo_Phg_kmol_y
bur1_new3<-out_medinew3$burial1_kmol_y
bur2_new3<-out_medinew3$burial2_kmol_y

ore1  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")

v_2013<-data.frame(vol_in1,vol_in2, vol_in2b,
          vol_in1c,vol_in2c, vol_in3c, 
          vol_in4c, vol_inbase,
          vol_f6,vol_f2,vol_new1,
          vol_new2,vol_new3)

str(v_2013)

pHgdepo_2013<-data.frame(pHgdepo_in1,pHgdepo_in2, pHgdepo_in2b,
                pHgdepo_in1c,pHgdepo_in2c, pHgdepo_in3c, 
                pHgdepo_in4c, pHgdepo_inbase,
                pHgdepo_f6,pHgdepo_f2,pHgdepo_new1,
                pHgdepo_new2,pHgdepo_new3)

b1_2013<-data.frame(bur1_in1,bur1_in2, bur1_in2b,bur1_in1c,
           bur1_in2c, bur1_in3c, 
           bur1_in4c, bur1_inbase,
           bur1_f6,bur1_f2,bur1_new1,
           bur1_new2,bur1_new3)

riv_2013<-data.frame(riv_in1,riv_in2, riv_in2b,
                     riv_in1c,riv_in2c, riv_in3c, 
                     riv_in4c, riv_inb,
                     riv_f6,riv_f6,riv_f6,
                     riv_f6,riv_f6)


b2_2013<-data.frame(bur2_in1, bur2_in2, bur2_in2b,bur2_in1c,
           bur2_in2c, bur2_in3c, 
           bur2_in4c, bur2_inbase,
           bur2_f6,  bur2_f2,bur2_new1,
           bur2_new2,bur2_new3)

outf_2013<-data.frame(outf_in1,outf_in2, outf_in2b,outf_in1c,
             outf_in2c, outf_in3c, 
             outf_in4c, outf_inbase,
             outf_f6,outf_f2,outf_new1,
             outf_new2,outf_new3)

inf_2013<-data.frame(inf_in1,inf_in2, inf_in2b,
            inf_in1c, inf_in2c, inf_in3c, 
            inf_in4c, inf_inbase,
            inf_f6,inf_f2,inf_new1,
            inf_new2,inf_new3)

diff_2013<-data.frame(diff_in1,diff_in2, diff_in2b,
             diff_in1c, diff_in2c, diff_in3c, 
             diff_in4c, diff_inbase,
             diff_f6,diff_f2,diff_new1,
             diff_new2,diff_new3)



atm_dep<-5.3
river<-25+1
tin<-inf_2013+atm_dep+river
tou<-(outf_2013+pHgdepo_2013+v_2013)

mean(tou)
SE_tou<-sd(tou)/sqrt(13)
str(out_medinew2)

atm_hg_kmol_y<-out_medinew2$atm_hg_kmol_y

sd_vol<-apply(v_2013, 1, FUN=sd)
SE_vol<-sd_vol/sqrt(13)
vol_min<-rowMeans(v_2013[36:2412,])-SE_vol[36:2412]
vol_max<-rowMeans(v_2013[36:2412,])+SE_vol[36:2412]
vol_poly<-c(vol_min,rev(vol_max))
evasione_kmol_y<-rowMeans(v_2013)

sd_diff<-apply(diff_2013, 1, FUN=sd)
SE_diff<-sd_diff/sqrt(13)
diff_min<-rowMeans(diff_2013[36:2412,])-SE_diff[36:2412]
diff_max<-rowMeans(diff_2013[36:2412,])+SE_diff[36:2412]
diff_poly<-c(diff_min,rev(diff_max))
diffusion_kmol_y<-rowMeans(diff_2013)
SE_b1<-sd(b1_2013)/sqrt(13)

sd_b2<-apply(b2_2013, 1, FUN=sd)
SE_b2<-sd_b2/sqrt(13)
b2_min<-rowMeans(b2_2013[36:2412,])-SE_b2[36:2412]
b2_max<-rowMeans(b2_2013[36:2412,])+SE_b2[36:2412]
y<-seq(36:2412)
yy<-c(y,rev(y))
bur_poly<-c(b2_min,rev(b2_max))

sd_inf<-apply(inf_2013, 1, FUN=sd)
SE_inf<-sd_inf/sqrt(13)
CI_inf_min<-rowMeans(inf_2013[36:2412,])-SE_inf[36:2412]
CI_inf_max<-rowMeans(inf_2013[36:2412,])+SE_inf[36:2412]
inf_poly<-c(CI_inf_min,rev(CI_inf_max))

sd_outf<-apply(outf_2013, 1, FUN=sd)
SE_outf<-sd_outf/sqrt(13)
CI_outf_min<-rowMeans(outf_2013[36:2412,])-SE_outf[36:2412]
CI_outf_max<-rowMeans(outf_2013[36:2412,])+SE_outf[36:2412]
outf_poly<-c(CI_outf_min,rev(CI_outf_max))

sd_pHgdepo<-apply(pHgdepo_2013, 1, FUN=sd)
SE_pHgdepo<-sd_pHgdepo/sqrt(13)
CI_pHgdepo_min<-rowMeans(pHgdepo_2013[36:2412,])-SE_pHgdepo[36:2412]
CI_pHgdepo_max<-rowMeans(pHgdepo_2013[36:2412,])+SE_pHgdepo[36:2412]
phgdep_poly<-c(CI_pHgdepo_min,rev(CI_pHgdepo_max))
depo_Phg_kmol_y<-rowMeans(pHgdepo_2013)
riv_2013
sd_riv<-apply(riv_2013, 1, FUN=sd)
SE_riv<-sd_riv/sqrt(13)
CI_riv_min<-rowMeans(riv_2013[36:2412,])-SE_riv[36:2412]
CI_riv_max<-rowMeans(riv_2013[36:2412,])+SE_riv[36:2412]

riv_poly<-c(CI_riv_min,rev(CI_riv_max))

phgdep_poly<-c(CI_pHgdepo_min,rev(CI_pHgdepo_max))
outf_poly<-c(CI_outf_min,rev(CI_outf_max))
diff_poly<-c(diff_min,rev(diff_max))
vol_poly<-c(vol_min,rev(vol_max))

StandErrors<-data.frame(SE_vol, SE_diff,
                        SE_b1,SE_b2,SE_inf,
                        SE_outf,SE_pHgdepo)
atm_hg_kmol_y<-rowMeans(v_2013)
  
Output<-outf_2013+pHgdepo_2013+v_2013
md<-data.frame(atm_hg_kmol_y, atm_hg_kmol_y,
    atm_hg_kmol_y, atm_hg_kmol_y,
    atm_hg_kmol_y, atm_hg_kmol_y,
    atm_hg_kmol_y, atm_hg_kmol_y,
    atm_hg_kmol_y, atm_hg_kmol_y,
    atm_hg_kmol_y, atm_hg_kmol_y, 
   atm_hg_kmol_y)
inff<-data.frame(inf_2013)
str(inff)
Input<-riv_2013+diff_2013+md+inff

Output_terms<-rowMeans(Output)
Input_terms<-rowMeans(Input)
str(md)
sd_outt<-apply(Output, 1, FUN=sd)
se_outt<-sd_outt/sqrt(5)
outt1<-Output_terms[36:2412]-se_outt[36:2412]
outt2<-Output_terms[36:2412]+se_outt[36:2412]
outt_poly<-c(outt1,rev(outt2))

sd_int<-apply(Input, 1, FUN=sd)
se_int<-sd_int/sqrt(5)
int1<-Input_terms[36:2412]-se_int[36:2412]
int2<-Input_terms[36:2412]+se_int[36:2412]
int_poly<-c(int1,rev(int2))

Input_terms[164];se_int[164]
Output_terms[164];se_outt[164]

ax2<-seq(1,201)
str(out_medif6)

max(Input_terms)
river_hg_kmol_y<-rowMeans(riv_2013)
hgT_inflow_kmol_y<-rowMeans(inf_2013)
hgT_outflow_kmol_y<-rowMeans(outf_2013)

setwd('C:/Users/gi/Desktop/nuoveMEt3/')
tiff('Fig.9A_Hgver.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(5,5,4,1), bty='n') 

plot(atm_hg_kmol_y[36:2412], col="cyan3", type="l",  ylim=c(-50,50), 
     main=expression(paste('Hg'[T]*' fluxes to the Black Sea')), ylab= " ", 
     xlab= " ",  lwd=1, cex.axis=2, cex.lab=2,cex.main=2.3)
polygon(yy,vol_poly,col='#00CDCD44',border = '#00CDCD44')
par(new=TRUE)
plot(river_hg_kmol_y[36:2412], col="chartreuse3", type="l", 
     xaxt='n',yaxt='n',ylim=c(-50,50), 
     ylab= " ",xlab= " ",  lwd=1)
polygon(yy,riv_poly,col='#65cc0044',border = '#65cc0044')
par(new=TRUE)
plot(hgT_inflow_kmol_y[36:2412], col="darkblue", type="l", 
     xaxt='n',yaxt='n',
     ylim=c(-50,50), ylab= " ", xlab= " ",  lwd=2)
par(new=TRUE)
plot(diffusion_kmol_y[36:2412], col="#B8860B", type="l", 
     xaxt='n',yaxt='n',
     ylim=c(-50,50), ylab= " ", xlab= " ",  lwd=2)
polygon(yy,diff_poly,col='#B8860B44',border = '#B8860B44')
par(new=TRUE)
plot(Input_terms[36:2412], col="black", type="l", lty=2, 
     xaxt='n',yaxt='n',
     ylim=c(-50,50), ylab= " ", xlab= " ",  lwd=1)
par(new=TRUE)
plot(-evasione_kmol_y[36:2412], col="cyan4", type="l", xlab= " ", 
     ylim=c(-50,50), xaxt='n',yaxt='n',
     main=" ", ylab= " ",  lwd=1)
polygon(yy,-vol_poly,col='#007f7f44',border = '#007f7f44')
par(new=TRUE)
plot(-depo_Phg_kmol_y[36:2412], col="orange", type="l", xlab= " ", 
     ylim=c(-50,50), xaxt='n',yaxt='n',
     ylab= " ",  lwd=1)
polygon(yy,-phgdep_poly,col='#FFA50044',border = '#FFA50044')
par(new=TRUE)
plot(-hgT_outflow_kmol_y[36:2412], col="darkblue", type="l", 
     ylim=c(-50,50),xlab= " ",xaxt='n',yaxt='n',
     ylab= " ",  lwd=2)
polygon(yy,-outf_poly,col='#00000044',border = '#00000044')

par(new=TRUE)
plot(-Output_terms[36:2412], col="black", type="l", lty=2, 
     ylim=c(-50,50), xaxt='n',yaxt='n',
     xlab= " ", ylab= "",  lwd=1)
polygon(yy,-outt_poly,col='#00000044',border = '#00000044')

mtext(expression(paste('kmol y'^-1)), 2, at= 0, line=2.6, cex=2)

text(1600.0,15,'Atmospheric deposition',col='cyan4', cex=1.9)
text(1420,27,' River \n load',col='chartreuse4', cex=1.9)
#text(1980,12,'Inflow from Marmara Sea',col='darkblue')
text(1300,3,'Sediment Diffusion',col='darkgoldenrod', cex=1.9)
text(130,36,'Input',col=1, cex=2.2)
text(2000,-12.5,'Evasion',col='cyan4',cex=1.9)
text(1000,-30,'Deposition to \n the sediment',col='darkorange',cex=1.9)
text(2100,-.6,'Inflow - Outflow',col='darkblue', cex=1.6)
text(130,-23,'Output',col=1,cex=2.2)
dev.off()

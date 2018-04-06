
setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin
out_medif6 <-read.table("water_input_output_mehg_1_2050", header=TRUE, sep=",")
str(out_medif6) 
# input
inf_f6<-out_medif6$mehgT_inflow_kmol_y_media
diff_f6<-out_medif6$diffusion_kmol_y_media
#output
metnet_f6<-out_medif6$mehg_prodotto_kmol_y_media
outf_f6<-out_medif6$mehgT_outflow_kmol_y_media
pMeHgdepo_f6<-out_medif6$depo_Pmehg_kmol_y_media
bur1_f6<-out_medif6$burial1_kmol_y_media
bur2_f6<-out_medif6$burial2_kmol_y_media

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin
out_medif2 <-read.table("water_input_output_mehg_1_2050", header=TRUE, sep=",")
str(out_medif2) 
# input
inf_f2<-out_medif2$mehgT_inflow_kmol_y_media
diff_f2<-out_medif2$diffusion_kmol_y_media
#output
metnet_f2<-out_medif2$mehg_prodotto_kmol_y_media
outf_f2<-out_medif2$mehgT_outflow_kmol_y_media
pMeHgdepo_f2<-out_medif2$depo_Pmehg_kmol_y_media
bur1_f2<-out_medif2$burial1_kmol_y_media
bur2_f2<-out_medif2$burial2_kmol_y_media

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim1')#Fminmin
out_medinew1 <-read.table("water_input_output_mehg_1_2050", header=TRUE, sep=",")
str(out_medinew1) 
# input
inf_new1<-out_medinew1$mehgT_inflow_kmol_y_media
diff_new1<-out_medinew1$diffusion_kmol_y_media
#output
metnet_new1<-out_medinew1$mehg_prodotto_kmol_y_media
outf_new1<-out_medinew1$mehgT_outflow_kmol_y_media
pMeHgdepo_new1<-out_medinew1$depo_Pmehg_kmol_y_media
bur1_new1<-out_medinew1$burial1_kmol_y_media
bur2_new1<-out_medinew1$burial2_kmol_y_media

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
out_medinew2 <-read.table("water_input_output_mehg_1_2050", header=TRUE, sep=",")
str(out_medinew2) 
# input
inf_new2<-out_medinew2$mehgT_inflow_kmol_y_media
diff_new2<-out_medinew2$diffusion_kmol_y_media
#output
metnet_new2<-out_medinew2$mehg_prodotto_kmol_y_media
outf_new2<-out_medinew2$mehgT_outflow_kmol_y_media
pMeHgdepo_new2<-out_medinew2$depo_Pmehg_kmol_y_media
bur1_new2<-out_medinew2$burial1_kmol_y_media
bur2_new2<-out_medinew2$burial2_kmol_y_media

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin
out_medinew3 <-read.table("water_input_output_mehg_1_2050", header=TRUE, sep=",")
str(out_medinew3) 
# input
inf_new3<-out_medinew3$mehgT_inflow_kmol_y_media
diff_new3<-out_medinew3$diffusion_kmol_y_media
#output
outf_new3<-out_medinew3$mehgT_outflow_kmol_y_media
pMeHgdepo_new3<-out_medinew3$depo_Pmehg_kmol_y_media
bur1_new3<-out_medinew3$burial1_kmol_y_media
bur2_new3<-out_medinew3$burial2_kmol_y_media
metnet_new3<-out_medinew3$mehg_prodotto_kmol_y_media

metnet_1850_2050<-c(metnet_f6,metnet_f2,metnet_new1,
                    metnet_new2,metnet_new3)

pMeHgdepo_1850_2050<-data.frame(pMeHgdepo_f6,pMeHgdepo_f2,pMeHgdepo_new1,
                       pMeHgdepo_new2,pMeHgdepo_new3)

metnet_1850_2050<-data.frame(metnet_f6,metnet_f2,metnet_new1,
                    metnet_new2,metnet_new3)

b1_1850_2050<-data.frame(bur1_f6,bur1_f2,bur1_new1,
                bur1_new2,bur1_new3)

b2_1850_2050<-data.frame(bur2_f6,  bur2_f2,bur2_new1,
                bur2_new2,bur2_new3)

outf_1850_2050<-data.frame(outf_f6,outf_f2,outf_new1,
                  outf_new2,outf_new3)

inf_1850_2050<-data.frame(inf_f6,inf_f2,inf_new1,
                 inf_new2,inf_new3)

diff_1850_2050<-data.frame(diff_f6,diff_f2,diff_new1,
                  diff_new2,diff_new3)

diffusion_kmol_y<-rowMeans(diff_1850_2050)
sd_d<-apply(diff_1850_2050, 1, FUN=sd)
se_d<-sd_d/sqrt(5)
d1<-diffusion_kmol_y[3:201]-se_d[3:201]
d2<-diffusion_kmol_y[3:201]+se_d[3:201]
diff_poly<-c(d1,rev(d2))

mehg_prodotto_kmol_y<-rowMeans(metnet_1850_2050)
sd1<-apply(metnet_1850_2050, 1, FUN=sd)
se1<-sd1/sqrt(5)

mehg_prodotto_kmol_y[164];sd1[164]

a1<-mehg_prodotto_kmol_y[3:201]-se1[3:201]
a2<-mehg_prodotto_kmol_y[3:201]+se1[3:201]
y<-seq(3:201)
yy<-c(y,rev(y))
netmet_poly<-c(a1,rev(a2))

river_kmolymehg<-out_medif6$river_mehg_kmol_y_media

depo_Pmehg_kmol_y<-rowMeans(pMeHgdepo_1850_2050)
sd_dep<-apply(pMeHgdepo_1850_2050, 1, FUN=sd)
se_dep<-sd_dep/sqrt(5)
dd1<-depo_Pmehg_kmol_y[3:201]-se_dep[3:201]
dd2<-depo_Pmehg_kmol_y[3:201]+se_dep[3:201]
dep_poly<-c(dd1,rev(dd2))

mehgT_outflow_kmol_y<-rowMeans(outf_1850_2050)
sd_ou<-apply(outf_1850_2050, 1, FUN=sd)
se_ou<-sd_ou/sqrt(5)
ou1<-mehgT_outflow_kmol_y[3:201]-se_ou[3:201]
ou2<-mehgT_outflow_kmol_y[3:201]+se_ou[3:201]
ou_poly<-c(ou1,rev(ou2))

Output<-outf_1850_2050+pMeHgdepo_1850_2050-diff_1850_2050
Input<-inf_1850_2050 +river_kmolymehg+metnet_1850_2050
Output_terms<-depo_Pmehg_kmol_y-diffusion_kmol_y+mehgT_outflow_kmol_y
Input_terms<-inf_1850_2050[,1]+river_kmolymehg+mehg_prodotto_kmol_y

sd_outt<-apply(Output, 1, FUN=sd)
se_outt<-sd_outt/sqrt(5)
outt1<-Output_terms[3:201]-se_outt[3:201]
outt2<-Output_terms[3:201]+se_outt[3:201]
outt_poly<-c(outt1,rev(outt2))

sd_int<-apply(Input, 1, FUN=sd)
se_int<-sd_int/sqrt(5)
int1<-Input_terms[3:201]-se_int[3:201]
int2<-Input_terms[3:201]+se_int[3:201]
int_poly<-c(int1,rev(int2))

Input_terms[164];se_int[164]
Output_terms[164];se_outt[164]

ax2<-seq(1,201)
str(out_medif6)

setwd('C:/Users/gi/Desktop/nuoveMEt3/')
tiff('Fig.9B_MeHgver.tiff', height=25, width=23, units='cm', 
     compression="lzw", res=300)
par(mfrow=c(1,1), mar=c(5,5,4,1), bty='n') 

plot(river_kmolymehg[3:201], col="chartreuse3", type="l",
     main=expression("MeHg"[T]*" fluxes to the Black Sea"),
     cex.axis=2, cex.lab=2,cex.main=2.3,xaxt='n', 
     ylab= " ", ylim=c(-4,8), xlab= " ", lwd=1, lty=1)
par(new=TRUE)
plot (inf_1850_2050[3:201,1], col="darkblue", lwd=2, type="l", 
      ylim=c(-4,8), ylab= " ", yaxt='n', xaxt='n',
      xlab= " ", lty=1)
par(new=TRUE)
plot (diffusion_kmol_y[3:201], col="#B8860B", lwd=2, type="l",  ylim=c(-4,8), ylab= " ",
       yaxt='n', xaxt='n',xlab= " ")
polygon(yy,diff_poly,col='#B8860B44',border = '#B8860B44')
par(new=TRUE)
plot (Input_terms[3:201], col="black", type="l", lty=2, lwd=1, ylim=c(-4,8), ylab= " ",
       yaxt='n', xaxt='n',xlab= " ")
polygon(yy,int_poly,col='#00000044',border = '#00000044')
par(new=TRUE)
plot (mehg_prodotto_kmol_y[3:201], col="hotpink3", type="l", lty=1, 
       lwd=1, ylim=c(-4,8), ylab= " ", yaxt='n', xaxt='n',    xlab= " ")
polygon(yy,netmet_poly,col='#CD609044',border = '#CD609044')
par(new=TRUE)
plot (-mehgT_outflow_kmol_y[3:201], col="darkblue", type="l",yaxt='n', xaxt='n', lwd=2,
      ylim=c(-4,8),xlab= " ", ylab= " ")
par(new=TRUE)
plot (-Output_terms[3:201], col="black", type="l", lty=2, yaxt='n', xaxt='n',
       ylim=c(-4,8), xlab= " ", ylab= "", lwd=1)
polygon(yy,-outt_poly,col='#00000044',border = '#00000044')
par(new=TRUE)
plot (-depo_Pmehg_kmol_y[3:201],  col="orange",ylab=' ',
      type="l", xlab= " ",yaxt='n', xaxt='n', ylim=c(-4,8), lwd=1)
polygon(yy,-dep_poly,col='#FFA50044',border = '#FFA50044')
abline(v=164, lwd=2.5, col='grey30',lty=3)
ax<-seq(1,201,by=20)
ll<-seq(1850,2050, by=20)
    str(ll)   
    axis(1,at=ax,labels=ll, cex.axis=2)
    text(30,7,'Input', col=1,cex=2.2)
    text(30,-2.5,'Output', col=1,cex=2.2)
mtext(expression(paste('kmol y'^-1)), 2, at= 2, line=2.6, cex=2)

text(80,1.5,'River load', cex=1.9,col='chartreuse4')
text(90,-2.7,'Deposition to \n the sediment', cex=1.9,col='darkorange')
text(135,3.1,'Net \n water column \n methylation', cex=1.9, col='hotpink4')
text(185,-.53,'Outflow',cex=1.9, col='darkblue')
text(185,.53,'Inflow',cex=1.9, col='darkblue')
text(100,-.53,'Sediment Diffusion ',cex=1.9, col='darkgoldenrod')
dev.off()




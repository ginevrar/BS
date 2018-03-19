
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

metnet_2013<-c(metnet_f6[164],metnet_f2[164],metnet_new1[164],
          metnet_new2[164],metnet_new3[164])

pMeHgdepo_2013<-c(pMeHgdepo_f6[164],pMeHgdepo_f2[164],pMeHgdepo_new1[164],
                pMeHgdepo_new2[164],pMeHgdepo_new3[164])

metnet_2013<-c(metnet_f6[164],metnet_f2[164],metnet_new1[164],
                  metnet_new2[164],metnet_new3[164])

b1_2013<-c(bur1_f6[164],bur1_f2[164],bur1_new1[164],
           bur1_new2[164],bur1_new3[164])


b2_2013<-c(bur2_f6[164],  bur2_f2[164],bur2_new1[164],
           bur2_new2[164],bur2_new3[164])

outf_2013<-c(outf_f6[164],outf_f2[164],outf_new1[164],
             outf_new2[164],outf_new3[164])

inf_2013<-c(inf_f6[164],inf_f2[164],inf_new1[164],
            inf_new2[164],inf_new3[164])

diff_2013<-c(diff_f6[164],diff_f2[164],diff_new1[164],
             diff_new2[164],diff_new3[164])


SE_diff<-sd(diff_2013)/sqrt(5)
CI_diff_min<-mean(diff_2013)-1.96*SE_diff
CI_diff_max<-mean(diff_2013)+1.96*SE_diff
SE_b1<-sd(b1_2013)/sqrt(5)
CI_b1_min<-mean(b1_2013)-1.96*SE_b1
CI_b1_max<-mean(b1_2013)+1.96*SE_b1

SE_b2<-sd(b2_2013)/sqrt(5)
CI_b2_min<-mean(b2_2013)-1.96*SE_b2
CI_b2_max<-mean(b2_2013)+1.96*SE_b2

SE_inf<-sd(inf_2013)/sqrt(5)
CI_inf_min<-mean(inf_2013)-1.96*SE_inf
CI_inf_max<-mean(inf_2013)+1.96*SE_inf

SE_outf<-sd(outf_2013)/sqrt(5)
CI_outf_min<-mean(outf_2013)-1.96*SE_outf
CI_outf_max<-mean(outf_2013)+1.96*SE_outf


SE_pMeHgdepo<-sd(pMeHgdepo_2013)/sqrt(5)
CI_pMeHgdepo_min<-mean(pMeHgdepo_2013)-1.96*SE_pMeHgdepo
CI_pMeHgdepo_max<-mean(pMeHgdepo_2013)+1.96*SE_pMeHgdepo

SE_metnet<-sd(metnet_2013)/sqrt(5)
mean(metnet_2013);SE_metnet

confidence_interval<-data.frame(CI_metnet_min, CI_metnet_max, 
                                CI_diff_min, CI_diff_max,
                                CI_b2_min, CI_b2_max,
                                CI_inf_min, CI_inf_max,
                                CI_outf_min, CI_outf_max,
                                CI_pMeHgdepo_min, CI_pMeHgdepo_max)
mean(outf_2013);SE_outf
mean(diff_2013);SE_diff
mean(b2_2013);SE_b2
mean(pMeHgdepo_2013);SE_pMeHgdepo

setwd("C:/Users/gi/Desktop/")
write.csv(confidence_interval, file='CIs_mehg_flusex_allsimtogether.csv')

getwd()

SE_vol<-sd(metnet_2013)/sqrt(length(metnet_2013))


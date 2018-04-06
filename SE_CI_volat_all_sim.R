setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In1")
out_medi1 <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medi1) 
# input
inf_in1<-out_medi1$hgT_inflow_kmol_y_media
diff_in1<-out_medi1$diffusion_kmol_y_media
#output
vol_in1<-out_medi1$evasione_kmol_y
outf_in1<-out_medi1$hgT_outflow_kmol_y_media
pHgdepo_in1<-out_medi1$depo_Phg_kmol_y_media
bur1_in1<-out_medi1$burial1_kmol_y_media
bur2_in1<-out_medi1$burial2_kmol_y_media

ore1  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In2")
out_medi2 <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medi2) 
# input
inf_in2<-out_medi2$hgT_inflow_kmol_y_media
diff_in2<-out_medi2$diffusion_kmol_y_media
#output
vol_in2<-out_medi2$evasione_kmol_y
outf_in2<-out_medi2$hgT_outflow_kmol_y_media
pHgdepo_in2<-out_medi2$depo_Phg_kmol_y_media
bur1_in2<-out_medi2$burial1_kmol_y_media
bur2_in2<-out_medi2$burial2_kmol_y_media

ore2  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b")
out_medi1b <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medi1b) 
# input
inf_in1b<-out_medi1b$hgT_inflow_kmol_y_media
diff_in1b<-out_medi1b$diffusion_kmol_y_media
#output
vol_in1b<-out_medi1b$evasione_kmol_y
outf_in1b<-out_medi1b$hgT_outflow_kmol_y_media
pHgdepo_in1b<-out_medi1b$depo_Phg_kmol_y_media
bur1_in1b<-out_medi1b$burial1_kmol_y_media
bur2_in1b<-out_medi1b$burial2_kmol_y_media

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b")
out_medi2b <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medi2b) 
# input
inf_in2b<-out_medi2b$hgT_inflow_kmol_y_media
diff_in2b<-out_medi2b$diffusion_kmol_y_media
#output
vol_in2b<-out_medi2b$evasione_kmol_y
outf_in2b<-out_medi2b$hgT_outflow_kmol_y_media
pHgdepo_in2b<-out_medi2b$depo_Phg_kmol_y_media
bur1_in2b<-out_medi2b$burial1_kmol_y_media
bur2_in2b<-out_medi2b$burial2_kmol_y_media

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c")
out_medi1c <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medi1c) 
# input
inf_in1c<-out_medi1c$hgT_inflow_kmol_y_media
diff_in1c<-out_medi1c$diffusion_kmol_y_media
#output
vol_in1c<-out_medi1c$evasione_kmol_y
outf_in1c<-out_medi1c$hgT_outflow_kmol_y_media
pHgdepo_in1c<-out_medi1c$depo_Phg_kmol_y_media
bur1_in1c<-out_medi1c$burial1_kmol_y_media
bur2_in1c<-out_medi1c$burial2_kmol_y_media

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c")
out_medi2c <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medi2c) 
# input
inf_in2c<-out_medi2c$hgT_inflow_kmol_y_media
diff_in2c<-out_medi2c$diffusion_kmol_y_media
#output
vol_in2c<-out_medi2c$evasione_kmol_y
outf_in2c<-out_medi2c$hgT_outflow_kmol_y_media
pHgdepo_in2c<-out_medi2c$depo_Phg_kmol_y_media
bur1_in2c<-out_medi2c$burial1_kmol_y_media
bur2_in2c<-out_medi2c$burial2_kmol_y_media

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c")
out_medi3c <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medi3c) 
# input
inf_in3c<-out_medi3c$hgT_inflow_kmol_y_media
diff_in3c<-out_medi3c$diffusion_kmol_y_media
#output
vol_in3c<-out_medi3c$evasione_kmol_y
outf_in3c<-out_medi3c$hgT_outflow_kmol_y_media
pHgdepo_in3c<-out_medi3c$depo_Phg_kmol_y_media
bur1_in3c<-out_medi3c$burial1_kmol_y_media
bur2_in3c<-out_medi3c$burial2_kmol_y_media

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c")
out_medi4c <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medi4c) 
# input
inf_in4c<-out_medi4c$hgT_inflow_kmol_y_media
diff_in4c<-out_medi4c$diffusion_kmol_y_media
#output
vol_in4c<-out_medi4c$evasione_kmol_y
outf_in4c<-out_medi4c$hgT_outflow_kmol_y_media
pHgdepo_in4c<-out_medi4c$depo_Phg_kmol_y_media
bur1_in4c<-out_medi4c$burial1_kmol_y_media
bur2_in4c<-out_medi4c$burial2_kmol_y_media

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/Centrale_NOme")
out_medibase <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medibase) 
# input
inf_inbase<-out_medibase$hgT_inflow_kmol_y_media
diff_inbase<-out_medibase$diffusion_kmol_y_media
#output
vol_inbase<-out_medibase$evasione_kmol_y
outf_inbase<-out_medibase$hgT_outflow_kmol_y_media
pHgdepo_inbase<-out_medibase$depo_Phg_kmol_y_media
bur1_inbase<-out_medibase$burial1_kmol_y_media
bur2_inbase<-out_medibase$burial2_kmol_y_media

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin
out_medif6 <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medif6) 
# input
inf_f6<-out_medif6$hgT_inflow_kmol_y_media
diff_f6<-out_medif6$diffusion_kmol_y_media
#output
vol_f6<-out_medif6$evasione_kmol_y
outf_f6<-out_medif6$hgT_outflow_kmol_y_media
pHgdepo_f6<-out_medif6$depo_Phg_kmol_y_media
bur1_f6<-out_medif6$burial1_kmol_y_media
bur2_f6<-out_medif6$burial2_kmol_y_media

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin
out_medif2 <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medif2) 
# input
inf_f2<-out_medif2$hgT_inflow_kmol_y_media
diff_f2<-out_medif2$diffusion_kmol_y_media
#output
vol_f2<-out_medif2$evasione_kmol_y
outf_f2<-out_medif2$hgT_outflow_kmol_y_media
pHgdepo_f2<-out_medif2$depo_Phg_kmol_y_media
bur1_f2<-out_medif2$burial1_kmol_y_media
bur2_f2<-out_medif2$burial2_kmol_y_media

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
out_medinew2 <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medinew2) 
# input
inf_new2<-out_medinew2$hgT_inflow_kmol_y_media
diff_new2<-out_medinew2$diffusion_kmol_y_media
#output
vol_new2<-out_medinew2$evasione_kmol_y
outf_new2<-out_medinew2$hgT_outflow_kmol_y_media
pHgdepo_new2<-out_medinew2$depo_Phg_kmol_y_media
bur1_new2<-out_medinew2$burial1_kmol_y_media
bur2_new2<-out_medinew2$burial2_kmol_y_media

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin
out_medinew3 <-read.table("water_input_output1_2050", header=TRUE, sep=",")
str(out_medinew3) 
# input
inf_new3<-out_medinew3$hgT_inflow_kmol_y_media
diff_new3<-out_medinew3$diffusion_kmol_y_media
#output
vol_new3<-out_medinew3$evasione_kmol_y
outf_new3<-out_medinew3$hgT_outflow_kmol_y_media
pHgdepo_new3<-out_medinew3$depo_Phg_kmol_y_media
bur1_new3<-out_medinew3$burial1_kmol_y_media
bur2_new3<-out_medinew3$burial2_kmol_y_media

ore1  <-read.table("water_input_output_long_1_2050", header=TRUE, sep=",")

v_2013<-c(vol_in1[164],vol_in2, vol_in2b[164],
          vol_in1c[164],vol_in2c[164], vol_in3c[164], 
          vol_in4c[164], vol_inbase[164],
          vol_f6[164],vol_f2[164],
          vol_new2[164],vol_new3[164])

pHgdepo_2013<-c(pHgdepo_in1[164],pHgdepo_in2, pHgdepo_in2b[164],
          pHgdepo_in1c[164],pHgdepo_in2c[164], pHgdepo_in3c[164], 
          pHgdepo_in4c[164], pHgdepo_inbase[164],
          pHgdepo_f6[164],pHgdepo_f2[164],
          pHgdepo_new2[164],pHgdepo_new3[164])

b1_2013<-c(bur1_in1[164],bur1_in2, bur1_in2b[164],bur1_in1c[164],
          bur1_in2c[164], bur1_in3c[164], 
          bur1_in4c[164], bur1_inbase[164],
          bur1_f6[164],bur1_f2[164],
          bur1_new2[164],bur1_new3[164])


b2_2013<-c(bur2_in1[164], bur2_in2, bur2_in2b[164],bur2_in1c[164],
           bur2_in2c[164], bur2_in3c[164], 
           bur2_in4c[164], bur2_inbase[164],
           bur2_f6[164],  bur2_f2[164],
           bur2_new2[164],bur2_new3[164])

outf_2013<-c(outf_in1[164],outf_in2, outf_in2b[164],outf_in1c[164],
           outf_in2c[164], outf_in3c[164], 
           outf_in4c[164], outf_inbase[164],
           outf_f6[164],outf_f2[164],
           outf_new2[164],outf_new3[164])

inf_2013<-c(inf_in1[164],inf_in2, inf_in2b[164],
            inf_in1c[164], inf_in2c[164], inf_in3c[164], 
             inf_in4c[164], inf_inbase[164],
            inf_f6[164],inf_f2[164],
            inf_new2[164],inf_new3[164])

diff_2013<-c(diff_in1[164],diff_in2, diff_in2b[164],
            diff_in1c[164], diff_in2c[164], diff_in3c[164], 
            diff_in4c[164], diff_inbase[164],
            diff_f6[164],diff_f2[164],
            diff_new2[164],diff_new3[164])
atm_dep<-5.3
river<-25+1
  tin<-inf_2013+atm_dep+river
  tou<-(outf_2013+pHgdepo_2013+v_2013)

  mean(tou)
  SE_tou<-sd(tou)/sqrt(13)
  

  SE_vol<-sd(v_2013)/sqrt(13)
CI_vol_min<-mean(v_2013)-1.96*SE_vol
CI_vol_max<-mean(v_2013)+1.96*SE_vol

SE_diff<-sd(diff_2013)/sqrt(13)
CI_diff_min<-mean(diff_2013)-1.96*SE_diff
CI_diff_max<-mean(diff_2013)+1.96*SE_diff

SE_b1<-sd(b1_2013)/sqrt(13)
CI_b1_min<-mean(b1_2013)-1.96*SE_b1
CI_b1_max<-mean(b1_2013)+1.96*SE_b1

SE_b2<-sd(b2_2013)/sqrt(13)
CI_b2_min<-mean(b2_2013)-1.96*SE_b2
CI_b2_max<-mean(b2_2013)+1.96*SE_b2
mean(b2_2013)
SE_b2


SE_inf<-sd(inf_2013)/sqrt(13)
CI_inf_min<-mean(inf_2013)-1.96*SE_inf
CI_inf_max<-mean(inf_2013)+1.96*SE_inf
mean(inf_2013)
SE_inf

SE_outf<-sd(outf_2013)/sqrt(13)
CI_outf_min<-mean(outf_2013)-1.96*SE_outf
CI_outf_max<-mean(outf_2013)+1.96*SE_outf

SE_pHgdepo<-sd(pHgdepo_2013)/sqrt(13)
CI_pHgdepo_min<-mean(pHgdepo_2013)-1.96*SE_pHgdepo
CI_pHgdepo_max<-mean(pHgdepo_2013)+1.96*SE_pHgdepo
mean((pHgdepo_2013))
SE_pHgdepo

confidence_interval<-data.frame(CI_vol_min, CI_vol_max, 
                                CI_diff_min, CI_diff_max,
                                CI_b1_min, CI_b1_max,
                                CI_b2_min, CI_b2_max,
                                CI_inf_min, CI_inf_max,
                                CI_outf_min, CI_outf_max,
                                CI_pHgdepo_min, CI_pHgdepo_max)


StandErrors<-data.frame(SE_vol, SE_diff,
                        SE_b1,SE_b2,SE_inf,
                        SE_outf,SE_pHgdepo)

mean(diff_2013); mean(v_2013); mean(b2_2013);
mean(inf_2013);
mean(outf_2013);mean(pHgdepo_2013)
                    
setwd("C:/Users/gi/Desktop/")
write.csv(confidence_interval, file='CIs_allsimtogether.csv')

getwd()

SE_vol<-sd(v_2013)/sqrt(length(v_2013))

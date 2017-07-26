# NUOVO
area<-2.961E+11
sed_diff<-10^-9  
lenght_AOL_Sed<-0.05
HgD_Sed_g_L<-diss_hgII_pM$Sed1 /10^9      # sEd
HgD_Sed_g_m3<-HgD_Sed_g_L*1000
C<-(sed_diff*area)
conc_grad3<-(HgD_BBL_g_m3-(HgD_Sed_g_m3/0.95)) #g/m3
diff_Sed<-(C/(lenght_AOL_Sed/0.95))*conc_grad3
diff_Sed_mol_d<-(diff_Sed/200.59)*60*60*24
diff_Sed_mol_y<-diff_Sed_mol_d*365
diff_Sed_kmol_y<-diff_Sed_mol_y/10^3
mean(tail(diff_Sed_kmol_y,12)); summary(tail(diff_Sed_kmol_y,12))

#### VECCHIO
  Diffusion_coeff<-10^-9             #m2/s
  DF<-Diffusion_coeff*60*60*24       #m2/day
  #     ng/L to g/m3
  deep_w_hg<- diss_hg$Anoxic3      # ngL diss hg  Bottom water
  deep_w_hg_gm3<-deep_w_hg/10^6 
  
  PWhg1_ngL<-diss_hg$Sed1;  #diss hg ngL SED
  PWhg1_ngm3<-PWhg1_ngL*PW1_L/Vol_Sed1_m3
  PWhg1_gm3<-PWhg1_ngm3/10^9;
  PWhg1_ng<-PWhg1_ngL*PW1_L; PWhg1_g<-PWhg1_ng/10^9; PWhg1_kmol<-PWhg1_g/(200.59*1000)  
  
  # per mol di diffusione importante Length of exchange (=depth sediment..)                        #diffusione >0 --> verso h20 (su)
                          #      diff <0 --> verso sedimento     (giu)
  term1<-(DF*Model_area*porosity1)/(0.03/porosity1)  # m2/day*m2/m -->m3/day
  term2<-(PWhg1_gm3/porosity1)-(deep_w_hg_gm3)       # g/m3
  diffusion_g_day<-term1*term2;                        # m3/day*g/m3--> g/day   
  diffusion_g_m2_day<-diffusion_g_day/Model_area
  diffusion_mol_m2_day<-diffusion_g_m2_day/200.49
  diffusion_umol_m2_y<-diffusion_mol_m2_day*10^6*365; summary(diffusion_umol_m2_y); diffusion_kmol_day<-diffusion_g_day/(200.49*1000)
  diffusion_kmol_y<-diffusion_kmol_day*365
  diffusion_kmol_y_media<-tapply(diffusion_kmol_y,rep(1:(length(diffusion_kmol_y)/12),each = 12), mean)
  diffusion_kmol_cumul<-cumsum(diffusion_kmol_y_media)
  plot(diffusion_kmol_cumul)
  plot(diffusion_kmol_y_media); tail(diffusion_kmol_y_media,3)
  
  term1b<-(DF*Model_area*porosity2)/(0.05/porosity2)
  term2b<-(PWhg2_gm3/porosity2)-(PWhg1_gm3/porosity1)  #sempre < 0 (giu - da sed1 a sed2)
  diffusion_sed_to_sed_g_day<-term1b*term2b   #g/day
  plot(porosity2)
  
  diffusion_sed_to_sed_kmol_day<-diffusion_sed_to_sed_g_day/(200.49*1000)
  diffusion_sed_to_sed_kmol_y<-diffusion_sed_to_sed_kmol_day*365
  diffusion_sed_to_sed_kmol_y_media<-tapply(diffusion_sed_to_sed_kmol_y,rep(1:(length(diffusion_sed_to_sed_kmol_y)/12),each = 12), mean)
  diffusion_sed_to_sed_kmol_cumul<-cumsum(diffusion_sed_to_sed_kmol_y_media)
  tail(diffusion_sed_to_sed_kmol_cumul)
  

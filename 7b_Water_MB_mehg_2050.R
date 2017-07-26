setwd('C:\\Users\\Ginevra\\Desktop\\new_sim_BS')
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale')

input_hg1 <-read.table("input_hg.txt", header=TRUE);
str(input_hg1)
in_2013<-rbind(input_hg1[1957:1968,1:8], input_hg1[1957:1968,1:8], input_hg1[1957:1968,1:8], input_hg1[1957:1968,1:8], input_hg1[1957:1968,1:8],
               input_hg1[1957:1968,1:8],input_hg1[1957:1968,1:8],input_hg1[1957:1968,1:8],input_hg1[1957:1968,1:8],input_hg1[1957:1968,1:8],input_hg1[1957:1968,1:8],
               input_hg1[1957:1968,1:8])
#latest<-rbind(in_2013,in_2013,in_2013); str(latest)
#input_hg1<-rbind.data.frame(input_hg1,latest,input_hg1[1957:1968,1:8])

#setwd("C:/Users/gi/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e")
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e_morehg")
setwd('C:/Users/gi/Documents/Lavoro/SIM_finale/Anne1e_morehg_tris')

mehg_prodotto_kmol_y<-read.csv('mehg_prodotto_kmol_y_2050.csv'); str(mehg_prodotto_kmol_y)
mehg_prodotto_kmol_y_TOT<-rowSums(mehg_prodotto_kmol_y[2:4])
str(mehg_prodotto_kmol_y_TOT)
#Leggi dati
hg<-read.csv("Dissolved_Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg<-hg[3:2414,1:13]
str(hg$Oxic1)
hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hgT<-hgT[3:2414,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip =1, sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOChg<-DOChg[3:2414,1:13]

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); Phg<-Phg[3:2414,1:13]

SEDhg<-read.csv("Total_Sorbed_Divalent_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(SEDhg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); SEDhg<-SEDhg[3:2414,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); mehg<-mehg[3:2414,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOCmehg<-DOCmehg[3:2414,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); 
mehgT<-mehgT[3:2414,1:13]
str(mehgT)
hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg0<-hg0[3:2414,1:13]

solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); solids<-solids[3:2414,1:13]

burial<-read.csv("Sediment_Burial_Velocity.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(burial)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", "Suboxic1","Suboxic2",
                 "Anoxic1", "Anoxic2","Anoxic3","Sed1","Sed2"); burial<-burial[3:2414,1:13]

bulkD<-read.csv("Sediment_Bulk_Density.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(bulkD)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", "Suboxic1","Suboxic2", 
                "Anoxic1", "Anoxic2","Anoxic3","Sed1","Sed2"); bulkD<-bulkD[3:2414,1:13]


seg_outflow<-read.csv("Segment_outflow.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(seg_outflow)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", "Suboxic1","Suboxic2",
                      "Anoxic1", "Anoxic2", "Anoxic3","Sed1","Sed2"); seg_outflow<-seg_outflow[3:2414,1:13]

diss_mehg<-DOCmehg+mehg; str(diss_mehg)
diss_mehg_pM<- diss_mehg/215*1000

#OUTFLOW m3/sec
mehgT <-mehgT$Oxic1
outflow1  <-seg_outflow$Oxic1  #m3/s
outflow_m3_y<-(outflow1 *60*60*24*365)*10^6  #correzione 10^6 perche input scalato
outflow_L_y<-outflow_m3_y*1000   #m3 to L

mehgT_outflow<-outflow_L_y*mehgT     # L/y * ng/L -> ng/y
mehgT_outflow_g_y<-mehgT_outflow/10^9
mehgT_outflow_mol_y<-mehgT_outflow_g_y/215														
mehgT_outflow_kmol_y<-mehgT_outflow_mol_y/1000; str(mehgT_outflow_kmol_y)

bent_dyn<-read.csv("aasediment_input_output_mehg_2050.csv", header=TRUE); tail(bent_dyn,3);
bent_dyn_medie<-read.csv("aasediment_input_output_medie_mehg_2050.csv", header=TRUE); tail(bent_dyn_medie,3);

diffusion_kmol_y			<-bent_dyn$diffusion_kmol_y
diffusion_sed_to_sed_kmol_y	<-bent_dyn$diffusion_sed_to_sed_kmol_y
burial1_kmol_y 				<-bent_dyn$burial1_kmol_y
burial2_kmol_y 				<-bent_dyn$burial2_kmol_y
depo_Pmehg_kmol_y 		    <-bent_dyn$depo_Pmehg_kmol_y

diffusion_kmol_y_media					<-bent_dyn_medie$diffusion_kmol_y
diffusion_sed_to_sed_kmol_y_media		<-bent_dyn_medie$diffusion_sed_to_sed_kmol_y_media
burial1_kmol_y_media				    <-bent_dyn_medie$burial1_media
burial2_kmol_y_media 				    <-bent_dyn_medie$burial2_media
depo_Pmehg_kmol_y_media 			    <-bent_dyn_medie$media1_depo_kmol_y
#
#SOMMA DEI TERMINI DI OUTPUT delle ACQUE
Output_terms<-as.numeric(depo_Pmehg_kmol_y + mehgT_outflow_kmol_y); str(Output_terms); summary(Output_terms)
### variabili di input1
#time;
#atm_load_kg_d;
#river_load_hgII_kg_d;
#river_load_hgT_kg_d;
#hgT_bound_ng_l;
#mehgT_bound_ng_l;
#bound_ng_y;
#mehg_rivers;
#tot_load;
#tot_hgII
str(input_hg1)
tail(input_hg1$river_load_mehg_kg_d)
tail(input_hg1$river_load_mehg_kg_d)
river_mehg_kg_day<-as.numeric(input_hg1$river_load_mehg_kg_d*10^6); 
river_mehg_kmol_day<-river_mehg_kg_day/215; river_mehg_kmol_y<-river_mehg_kmol_day*365  #rivers and azov sea

dev.new()
str(river_mehg_kmol_y)
mean(river_mehg_kmol_y[1957:1968])
mean(tail(river_mehg_kmol_y,12))
#boundary da anno sim 2460 (1960)
inflow  <-seg_outflow$CIL*10^6  #m3/s
bound  <- 0.022; str(bound)

inflow_m3_y<-(inflow *60*60*24*365); inflow_L_y<-inflow_m3_y*1000
mehgT_inflow_g_y<-(bound *inflow_L_y)/10^9  #ngL*L/y->ng/y/10^9->g/y
mehgT_inflow_kmol_y<-mehgT_inflow_g_y/(215*1000) 

Input_terms<-(river_mehg_kmol_y + mehgT_inflow_kmol_y + 
                diffusion_kmol_y+ mehg_prodotto_kmol_y_TOT); str(Input_terms); summary(Input_terms)

str(river_mehg_kmol_y)
str(mehgT_inflow_kmol_y)
str(mehg_prodotto_kmol_y_TOT)


diffe<-(Input_terms-Output_terms); summary(diffe)
diff_media   <-tapply(diffe,rep(1:(length(diffe)/12),each = 12), mean); cumulative_diff_kmol<-cumsum(diff_media); tail(cumulative_diff_kmol,1)

input_media    <-tapply(Input_terms,rep(1:(length(Input_terms)/12),each = 12), mean)
output_media   <-tapply(Output_terms,rep(1:(length(Output_terms)/12),each = 12), mean)
Input_terms_media   <-as.numeric(input_media)
Output_terms_media  <-as.numeric(output_media)

cum_in<-cumsum(input_media); summary(cum_in)
cum_out<-cumsum(output_media); summary(cum_out)

plot(depo_Pmehg_kmol_y)
net_sed_input1<-(depo_Pmehg_kmol_y-burial1_kmol_y-diffusion_kmol_y+
                   diffusion_sed_to_sed_kmol_y) 

river_mehg_kmol_y_media    <-as.numeric(tapply(river_mehg_kmol_y,rep(1:(length(river_mehg_kmol_y)/12), each = 12), mean))
mehgT_inflow_kmol_y_media  <-as.numeric(tapply(mehgT_inflow_kmol_y,rep(1:(length(mehgT_inflow_kmol_y)/12), each = 12), mean))
mehgT_outflow_kmol_y_media <-as.numeric(tapply(mehgT_outflow_kmol_y,rep(1:(length(mehgT_outflow_kmol_y)/12), each = 12), mean))
depo_Pmehg_kmol_y_media    <-as.numeric(depo_Pmehg_kmol_y_media)
diffusion_kmol_y_media        <-as.numeric(diffusion_kmol_y_media)
diffusion_sed_to_sed_kmol_y_media<-as.numeric(diffusion_sed_to_sed_kmol_y_media)
mehg_prodotto_kmol_y_media  <-as.numeric(tapply(mehg_prodotto_kmol_y_TOT,rep(1:(length(mehg_prodotto_kmol_y_TOT)/12), each = 12), mean))

bilancio_w<-cbind(river_mehg_kmol_y_media, mehgT_inflow_kmol_y_media,diffusion_kmol_y_media,
                  burial2_kmol_y_media, mehgT_outflow_kmol_y_media, depo_Pmehg_kmol_y_media, 
                  mehg_prodotto_kmol_y_media)


bilancio_w_all<-cbind(river_mehg_kmol_y, mehgT_inflow_kmol_y,diffusion_kmol_y,
                      mehgT_outflow_kmol_y, depo_Pmehg_kmol_y, burial1_kmol_y,
                      burial2_kmol_y, mehg_prodotto_kmol_y)	  
plot(diffusion_kmol_y)
				  
write.csv(bilancio_w, file="water_input_output_mehg_1_2050")
write.csv(bilancio_w_all, file="water_input_output_long_mehg_1_2050")

bilancioacque<-(river_mehg_kmol_y_media+mehgT_inflow_kmol_y_media + diffusion_kmol_y_media -
                  mehgT_outflow_kmol_y_media - depo_Pmehg_kmol_y_media )
c1<-cumsum(bilancioacque); tail(c1)

#somma cumulativa
Pmehg_deposition_kmol_cum<-cumsum(depo_Pmehg_kmol_y_media); summary(Pmehg_deposition_kmol_cum)
mehgT_outflow_kmol_cum<-cumsum(mehgT_outflow_kmol_y_media); summary(mehgT_outflow_kmol_cum)   #outflow
mehgT_inflow_kmol_cum<-cumsum(mehgT_inflow_kmol_y_media); summary(mehgT_inflow_kmol_cum)   #inflow
river_mehg_kmol_cum<-cumsum(river_mehg_kmol_y_media); summary(river_mehg_kmol_cum)    #rivers
burial1_cum<-cumsum(burial1_kmol_y_media)
burial2_cum<-cumsum(burial2_kmol_y_media)
diffusion1_cum<-cumsum(diffusion_kmol_y_media); summary(diffusion1_cum)
diffusion2_cum<-cumsum(diffusion_sed_to_sed_kmol_y_media); summary(diffusion2_cum)
Input_terms_cum<-cumsum(Input_terms_media)
Output_terms_cum <-cumsum(Output_terms_media)

bilancio_water_cumulativo<-cbind(river_mehg_kmol_cum,
                                 mehgT_inflow_kmol_cum, Input_terms_cum,
                                   Pmehg_deposition_kmol_cum,mehgT_outflow_kmol_cum,
                                 burial1_cum, burial2_cum, diffusion1_cum, diffusion2_cum,
                                 Output_terms_cum, cumulative_diff_kmol)
write.csv(bilancio_water_cumulativo, file="bilancio_acque_mehg_1_2050.csv")
str(river_mehg_kmol_cum)

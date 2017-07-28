
#setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0")
setwd('C:/Users/Ginevra/Desktop/new_sim_BS')

input_hg1 <-read.table("input_Hg.txt", header=TRUE); str(input_hg1)
str(input_hg1$inflow_L_y)
input_hg1<-input_hg1[1:1968,]
#setwd("C:/Users/Ginevra/Dropbox/BlackSea2/implementazione/new_sim0/_met/Wh1")
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e")
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/Anne1e_morehg_tris")

#Leggi dati e taglia gli ultimi anni dopo il 2013 hg<-hg[2:1969,]
hg<-read.csv("Dissolved_Divalent_Hg.csv", skip = 1,header=FALSE, sep = ",", dec=".")
names(hg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
             "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg<-hg[2:1969,1:13]

hgT<-read.csv("Total_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hgT<-hgT[2:1969,1:13]

DOChg<-read.csv("DOC_Sorbed_Divalent_Hg.csv", header=FALSE, skip =1, sep = ",", dec=".")
names(DOChg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOChg<-DOChg[2:1969,1:13]

Phg<-read.csv("Total_Sorbed_Divalent_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(Phg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); Phg<-Phg[2:1969,1:13]

SEDhg<-read.csv("Total_Sorbed_Divalent_Hg_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(SEDhg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); SEDhg<-SEDhg[2:1969,1:13]

mehg<-read.csv("Dissolved_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
               "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); mehg<-mehg[2:1969,1:13]

DOCmehg<-read.csv("DOC_Sorbed_Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(DOCmehg)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                  "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); DOCmehg<-DOCmehg[2:1969,1:13]

mehgT<-read.csv("Methyl_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(mehgT)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); mehgT<-mehgT[2:1969,1:13]

hg0<-read.csv("Elemental_Hg.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(hg0)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
              "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); hg0<-hg0[2:1969,1:13]

solids<-read.csv("Total_Solids.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(solids)<-c("Time", "Oxic1","Oxic2", "CIL", "Oxycline","Suboxic1", "Suboxic2", 
                 "Anoxic","Anoxic2","Anoxic3","Sed1","Sed2"); solids<-solids[2:1969,1:13]
tail(solids)

seg_outflow<-read.csv("Segment_outflow.csv", header=FALSE, skip = 1,sep = ",", dec=".")
names(seg_outflow)<-c("Time", "Oxic1", "Oxic2","CIL","Oxycline", "Suboxic1","Suboxic2",
                      "Anoxic1", "Anoxic2", "Anoxic3","Sed1","Sed2"); seg_outflow<-seg_outflow[2:1969,1:13]

diss_hg<-hg+DOChg+DOCmehg+mehg+hg0; str(diss_hg)

#OUTFLOW m3/sec
hgT <-hgT$Oxic1
outflow1  <-seg_outflow$Oxic1
outflow_m3_y<-(outflow1 *60*60*24*365)*10^6  #correzione 10^6 perche input scalato
plot(outflow_m3_y); outflow_L_y<-outflow_m3_y*1000   #m3 to L

hgT_outflow<-outflow_L_y*hgT     # L/y * ng/L -> ng/y
hgT_outflow_g_y<-hgT_outflow/10^9
hgT_outflow_mol_y<-hgT_outflow_g_y/200.59														
hgT_outflow_kmol_y<-hgT_outflow_mol_y/1000; str(hgT_outflow_kmol_y)

FR<-read.csv("A_fotoreazioni1.csv", header=TRUE)
bent_dyn<-read.csv("aasediment_input_output1.csv", header=TRUE)
FR_medie<-read.csv("A_fotoreazioni_media1.csv", header=TRUE)
bent_dyn_medie<-read.csv("aasediment_input_output_medie1.csv", header=TRUE)

volat<-read.csv('volat_kmoly.csv', header=T); str(volat)
volat_mean<-read.csv('volat_media_e_cum.csv', header = T, sep=","); str(volat_mean)

tail(bent_dyn_medie,3); str(bent_dyn); str(FR); 

diffusion_kmol_y			<-bent_dyn$diffusion_kmol_y
diffusion_sed_to_sed_kmol_y	<-bent_dyn$diffusion_sed_to_sed_kmol_y
burial1_kmol_y 				<-bent_dyn$burial1_kmol_y
burial2_kmol_y 				<-bent_dyn$burial2_kmol_y
depo_Phg_kmol_y 		    <-bent_dyn$depo_Phg_kmol_y

diffusion_kmol_y_media					    <-bent_dyn_medie$diffusion_kmol_y
diffusion_sed_to_sed_kmol_y_media		<-bent_dyn_medie$diffusion_sed_to_sed_kmol_y_media
burial1_kmol_y_media				      	<-bent_dyn_medie$burial1_media
burial2_kmol_y_media 				      	<-bent_dyn_medie$burial2_media
depo_Phg_kmol_y_media 				      <-bent_dyn_medie$media1_depo_kmol_y

fotox_kmols_y	  <-FR$fotox_kmols_y
fotored_kmols_y	<-FR$fotored_kmols_y
fotodem_kmols_y	<-FR$fotodem_kmols_y
evasione_kmol_y<-volat$x

fotox_kmols_y_media	<-FR_medie$fotox_kmols_y_media
fotored_kmols_y_media	<-FR_medie$fotored_kmols_y_media
fotodem_kmols_y_media	<-FR_medie$fotodem_kmols_y_media
evasione_kmol_y_media<-volat_mean$Volat1_kmol_y_media

#SOMMA DEI TERMINI DI OUTPUT delle ACQUE
Output_terms<-as.numeric(evasione_kmol_y + depo_Phg_kmol_y + hgT_outflow_kmol_y); str(Output_terms); summary(Output_terms)

atm_hg_kg_day <- input_hg1$atm_load_kg_d*10^6; atm_hg_kg_day <-as.numeric(atm_hg_kg_day); str(atm_hg_kg_day)
atm_hg_kmol_day<-atm_hg_kg_day/200.59; atm_hg_kmol_y<-atm_hg_kmol_day*365  #depo atmosferica 
mean(tail(atm_hg_kmol_y,12))

river_hg_kg_day<-input_hg1$river_load_hgT_kg_d*10^6; river_hg_kg_day<-as.numeric(river_hg_kg_day); str(river_hg_kg_day)
river_hg_kmol_day<-river_hg_kg_day/200.59; river_hg_kmol_y<-river_hg_kmol_day*365  #rivers and azov sea

#boundary da anno sim 2460 (1960)
inflow  <-seg_outflow$CIL*10^6  #m3/s
inflow_m3_y<-(inflow *60*60*24*365); inflow_L_y<-inflow_m3_y*1000
bound  <-input_hg1$hgT_bound_ng_l; str(bound) #hgT ngL

hgT_inflow_g_y<-(bound *inflow_L_y)/10^9  #ngL*L/y->ng/y/10^9->g/y
hgT_inflow_kmol_y<-hgT_inflow_g_y/(200.59*1000) 

Input_terms<-(river_hg_kmol_y+atm_hg_kmol_y+hgT_inflow_kmol_y+diffusion_kmol_y); str(Input_terms); summary(Input_terms)
diffe<-(Input_terms-Output_terms); summary(diffe)
diff_media   <-tapply(diffe,rep(1:(length(diffe)/12),each = 12), mean); cumulative_diff_kmol<-cumsum(diff_media); tail(cumulative_diff_kmol,1)

input_media   <-tapply(Input_terms,rep(1:(length(Input_terms)/12),each = 12), mean)
output_media   <-tapply(Output_terms,rep(1:(length(Output_terms)/12),each = 12), mean)
cum_in<-cumsum(input_media); summary(cum_in)
cum_out<-cumsum(output_media); summary(cum_out)
cum_in-cum_out

net_sed_input1<-(depo_Phg_kmol_y-burial1_kmol_y-diffusion_kmol_y+diffusion_sed_to_sed_kmol_y) 

atm_hg_kmol_y_media      <-as.numeric(tapply(atm_hg_kmol_y,rep(1:(length(atm_hg_kmol_y)/12), each = 12), mean))
river_hg_kmol_y_media    <-as.numeric(tapply(river_hg_kmol_y,rep(1:(length(river_hg_kmol_y)/12), each = 12), mean))
hgT_inflow_kmol_y_media  <-as.numeric(tapply(hgT_inflow_kmol_y,rep(1:(length(hgT_inflow_kmol_y)/12), each = 12), mean))
hgT_outflow_kmol_y_media <-as.numeric(tapply(hgT_outflow_kmol_y,rep(1:(length(hgT_outflow_kmol_y)/12), each = 12), mean))
Input_terms_media             <-as.numeric(input_media)
evasione_kmol_y_media         <-as.numeric(evasione_kmol_y_media)
depo_Phg_kmol_y_media   <-as.numeric(depo_Phg_kmol_y_media)
Output_terms_media            <-as.numeric(output_media)
diffusion_kmol_y_media        <-as.numeric(diffusion_kmol_y_media)
diffusion_sed_to_sed_kmol_y_media<-as.numeric(diffusion_sed_to_sed_kmol_y_media)

bilancio_w<-cbind(atm_hg_kmol_y_media,river_hg_kmol_y_media, hgT_inflow_kmol_y_media,diffusion_kmol_y_media,
                  evasione_kmol_y_media, hgT_outflow_kmol_y_media, depo_Phg_kmol_y_media, 
                  burial1_kmol_y_media, burial2_kmol_y_media)


bilancio_w_all<-cbind(atm_hg_kmol_y,river_hg_kmol_y, hgT_inflow_kmol_y,diffusion_kmol_y,
                      evasione_kmol_y, hgT_outflow_kmol_y, depo_Phg_kmol_y, burial1_kmol_y, burial2_kmol_y, burial1_kmol_y, burial2_kmol_y)	  

write.csv(bilancio_w, file="water_input_output1")
write.csv(bilancio_w_all, file="water_input_output_long_1")

bilancioacque<-(atm_hg_kmol_y_media+river_hg_kmol_y_media+hgT_inflow_kmol_y_media + diffusion_kmol_y_media -
                  evasione_kmol_y_media- hgT_outflow_kmol_y_media - depo_Phg_kmol_y_media )
c1<-cumsum(bilancioacque); tail(c1)
tail(bilancioacque)

#somma cumulativa
evasione_kmol_cum<-cumsum(evasione_kmol_y_media); summary(evasione_kmol_cum) #evasione
atm_hg_kmol_cum<-cumsum(atm_hg_kmol_y_media); summary(atm_hg_kmol_cum)  #atmos depo #deposition to Sed
Phg_deposition_kmol_cum<-cumsum(depo_Phg_kmol_y_media); summary(Phg_deposition_kmol_cum)
hgT_outflow_kmol_cum<-cumsum(hgT_outflow_kmol_y_media); summary(hgT_outflow_kmol_cum)   #outflow
hgT_inflow_kmol_cum<-cumsum(hgT_inflow_kmol_y_media); summary(hgT_inflow_kmol_cum)   #inflow
river_hg_kmol_cum<-cumsum(river_hg_kmol_y_media); summary(river_hg_kmol_cum)    #rivers
burial1_cum<-cumsum(burial1_kmol_y_media)
burial2_cum<-cumsum(burial2_kmol_y_media)
diffusion1_cum<-cumsum(diffusion_kmol_y_media); summary(diffusion1_cum)
diffusion2_cum<-cumsum(diffusion_sed_to_sed_kmol_y_media); summary(diffusion2_cum)
Input_terms_cum<-cumsum(Input_terms_media)
Output_terms_cum <-cumsum(Output_terms_media)

bilancio_water_cumulativo<-cbind(atm_hg_kmol_cum,river_hg_kmol_cum,
                                 hgT_inflow_kmol_cum, Input_terms_cum,
                                 evasione_kmol_cum, Phg_deposition_kmol_cum,hgT_outflow_kmol_cum,
                                 burial1_cum, burial2_cum, diffusion1_cum, diffusion2_cum,
                                 Output_terms_cum)

MB_long<-data.frame(Input_terms_cum,
                    Output_terms_cum,
                    evasione_kmol_cum,
                    hgT_inflow_kmol_cum,
                    river_hg_kmol_cum,
                    Phg_deposition_kmol_cum,
                    atm_hg_kmol_cum,
                    hgT_outflow_kmol_cum,
                    burial1_cum,
                    burial2_cum,
                    diffusion1_cum,
                    diffusion2_cum)
tail(MB_long)


write.table(MB_long, file="MB_cumulativo")

write.csv(bilancio_water_cumulativo, file="bilancio_acque1.csv")

###----------------------


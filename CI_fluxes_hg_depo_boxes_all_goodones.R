setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In1/")
d6<-read.csv(file='depoohgp.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In2")
d2<-read.csv(file='depoohgp.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c")
dn1<-read.csv(file='depoohgp.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c")
dn2<-read.csv(file='depoohgp.csv', header=T)
setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c")
dn3<-read.csv(file='depoohgp.csv', header=T)
setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c")
dn4<-read.csv(file='depoohgp.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b")
dn5<-read.csv(file='depoohgp.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b")
dn6<-read.csv(file='depoohgp.csv', header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
nm2<-read.csv(file='depoohgp.csv', header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin
nm3<-read.csv(file='depoohgp.csv', header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin
nm4<-read.csv(file='depoohgp.csv', header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin
nm5<-read.csv(file='depoohgp.csv', header=T)

depo_OL<-c(d2$OLdepo_kmol_y_ok,d6$OLdepo_kmol_y_ok,
dn1$OLdepo_kmol_y_ok,dn2$OLdepo_kmol_y_ok,
dn3$OLdepo_kmol_y_ok,
dn4$OLdepo_kmol_y_ok,
dn5$OLdepo_kmol_y_ok,dn6$OLdepo_kmol_y_ok,
nm2$OLdepo_kmol_y_ok,
nm3$OLdepo_kmol_y_ok,nm4$OLdepo_kmol_y_ok,
nm5$OLdepo_kmol_y_ok)


depo_SOL<-c(d2$SOLdepo_kmol_y_ok,d6$SOLdepo_kmol_y_ok,
            dn1$SOLdepo_kmol_y_ok,dn2$SOLdepo_kmol_y_ok,
            dn3$SOLdepo_kmol_y_ok,
dn4$SOLdepo_kmol_y_ok,dn5$SOLdepo_kmol_y_ok,
dn6$SOLdepo_kmol_y_ok,
nm2$SOLdepo_kmol_y_ok,
nm3$SOLdepo_kmol_y_ok,nm4$SOLdepo_kmol_y_ok,
nm5$SOLdepo_kmol_y_ok)

            
depo_AOL<-c(d2$AOLdepo_kmol_y_ok,d6$AOLdepo_kmol_y_ok,
            dn1$AOLdepo_kmol_y_ok,dn2$AOLdepo_kmol_y_ok,
            dn3$AOLdepo_kmol_y_ok,
            dn4$AOLdepo_kmol_y_ok,
            dn5$AOLdepo_kmol_y_ok,dn6$AOLdepo_kmol_y_ok,
            nm2$AOLdepo_kmol_y_ok,
            nm3$AOLdepo_kmol_y_ok,nm4$AOLdepo_kmol_y_ok,
            nm5$AOLdepo_kmol_y_ok)

mean(depo_OL)
SE_depoOL<-sd(depo_OL)/sqrt(13)
CI_depoOL_min<-mean(depo_OL)-1.96*SE_depoOL
CI_depoOL_max<-mean(depo_OL)+1.96*SE_depoOL

mean(depo_SOL)
SE_depoSOL
SE_depoSOL<-sd(depo_SOL)/sqrt(13)
CI_depoSOL_min<-mean(depo_SOL)-1.96*
CI_depoSOL_max<-mean(depo_SOL)+1.96*SE_depoSOL

mean(depo_AOL)
SE_depoAOL<-sd(depo_AOL)/sqrt(13)
CI_depoAOL_min<-mean(depo_AOL)-1.96*SE_depoAOL
CI_depoAOL_max<-mean(depo_AOL)+1.96*SE_depoAOL

CI_depoOL_min
CI_depoOL_max
CI_depoSOL_min
CI_depoSOL_max
CI_depoAOL_min
CI_depoAOL_max

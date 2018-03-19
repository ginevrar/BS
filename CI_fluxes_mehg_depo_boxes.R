setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin
d6<-read.csv(file='depoomehgp.csv', header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin
d2<-read.csv(file='depoomehgp.csv', header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
dn2<-read.csv(file='depoomehgp.csv', header=T)
setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin
dn3<-read.csv(file='depoomehgp.csv', header=T)

colMeans(d6[3:5])
colMeans(d2[3:5])
colMeans(dn1[3:5])
colMeans(dn2[3:5])
colMeans(dn3[3:5])


depo_OL<-c(d2$OLdepo_kmol_y_ok,d6$OLdepo_kmol_y_ok,
dn3$OLdepo_kmol_y_ok,dn2$OLdepo_kmol_y_ok)



depo_SOL<-c(d2$SOLdepo_kmol_y_ok,d6$SOLdepo_kmol_y_ok,
            dn2$SOLdepo_kmol_y_ok,
            dn3$SOLdepo_kmol_y_ok)
            
            
depo_AOL<-c(d2$AOLdepo_kmol_y_ok,d6$AOLdepo_kmol_y_ok,
            dn2$AOLdepo_kmol_y_ok,
            dn3$AOLdepo_kmol_y_ok)
min(depo_OL)

SE_depoOL<-sd(depo_OL)/sqrt(4)
mean(depo_OL)
SE_depoOL
mean(depo_OL); SE_depoOL

SE_depoSOL<-sd(depo_SOL)/sqrt(4)
mean(depo_SOL)
SE_depoSOL

SE_depoAOL<-sd(depo_AOL)/sqrt(4)
mean(depo_AOL); SE_depoAOL

CI_depoOL_min
CI_depoOL_max
CI_depoSOL_min
CI_depoSOL_max
CI_depoAOL_min
CI_depoAOL_max

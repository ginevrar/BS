setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin
t6<-read.csv(file='trasformazioni.csv', header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin
t2<-read.csv(file='trasformazioni.csv', header=T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
tn2<-read.csv(file='trasformazioni.csv', header=T)

colMeans(tn2[1957:1968,])

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin
tn3<-read.csv(file='trasformazioni.csv', header=T)
str(tn3)

met_OL<-c(t2$met_kmol_y_OL[1957:1968],t6$met_kmol_y_OL[1957:1968],
           tn2$met_kmol_y_OL[1957:1968],
          tn3$met_kmol_y_OL[1957:1968])

demet_OL<-c(t2$demet_kmol_y_OL[1957:1968],
            t6$demet_kmol_y_OL[1957:1968],
          tn2$demet_kmol_y_OL[1957:1968],
          tn3$demet_kmol_y_OL[1957:1968])

met_SOL<-c(t2$met_kmol_y_SOL[1957:1968],
           t6$met_kmol_y_SOL[1957:1968],
            tn2$met_kmol_y_SOL[1957:1968],
           tn3$met_kmol_y_OL[1957:1968])
max(met_SOL)

demet_SOL<-c(t2$demet_kmol_y_SOL[1957:1968],
             t6$demet_kmol_y_SOL[1957:1968],
           tn2$demet_kmol_y_SOL[1957:1968],
           tn3$demet_kmol_y_SOL[1957:1968])

met_AOL<-c(t2$met_kmol_y_AOL[1957:1968],
           t6$met_kmol_y_AOL[1957:1968],
            tn2$met_kmol_y_AOL[1957:1968],
           tn3$met_kmol_y_AOL[1957:1968])

met_SED<-c(t2$met_kmol_y_SED[1957:1968],
           t6$met_kmol_y_SED[1957:1968],
           tn2$met_kmol_y_SED[1957:1968],
           tn3$met_kmol_y_SED[1957:1968])
str(t2)
demet_AOL<-c(t2$demet_kmol_y_AOL[1957:1968],
             t6$demet_kmol_y_AOL[1957:1968],
             tn2$demet_kmol_y_AOL[1957:1968],
             tn3$demet_kmol_y_AOL[1957:1968])

demet_SED<-c(t2$demet_kmol_y_SED[1957:1968],
             t6$demet_kmol_y_SED[1957:1968],
             tn2$demet_kmol_y_SED[1957:1968],
             tn3$demet_kmol_y_SED[1957:1968])

net_metAOL<-met_AOL-demet_AOL
SE_netmetAOL<-sd(net_metAOL)/sqrt(4)

net_metOL<-met_OL-demet_OL
SE_netmetOL<-sd(net_metOL)/sqrt(4)

net_metSOL<-met_SOL-demet_SOL
SE_netmetSOL<-sd(net_metSOL)/sqrt(4)

mean(met_OL-demet_OL); SE_netmetOL
mean(met_SOL-demet_SOL); SE_netmetSOL
mean(met_AOL-demet_AOL); SE_netmetAOL

mean(met_OL-demet_OL)+mean(met_SOL-demet_SOL)+mean(met_AOL-demet_AOL)

11.08-1.38715-7.941482

SE_metOL<-sd(met_OL)/sqrt(4)
CI_metOL_min<-mean(met_OL)-1.96*SE_metOL
CI_metOL_max<-mean(met_OL)+1.96*SE_metOL

mean(met_OL); SE_metOL

SE_metSOL<-sd(met_SOL)/sqrt(4)
CI_metSOL_min<-mean(met_SOL)-1.96*SE_metSOL
CI_metSOL_max<-mean(met_SOL)+1.96*SE_metSOL
mean(met_SOL); SE_metSOL

SE_metAOL<-sd(met_AOL)/sqrt(4)
CI_metAOL_min<-mean(met_AOL)-1.96*SE_metAOL
CI_metAOL_max<-mean(met_AOL)+1.96*SE_metAOL

mean(met_AOL); SE_metAOL

SE_metSED<-sd(met_SED)/sqrt(4)
mean(met_SED); SE_metSED

SE_demetSED<-sd(demet_SED)/sqrt(4)
mean(demet_SED); SE_demetSED

SE_demetOL<-sd(demet_OL)/sqrt(4)
CI_demetOL_min<-mean(demet_OL)-1.96*SE_demetOL
CI_demetOL_max<-mean(demet_OL)+1.96*SE_demetOL

mean(demet_OL); SE_demetOL

SE_demetSOL<-sd(demet_SOL)/sqrt(4)
CI_demetSOL_min<-mean(demet_SOL)-1.96*SE_demetSOL
CI_demetSOL_max<-mean(demet_SOL)+1.96*SE_demetSOL
mean(demet_SOL); SE_demetSOL

SE_demetAOL<-sd(demet_AOL)/sqrt(4)
CI_demetAOL_min<-mean(demet_AOL)-1.96*SE_demetAOL
CI_demetAOL_max<-mean(demet_AOL)+1.96*SE_demetAOL
mean(demet_AOL); SE_demetAOL

CI_metOL_min;CI_metOL_max
CI_demetOL_min;CI_demetOL_max

CI_metSOL_min;CI_metSOL_max
CI_demetSOL_min;CI_demetSOL_max

CI_metAOL_min;CI_metAOL_max
CI_demetAOL_min;CI_demetAOL_max

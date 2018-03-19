setwd("C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2")
d6<-read.csv(file='exchange_mehg.csv', header=T)

setwd("C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6")
d2<-read.csv(file='exchange_mehg.csv', header=T)

setwd("C:/Users/gi/Desktop/nuoveMEt3/add_sim2")
dn2<-read.csv(file='exchange_mehg.csv', header=T)

setwd("C:/Users/gi/Desktop/nuoveMEt3/add_sim3")
dn3<-read.csv(file='exchange_mehg.csv', header=T)

diffmehg_OL<-c(d2$diff_OL_kmol_y,d6$diff_OL_kmol_y,
              dn2$diff_OL_kmol_y,
              dn3$diff_OL_kmol_y)

diffmehg_SOL<-c(d2$diff_SOL_kmol_y,d6$diff_SOL_kmol_y,
               dn2$diff_SOL_kmol_y,
               dn3$diff_SOL_kmol_y)

diffmehg_Sed<-c(d2$diff_Sed_kmol_y,d6$diff_Sed_kmol_y,
               dn2$diff_Sed_kmol_y,
               dn3$diff_Sed_kmol_y)
adv_to_SOL_mehg<-c(d2$adv_to_SOL,d6$adv_to_SOL,
                  dn2$adv_to_SOL,
                  dn3$adv_to_SOL)

SE_diff_mehg_OL<-sd(diffmehg_OL)/sqrt(5)
mean(diffmehg_OL)

CI_diff_mehg_OL_max<-mean(diffmehg_OL)+1.96*SE_diff_mehg_OL
mean(diffmehg_OL); SE_diff_mehg_OL

SE_diff_mehg_SOL<-sd(diffmehg_SOL)/sqrt(5)
mean(diffmehg_SOL)

SE_diff_mehg_Sed<-sd(diffmehg_Sed)/sqrt(5)
mean(diffmehg_Sed)

CI_diff_mehg_Sed_max<-mean(diffmehg_Sed)+1.96*SE_diff_mehg_Sed
mean(diffmehg_Sed); SE_diff_mehg_Sed

SE_adv_mehg_to_SOL<-sd(adv_to_SOL_mehg)/sqrt(5)
mean(adv_to_SOL_mehg)
CI_adv_mehg_to_SOL_max<-mean(adv_to_SOL_mehg)+1.96*SE_adv_mehg_to_SOL

CI_diff_mehg_OL_min
CI_diff_mehg_OL_max
CI_diff_mehg_SOL_min
CI_diff_mehg_SOL_max
CI_diff_mehg_Sed_min
CI_diff_mehg_Sed_max

CI_adv_mehg_to_SOL_min
CI_adv_mehg_to_SOL_max

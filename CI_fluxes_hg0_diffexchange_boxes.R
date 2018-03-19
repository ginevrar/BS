setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In1");
d6<-read.csv(file='exchange_hg0.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In2")
d2<-read.csv(file='exchange_hg0.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c")
dn1<-read.csv(file='exchange_hg0.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c")
dn2<-read.csv(file='exchange_hg0.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c")
dn3<-read.csv(file='exchange_hg0.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c")
dn4<-read.csv(file='exchange_hg0.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b")
dn5<-read.csv(file='exchange_hg0.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b")
dn6<-read.csv(file='exchange_hg0.csv', header=T)

str(dn6)

diffhg0_OL<-c(d2$diff_OL_kmol_y,d6$diff_OL_kmol_y,
           dn1$diff_OL_kmol_y,dn2$diff_OL_kmol_y,
           dn3$diff_OL_kmol_y,
           dn4$diff_OL_kmol_y,
           dn5$diff_OL_kmol_y,dn6$diff_OL_kmol_y)

diffhg0_SOL<-c(d2$diff_SOL_kmol_y,d6$diff_SOL_kmol_y,
            dn1$diff_SOL_kmol_y,dn2$diff_SOL_kmol_y,
            dn3$diff_SOL_kmol_y,
            dn4$diff_SOL_kmol_y,dn5$diff_SOL_kmol_y,
            dn6$diff_SOL_kmol_y)

diffhg0_Sed<-c(d2$diff_Sed_kmol_y,d6$diff_Sed_kmol_y,
            dn1$diff_Sed_kmol_y,dn2$diff_Sed_kmol_y,
            dn3$diff_Sed_kmol_y,
            dn4$diff_Sed_kmol_y,
            dn5$diff_Sed_kmol_y,dn6$diff_Sed_kmol_y)

adv_to_SOL_hg0<-c(d2$adv_to_SOL,d6$adv_to_SOL,
               dn1$adv_to_SOL,dn2$adv_to_SOL,
               dn3$adv_to_SOL,
               dn4$adv_to_SOL,
               dn5$adv_to_SOL,dn6$adv_to_SOL)

SE_diffhg0_OL<-sd(diffhg0_OL)/sqrt(length(diffhg0_OL))
CI_diffhg0_OL_min<-mean(diffhg0_OL)-1.96*SE_diffhg0_OL
CI_diffhg0_OL_max<-mean(diffhg0_OL)+1.96*SE_diffhg0_OL

SE_diffhg0_SOL<-sd(diffhg0_SOL)/sqrt(length(diffhg0_SOL))
CI_diffhg0_SOL_min<-mean(diffhg0_SOL)-1.96*SE_diffhg0_SOL
CI_diffhg0_SOL_max<-mean(diffhg0_SOL)+1.96*SE_diffhg0_SOL

SE_diffhg0_Sed<-sd(diffhg0_Sed)/sqrt(length(diffhg0_Sed))
CI_diffhg0_Sed_min<-mean(diffhg0_Sed)-1.96*SE_diffhg0_Sed
CI_diffhg0_Sed_max<-mean(diffhg0_Sed)+1.96*SE_diffhg0_Sed

SE_advhg0_to_SOL<-sd(adv_to_SOL)/sqrt(length(adv_to_SOL))
CI_advhg0_to_SOL_min<-mean(adv_to_SOL)-1.96*SE_advhg0_to_SOL
CI_advhg0_to_SOL_max<-mean(adv_to_SOL)+1.96*SE_advhg0_to_SOL




CI_diffhg0_OL_min
CI_diffhg0_OL_max
CI_diffhg0_SOL_min
CI_diffhg0_SOL_max
CI_diffhg0_Sed_min
CI_diffhg0_Sed_max

CI_advhg0_to_SOL_min
CI_advhg0_to_SOL_max

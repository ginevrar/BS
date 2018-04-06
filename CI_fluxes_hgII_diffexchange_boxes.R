setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In1");
d6<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In2")
d2<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c")
dn1<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c")
dn2<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c")
dn3<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c")
dn4<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b")
dn5<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b")
dn6<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6")
nm5<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2")
nm4<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/nuoveMEt3/add_sim2")
nm2<-read.csv(file='exchange_hgII.csv', header=T)

setwd("C:/Users/gi/Desktop/nuoveMEt3/add_sim3")
nm3<-read.csv(file='exchange_hgII.csv', header=T)

diff_OL<-c(d2$diff_OL_kmol_y,d6$diff_OL_kmol_y,
           dn1$diff_OL_kmol_y,dn2$diff_OL_kmol_y,
           dn3$diff_OL_kmol_y,
           dn4$diff_OL_kmol_y,
           dn5$diff_OL_kmol_y,dn6$diff_OL_kmol_y,
           nm2$diff_OL_kmol_y,
           nm3$diff_OL_kmol_y,nm4$diff_OL_kmol_y,
           nm5$diff_OL_kmol_y)

diff_SOL<-c(d2$diff_SOL_kmol_y,d6$diff_SOL_kmol_y,
            dn1$diff_SOL_kmol_y,dn2$diff_SOL_kmol_y,
            dn3$diff_SOL_kmol_y,
            dn4$diff_SOL_kmol_y,dn5$diff_SOL_kmol_y,
            dn6$diff_SOL_kmol_y,
            nm2$diff_SOL_kmol_y,
            nm3$diff_SOL_kmol_y,nm4$diff_SOL_kmol_y,
            nm5$diff_SOL_kmol_y)

diff_Sed<-c(d2$diff_Sed_kmol_y,d6$diff_Sed_kmol_y,
            dn1$diff_Sed_kmol_y,dn2$diff_Sed_kmol_y,
            dn3$diff_Sed_kmol_y,
            dn4$diff_Sed_kmol_y,
            dn5$diff_Sed_kmol_y,dn6$diff_Sed_kmol_y,
            nm2$diff_Sed_kmol_y,
            nm3$diff_Sed_kmol_y,nm4$diff_Sed_kmol_y,
            nm5$diff_Sed_kmol_y)
adv_to_SOL_hgII<-c(d2$adv_to_SOL,d6$adv_to_SOL,
                   dn1$adv_to_SOL,dn2$adv_to_SOL,
                   dn3$adv_to_SOL,
                   dn4$adv_to_SOL,
                   dn5$adv_to_SOL,dn6$adv_to_SOL,
                   nm2$adv_to_SOL,
                   nm3$adv_to_SOL,nm4$adv_to_SOL,nm5$adv_to_SOL)

SE_advhgII_to_SOL<-sd(adv_to_SOL_hgII)/sqrt(13)
CI_advhgII_to_SOL_min<-mean(adv_to_SOL_hgII)-1.96*SE_advhgII_to_SOL
CI_advhgII_to_SOL_max<-mean(adv_to_SOL_hgII)+1.96*SE_advhgII_to_SOL

mean(diff_OL)
SE_diff_OL<-sd(diff_OL)/sqrt(13)
CI_diff_OL_min<-mean(diff_OL)-1.96*SE_diff_OL
CI_diff_OL_max<-mean(diff_OL)+1.96*SE_diff_OL

SE_diff_SOL<-sd(diff_SOL)/sqrt(13)
SE_diff_SOL
mean(diff_SOL)
SE_diff_Sed<-sd(diff_Sed)/sqrt(length(diff_Sed))

mean(diff_Sed)
SE_diff_Sed

mean(diff_OL);SE_diff_OL
mean(diff_SOL);SE_diff_SOL
mean(adv_to_SOL_hgII);SE_advhgII_to_SOL
mean(diff_Sed);SE_diff_Sed

CI_diff_OL_min
CI_diff_OL_max
CI_diff_SOL_min
CI_diff_SOL_max
CI_diff_Sed_min
CI_diff_Sed_max
CI_advhgII_to_SOL_min
CI_advhgII_to_SOL_max

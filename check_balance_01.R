setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/Anne1e_morehg_tris_pristine2/0.1")

mehg_dep<-read.csv('depoomehgp.csv', header=T)
names(mehg_dep)<-c('n','data','OL','SOL','AOL')

hg_dep<-read.csv('depoohgp.csv', header=T)
names(hg_dep)<-c('n','data','OL','SOL','AOL')

hgII_ex<-read.csv('exchange_hgII.csv', header=T); str(hgII_ex)
names(hgII_ex)<-c('n','data','OL','SOL','AOL')

mehg_ex<-read.csv('exchange_mehg.csv', header=T);str(mehg_ex)
names(mehg_ex)<-c('n','data','OL','SOL','AOL')

hg0_ex<-read.csv('exchange_hg0.csv', header=T)
names(hg0_ex)<-c('n','data','OL','SOL','AOL')

atm_depo_hgii<-5.2
riv<-23
riv_m<-1
inf<-0.8
outf<-1.5
photored<-5.4
photod<-.1
net_met1=5.3-7.1
net_met2=7.7-10.3
net_met3=484-476
ev=5.2

OL_bal_hgII<-atm_depo_hgii+riv+inf-outf-photored+hgII_ex$OL-
  (hg_dep$OL-1.925)+net_met1

SOL_bal_hgII <- hgII_ex$SOL - hgII_ex$OL - (hg_dep$SOL-(10.09))   +(hg_dep$OL-1.925)  - net_met2   - 0.03
               
AOL_bal_hgII <- -hgII_ex$SOL -hgII_ex$AOL + (hg_dep$SOL-(10.09))-  
                 net_met3 - (hg_dep$AOL-1.925)

mean((hg_dep$AOL-1.925))
mean(hg_dep$SOL-(10.09))
mean((hg_dep$OL-1.925))

                
mean(OL_bal_hgII)   # balance 2013 =  OL  + 0.16 mol/y
mean(SOL_bal_hgII)   # balance 2013 = SOL + 0.03 
mean(AOL_bal_hgII)   # balance 2013 = AOL + 3 kmol/y


OL_bal_mehg<-riv_m-photod+mehg_ex$OL-mehg_dep$OL-net_met1
OL_bal_hg0<-photored+hg0_ex$OL-ev







mean(OL_bal_mehg)   # balance 2013 = + 0.16 mol/y
mean(OL_bal_hg0)   # balance 2013 = + 0.16 mol/y

hgT_bal=OL_bal_hgII+OL_bal_mehg
mean(hgT_bal)   # balance 2013 = + 0.16 mol/y


SOL_bal_mehg <-mehg_ex$SOL - mehg_ex$OL - mehg_dep$SOL + mehg_dep$OL + net_met2
SOL_bal_hg0  <- hg0_ex$SOL - hg0_ex$OL

SOL_bal_hgII+SOL_bal_mehg+SOL_bal_hg0 +12.3







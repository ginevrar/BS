#
# bilancio approssimato in kmol/y
#
#in
riv<-23
dep<-5.2
inf<-0.9 
#out
ev<-5.5
outfl<-1.4

demet_net_OL<-7.5-5.7 
demet_net_SOL<-10.8-8.3
demet_net_AOL<-485.2-493.5
###CON EDDY DEL GRAFICO VECCHIO VIENE BENE !!!

eddyOL_SOL<-1.1
eddyAOL_SOL<-10
sed_diff<-1.35
sed_diff2<-1.5

set_OL<-19.7
set_SOL<-38.4
set_AOL<-13.1

oxy<-18
red<-50

 OL_hgII <-riv+dep-ev-outfl-set_OL+0.036-eddyOL_SOL
 OL_hgII 
 ### meno reudced + oxidized?
  ## e advection from oxycline to SOL ??
 # dovrebbe essere circa -0.03
 
 SOL_hgII <-demet_net_SOL+set_OL-set_SOL+eddyAOL_SOL+eddyOL_SOL+inf-0.036
 SOL_hgII   # dovrebbe essere circa -0.02
 
 AOL_hgII <-demet_net_AOL+set_SOL+sed_diff-set_AOL-eddyAOL_SOL
 AOL_hgII    # dovrebbe essere circa 4
 
 
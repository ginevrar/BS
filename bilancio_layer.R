
#
# bilancio approssimato in kmol/y
#

### check mehg
riv<-1
dep<-5.2
inf<-0.06
#out
outfl<-0.06

met_net_OL<-5.7-7.5 
met_net_SOL<-8.3-10.8
met_net_AOL<-493.5-485.2

eddyOL_SOL<- .9
  eddyAOL_SOL<-3.9 
  sed_diff<- -0.1
set_OL<-0.7
set_SOL<-2.2
set_AOL<-2.6
  
OL_mehg <-riv-outfl-set_OL+0.000-eddyOL_SOL+met_net_OL
OL_mehg 

SOL_mehg <-met_net_SOL+set_OL-set_SOL+eddyAOL_SOL+eddyOL_SOL+inf-0.0
SOL_mehg   # d

AOL_hgII <-met_net_AOL+set_SOL+sed_diff-set_AOL-eddyAOL_SOL
AOL_hgII    # dovrebbe essere circa 4
#
#
#
#
#
## Inorganic Hg
#in
riv<-1
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
 
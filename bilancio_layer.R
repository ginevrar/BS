#
# bilancio approssimato in kmol/y
#
#in
riv<-23
dep<-5.2
inf<-0.9 
sed_diff<-6
sed_diff2<-1.5
#out
ev<-5.5
outfl<-1.4

demet_net_OL<-7.5-5.7 
demet_net_SOL<-10.8-8.3
demet_net_AOL<-485.2-493.5


###CON EDDY DEL GRAFICO VECCHIO VIENE BENE !!!

eddyOL_SOL<-4.3
eddyAOL_SOL<-12

set_OL<-19.6
set_SOL<-38.4
set_AOL<-13.1

 OL_hgII <-riv+dep+demet_net_OL-ev-outfl-set_OL-eddyOL_SOL+inf
 OL_hgII ### meno reudced + oxidized?
 ## e advection from oxycline to SOL ??
 
 eddyOL_SOL_teorica<-3.5 #+- 0.9 (inf)
 
 SOL_hgII <-demet_net_SOL+set_OL-set_SOL+eddyAOL_SOL+eddyOL_SOL
 SOL_hgII   # risulta che decresce di -3.3 kmol y
 
 AOL_hgII <-demet_net_AOL+set_SOL+sed_diff-set_AOL-eddyAOL_SOL
 AOL_hgII    # risulta che decresce di 53 kmol y. eddy diff o 
 #          # settling sovrastimati perche in realta aumenta
 ###CON EDDY DEL GRAFICO VECCHIO VIENE BENE !!!
 
 AOL_hgII <-demet_net_AOL+set_SOL+sed_diff-set_AOL-eddy_teorica_AOL_SOL
 AOL_hgII    # risulta che decresce di 53 kmol y. eddy diff o 
 
 
 eddy_teorica_AOL_SOL <-20
 
 SOL_hgII__ <-demet_net_SOL+set_OL-set_SOL+eddy_teorica_AOL_SOL + eddyOL_SOL_teorica
 SOL_hgII__   # risulta che decresce di -3.3 kmol y
 
 
setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/out_1anno")

a<-read.csv(file='var_Phg2013.csv')
rownames(a)<-c('OL','SOL','AOL')
b<-read.csv(file='var_disshgII_2013.csv')
rownames(b)<-c('OL','SOL','AOL')

a;b;a+b

# OL + 0.16; SOL + 0.03 AOL +3 kmol/y


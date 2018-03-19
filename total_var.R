setwd("C:/Users/Ginevra/Desktop/new_sim_BS/19_luglio/SIM_finale2/out_1anno")
setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin

a<-read.csv(file='var_Phg2013.csv')
rownames(a)<-c('OL','SOL','AOL')
b<-read.csv(file='var_disshgII_kmoly2013.csv')
rownames(b)<-c('OL','SOL','AOL')
a;b;
a+b

# OL + 0.16; SOL + 0.03 AOL +3 kmol/y

c<-read.csv(file='var_Pmehg2013.csv')
rownames(c)<-c('OL','SOL','AOL')
d<-read.csv(file='var_dissMehg_kmoly2013.csv')
rownames(d)<-c('OL','SOL','AOL')
c;d; 
c+d

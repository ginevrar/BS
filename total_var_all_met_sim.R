setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim1')#Fminmin
a<-read.csv(file='var_Phg2013.csv')
rownames(a)<-c('OL','SOL','AOL')
b<-read.csv(file='var_disshgII_kmoly2013.csv')
rownames(b)<-c('OL','SOL','AOL')
a;b;var_hgII_nm1<-a+b
# OL + 0.16; SOL + 0.03 AOL +3 kmol/y
c<-read.csv(file='var_Pmehg2013.csv'); rownames(c)<-c('OL','SOL','AOL')
d<-read.csv(file='var_dissMehg_kmoly2013.csv'); rownames(d)<-c('OL','SOL','AOL')
c;d; var_mehg_nm1<-c+d

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
a<-read.csv(file='var_Phg2013.csv');rownames(a)<-c('OL','SOL','AOL')
b<-read.csv(file='var_disshgII_kmoly2013.csv');rownames(b)<-c('OL','SOL','AOL')
a;b;var_hgII_nm2<-a+b

c<-read.csv(file='var_Pmehg2013.csv');rownames(c)<-c('OL','SOL','AOL')
d<-read.csv(file='var_dissMehg_kmoly2013.csv');rownames(d)<-c('OL','SOL','AOL')
c;d; var_mehg_nm2<-c+d

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin
a<-read.csv(file='var_Phg2013.csv');rownames(a)<-c('OL','SOL','AOL');b<-read.csv(file='var_disshgII_kmoly2013.csv')
rownames(b)<-c('OL','SOL','AOL')
a;b;var_hgII_nm3<-a+b

c<-read.csv(file='var_Pmehg2013.csv'); rownames(c)<-c('OL','SOL','AOL')
d<-read.csv(file='var_dissMehg_kmoly2013.csv');rownames(d)<-c('OL','SOL','AOL')
c;d; var_mehg_nm3<-c+d

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin
a<-read.csv(file='var_Phg2013.csv');rownames(a)<-c('OL','SOL','AOL');b<-read.csv(file='var_disshgII_kmoly2013.csv')
rownames(b)<-c('OL','SOL','AOL')
a;b;var_hgII_nm4<-a+b

c<-read.csv(file='var_Pmehg2013.csv'); rownames(c)<-c('OL','SOL','AOL')
d<-read.csv(file='var_dissMehg_kmoly2013.csv');rownames(d)<-c('OL','SOL','AOL')
c;d; var_mehg_nm4<-c+d

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin
a<-read.csv(file='var_Phg2013.csv');rownames(a)<-c('OL','SOL','AOL');b<-read.csv(file='var_disshgII_kmoly2013.csv')
rownames(b)<-c('OL','SOL','AOL')
a;b;var_hgII_nm5<-a+b

c<-read.csv(file='var_Pmehg2013.csv'); rownames(c)<-c('OL','SOL','AOL')
d<-read.csv(file='var_dissMehg_kmoly2013.csv');rownames(d)<-c('OL','SOL','AOL')
c;d; var_mehg_nm5<-c+d


var_mehg<-data.frame(var_mehg_nm5[,2], var_mehg_nm4[,2],
                     var_mehg_nm3[,2],
var_mehg_nm2[,2],
var_mehg_nm1[,2])

var_hg<-data.frame(var_hgII_nm5[,2],var_hgII_nm4[,2],var_hgII_nm3[,2],
            var_hgII_nm2[,2],var_hgII_nm1[,2])

var_hgT<-var_hg+var_mehg



SE_var_hgTOL<-sd(var_hgT[1,])/sqrt(5)
SE_var_hgTSOL<-sd(var_hgT[2,])/sqrt(5)
SE_var_hgTAOL<-sd(var_hgT[3,])/sqrt(5)
rowMeans(var_hgT)
SE_var_hgTOL
SE_var_hgTSOL
SE_var_hgTAOL


SE_var_hgOL<-sd(var_hg[1,])/sqrt(5)
SE_var_hgSOL<-sd(var_hg[2,])/sqrt(5)
SE_var_hgAOL<-sd(var_hg[3,])/sqrt(5)
rowMeans(var_hg)
SE_var_hgOL
SE_var_hgSOL
SE_var_hgAOL

SE_var_mehgOL<-sd(var_mehg[1,])/sqrt(5)
SE_var_mehgSOL<-sd(var_mehg[2,])/sqrt(5)
SE_var_mehgAOL<-sd(var_mehg[3,])/sqrt(5)
rowMeans(var_mehg)
SE_var_mehgOL
SE_var_mehgSOL

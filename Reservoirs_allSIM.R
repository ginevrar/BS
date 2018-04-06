setwd("C:/Users/gi/Desktop/ULTIME_hgII___/In1")
hgpool_in1<-read.csv(file='modeledPool.txt',header = T)
sedpool_in1<-read.csv(file='modeledSEdpool.txt',header = T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b")
hgpool_in1b<-read.csv(file='modeledPool.txt',header = T)
sedpool_in1b<-read.csv(file='modeledSEdpool.txt',header = T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b")
hgpool_in2b<-read.csv(file='modeledPool.txt',header = T)
sedpool_in2b<-read.csv(file='modeledSEdpool.txt',header = T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c")
hgpool_in1c<-read.csv(file='modeledPool.txt',header = T)
sedpool_in1c<-read.csv(file='modeledSEdpool.txt',header = T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c")
hgpool_in2c<-read.csv(file='modeledPool.txt',header = T)
sedpool_in2c<-read.csv(file='modeledSEdpool.txt',header = T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c")
hgpool_in3c<-read.csv(file='modeledPool.txt',header = T)
sedpool_in3c<-read.csv(file='modeledSEdpool.txt',header = T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c")
hgpool_in4c<-read.csv(file='modeledPool.txt',header = T)
sedpool_in4c<-read.csv(file='modeledSEdpool.txt',header = T)

setwd("C:/Users/gi/Desktop/ULTIME_hgII___/Centrale_NOme")
hgpool_inb<-read.csv(file='modeledPool.txt',header = T)
sedpool_inb<-read.csv(file='modeledSEdpool.txt',header = T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F6')#Fminmin
hgpool_nm5<-read.csv(file='modeledPool.txt',header = T)
sedpool_nm5<-read.csv(file='modeledSEdpool.txt',header = T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/Fosfati/F2')#Fminmin
hgpool_nm4<-read.csv(file='modeledPool.txt',header = T)
sedpool_nm4<-read.csv(file='modeledSEdpool.txt',header = T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim1')#Fminmin
hgpool_nm1<-read.csv(file='modeledPool.txt',header = T)
sedpool_nm1<-read.csv(file='modeledSEdpool.txt',header = T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim2')#Fminmin
hgpool_nm2<-read.csv(file='modeledPool.txt',header = T)
sedpool_nm2<-read.csv(file='modeledSEdpool.txt',header = T)

setwd('C:/Users/gi/Desktop/nuoveMEt3/add_sim3')#Fminmin
hgpool_nm3<-read.csv(file='modeledPool.txt',header = T)
sedpool_nm3<-read.csv(file='modeledSEdpool.txt',header = T)

hgt_pool<-data.frame(hgpool_in1[,2], hgpool_in1b[,2], hgpool_in2b[,2],  
hgpool_in1c[,2], hgpool_in2c[,2],hgpool_in3c[,2],
hgpool_in4c[,2],hgpool_inb[,2],hgpool_nm5[,2],hgpool_nm4[,2],
hgpool_nm3[,2],hgpool_nm2[,2],hgpool_nm1[,2])  

mehgt_pool<-data.frame(hgpool_in1[,3], hgpool_in1b[,3], hgpool_in2b[,3],  
                     hgpool_in1c[,3], hgpool_in2c[,3],hgpool_in3c[,3],
                     hgpool_in4c[,3],hgpool_inb[,3],hgpool_nm5[,3],hgpool_nm4[,3],
                     hgpool_nm3[,3],hgpool_nm2[,3],hgpool_nm1[,3])  

hg0_pool<-data.frame(hgpool_in1[,4], hgpool_in1b[,4], hgpool_in2b[,4],  
                     hgpool_in1c[,4], hgpool_in2c[,4],hgpool_in3c[,4],
                     hgpool_in4c[,4],hgpool_inb[,4],hgpool_nm5[,4],hgpool_nm4[,4],
                     hgpool_nm3[,4],hgpool_nm2[,4],hgpool_nm1[,4])  

hgd_pool<-data.frame(hgpool_in1[,5], hgpool_in1b[,5], hgpool_in2b[,5],  
                     hgpool_in1c[,5], hgpool_in2c[,5],hgpool_in3c[,5],
                     hgpool_in4c[,5],hgpool_inb[,5],hgpool_nm5[,5],hgpool_nm4[,5],
                     hgpool_nm3[,5],hgpool_nm2[,5],hgpool_nm1[,5])  

mehgd_pool<-data.frame(hgpool_in1[,6], hgpool_in1b[,6], hgpool_in2b[,6],  
                       hgpool_in1c[,6], hgpool_in2c[,6],hgpool_in3c[,6],
                       hgpool_in4c[,6],hgpool_inb[,6],hgpool_nm5[,6],
                       hgpool_nm4[,6],
                       hgpool_nm3[,6],hgpool_nm2[,6],hgpool_nm1[,6])  

dati_hgD_pool<-c(42.69815, 15.21933, 1761)
dati_mehgD_pool<-c(2.7, 1.16837, 361.5)

str(hg0_pool)
str(hgd_pool)
rowMeans(mehgt_pool)
rowMeans(mehgt_pool[9:13])
SE_mehg_ol<-sd(mehgt_pool[1,9:13])/sqrt(5)
SE_mehg_sol<-sd(mehgt_pool[2,9:13])/sqrt(5)
SE_mehg_aol<-sd(mehgt_pool[3,9:13])/sqrt(5)
rowMeans(mehgt_pool[9:13])
SE_mehg_ol;SE_mehg_sol;SE_mehg_aol
hgpool_in1$mod_mehg
hgpool_in1$mod_hg0


SE_mehg_ol<-sd(mehgd_pool[1,9:13])/sqrt(5)
SE_mehg_sol<-sd(mehgd_pool[2,9:13])/sqrt(5)
SE_mehg_aol<-sd(mehgd_pool[3,9:13])/sqrt(5)
mehgD<-mean(colSums(mehgd_pool[9:13]))
mehgD_SE<-sd(colSums(mehgd_pool[9:13]))/sqrt(5)
SE_mehg_ol;SE_mehg_sol;SE_mehg_aol

dati_mehgD_pool-rowMeans(mehgd_pool[9:13])
sum(rowMeans(mehgd_pool[9:13]))
colSums(mehgd_pool[9:13])
mm<-(mehgd_pool[10])
maxx<-(mehgd_pool[13])

1.1909237+0.2337428 + 5.4003707

diff1<-dati_mehgD_pool-(mehgd_pool[9])
diff2<-dati_mehgD_pool-(mehgd_pool[10])
diff3<-dati_mehgD_pool-(mehgd_pool[11])
diff4<-dati_mehgD_pool-(mehgd_pool[12])
diff5<-dati_mehgD_pool-(mehgd_pool[13])

dfmehg<-data.frame(diff1,diff2,diff3,diff4,diff5)
sd(colSums(dfmehg[,1:5]))/sqrt(5)
sd(colSums(dfmehg[,1:5]))/sqrt(5)
mean(colSums(dfmehg[,1:5]))

SE_mehgD<-sd(colSums(mehgd_pool[9:13]))/sqrt(5)
SE_mehgD<-sd(dfmehg[2,])/sqrt(5)
SE_mehgD<-sd(dfmehg[3,])/sqrt(5)

min_mod<-c(.83,0.52,239)
max_mod<-c(1.67,1.1,429.9)
dati_mehgD_pool-min_mod
1.87000   +0.64837+ 122.50000
dati_mehgD_pool-max_mod
1.03000 +  0.06837 -68.40000
mismatch_out<-c(55.42837,-67,125)
sd(mismatch_out)/sqrt(5)

SE_hg_ol<-sd(hgt_pool[1,])/sqrt(13)
SE_hg_sol<-sd(hgt_pool[2,])/sqrt(13)
SE_hg_aol<-sd(hgt_pool[3,])/sqrt(13)
rowMeans(hgt_pool)
SE_hg_ol;SE_hg_sol;SE_hg_aol

SE_dhg_ol<-sd(hgd_pool[1,9:13])/sqrt(5)
SE_dhg_sol<-sd(hgd_pool[2,9:13])/sqrt(5)
SE_dhg_aol<-sd(hgd_pool[3,9:13])/sqrt(5)
rowMeans((hgd_pool[9:13]))
mean(colSums(hgd_pool))
SE_dhg_ol;SE_dhg_sol;SE_dhg_aol

dati_hgD_pool-rowMeans(hgd_pool)
0.4843771 +  2.1989156 +140.4923813
sum(dati_hgD_pool)-sum(rowMeans(hgd_pool))
min_mod
dati_hgD_pool-(hgd_pool[,9])


SE_hg0_ol<-sd(hg0_pool[1,])/sqrt(13)
SE_hg0_sol<-sd(hg0_pool[2,])/sqrt(13)
SE_hg0_aol<-sd(hg0_pool[3,])/sqrt(13)
rowMeans(hg0_pool)
SE_hg0_ol;SE_hg0_sol;SE_hg0_aol



sedpool_nm3
sed_hg_pmol_g<-data.frame(sedpool_in1[,2], sedpool_in1b[,2], sedpool_in2b[,2],  
                     sedpool_in1c[,2], sedpool_in2c[,2],sedpool_in3c[,2],
                     sedpool_in4c[,2],sedpool_inb[,2],sedpool_nm5[,2],sedpool_nm4[,2],
                     sedpool_nm3[,2],sedpool_nm2[,2],sedpool_nm1[,2]) 

sed_mehg_pmol_g<-data.frame(sedpool_in1[,3], sedpool_in1b[,3], sedpool_in2b[,3],  
                          sedpool_in1c[,3], sedpool_in2c[,3],sedpool_in3c[,3],
                          sedpool_in4c[,3],sedpool_inb[,3],sedpool_nm5[,3],sedpool_nm4[,3],
                          sedpool_nm3[,3],sedpool_nm2[,3],sedpool_nm1[,3]) 

sed_hg_kmol_surfpool<-data.frame(sedpool_in1[,4], sedpool_in1b[,4], 
                                 sedpool_in2b[,4],  
                            sedpool_in1c[,4], sedpool_in2c[,4],
                            sedpool_in3c[,4],
                            sedpool_in4c[,4],sedpool_inb[,4],sedpool_nm5[,4],sedpool_nm4[,4],
                            sedpool_nm3[,4],sedpool_nm2[,4],sedpool_nm1[,4]) 

sed_hg_kmol_deeppool<-data.frame(sedpool_in1[1,5], sedpool_in1b[1,5], sedpool_in2b[1,5],  
                                 sedpool_in1c[1,5], sedpool_in2c[1,5],sedpool_in3c[1,5],
                                 sedpool_in4c[1,5],sedpool_inb[1,5],sedpool_nm5[1,5],sedpool_nm4[1,5],
                                 sedpool_nm3[2,4],sedpool_nm2[1,5],sedpool_nm1[1,5]) 

sed_mehg_kmol_surfpool<-data.frame(sedpool_in1[,6], sedpool_in1b[,6], sedpool_in2b[,6],  
                                 sedpool_in1c[,6], sedpool_in2c[,6],sedpool_in3c[,6],
                                 sedpool_in4c[,6],sedpool_inb[,6],sedpool_nm5[,6],
                                 sedpool_nm4[,6],
                                 sedpool_nm3[1,5], sedpool_nm2[,6],sedpool_nm1[,6]) 

sed_mehg_kmol_deeppool<-data.frame(sedpool_in1[,7], sedpool_in1b[,7], sedpool_in2b[,7],  
                                   sedpool_in1c[,7], sedpool_in2c[,7],sedpool_in3c[,7],
                                   sedpool_in4c[,7],sedpool_inb[,7],sedpool_nm5[,7],sedpool_nm4[,7],
                                   sedpool_nm3[2,5],sedpool_nm2[,7],sedpool_nm1[,7]) 


surfhg_pmol_g<-sed_hg_pmol_g[1,]
SE_surfhg<-sd(surfhg_pmol_g)/sqrt(13)
rowMeans(surfhg_pmol_g)
SE_surfhg

deephg_pmol_g<-sed_hg_pmol_g[2,]
SE_ddhg<-sd(deephg_pmol_g)/sqrt(13)
rowMeans(deephg_pmol_g)
SE_ddhg

surfmehg_pmol_g<-sed_mehg_pmol_g[1,]
SE_surfmehg<-sd(surfmehg_pmol_g)/sqrt(13)
rowMeans(surfmehg_pmol_g)
SE_surfmehg

deepmehg_pmol_g<-sed_mehg_pmol_g[2,]
SE_dmehg<-sd(deepmehg_pmol_g)/sqrt(13)
rowMeans(deepmehg_pmol_g)
SE_dmehg

surf_hg_kmol<-sed_hg_kmol_surfpool[1,]
SE_surfhgkm<-sd(surf_hg_kmol)/sqrt(13)
rowMeans(surf_hg_kmol)
SE_surfhgkm

deep_hg_kmol<-sed_hg_kmol_deeppool[1,]
SE_dhgkm<-sd(deep_hg_kmol)/sqrt(13)
rowMeans(deep_hg_kmol)
SE_dhgkm

surf_mehg_kmol<-sed_mehg_kmol_surfpool[1,]
SE_mehgkm<-sd(surf_mehg_kmol)/sqrt(13)
rowMeans(surf_mehg_kmol)
SE_mehgkm

deep_mehg_kmol<-sed_mehg_kmol_deeppool[1,]
SE_dmehgkm<-sd(deep_mehg_kmol)/sqrt(13)
rowMeans(deep_mehg_kmol)
SE_dmehgkm


SE_hg0_ol<-sd(hg0_pool[1,])/sqrt(13)
SE_hg0_sol<-sd(hg0_pool[2,])/sqrt(13)
SE_hg0_aol<-sd(hg0_pool[3,])/sqrt(13)
rowMeans(hg0_pool)
SE_hg0_ol;SE_hg0_sol;SE_hg0_aol


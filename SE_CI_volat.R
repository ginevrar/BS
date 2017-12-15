setwd("C:/Users/Ginevra/Desktop/ULTIME_hgII___/In1")
v_in1<-read.csv("volat_media_e_cum_2050.csv", header=T)
vol_in1<-v_in1$Volat1_kmol_y_media

setwd("C:/Users/Ginevra/Desktop/ULTIME_hgII___/In2")
v_in2<-read.csv("volat_media_e_cum_2050.csv", header=T)
vol_in2<-v_in2$Volat1_kmol_y_media

setwd("C:/Users/Ginevra/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In1b")
v_in1b<-read.csv("volat_media_e_cum_2050.csv", header=T)
vol_in1b<-v_in1b$Volat1_kmol_y_media

setwd("C:/Users/Ginevra/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIe/In2b")
v_in2b<-read.csv("volat_media_e_cum_2050.csv", header=T)
vol_in2b<-v_in2b$Volat1_kmol_y_media

setwd("C:/Users/Ginevra/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In1c")
v_in1c<-read.csv("volat_media_e_cum_2050.csv", header=T)
vol_in1c<-v_in1c$Volat1_kmol_y_media

setwd("C:/Users/Ginevra/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In2c")
v_in2c<-read.csv("volat_media_e_cum_2050.csv", header=T)
vol_in2c<-v_in2c$Volat1_kmol_y_media

setwd("C:/Users/Ginevra/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In3c")
v_in3c<-read.csv("volat_media_e_cum_2050.csv", header=T)
vol_in3c<-v_in3c$Volat1_kmol_y_media

setwd("C:/Users/Ginevra/Desktop/ULTIME_hgII___/IIe_IIIe_IVe/IIIe/In4c")
v_in4c<-read.csv("volat_media_e_cum_2050.csv", header=T)
vol_in4c<-v_in4c$Volat1_kmol_y_media

setwd("C:/Users/Ginevra/Desktop/ULTIME_hgII___/base")
v_inbase<-read.csv("volat_media_e_cum_2050.csv", header=T)
vol_inbase<-v_inbase$Volat1_kmol_y_media

v_2013<-c(vol_in1[164], vol_in1b[164], vol_in2b[164],vol_in1c[164],
          vol_in2c[164], vol_in3c[164], vol_in4c[164], vol_inbase[164])
mean(v_2013)
SE_vol<-sd(v_2013)/sqrt(length(v_2013))

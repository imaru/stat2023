# データ生成
# 要約量
mA<-65
mB<-70
mC<-50
mD<-70
sdA<-5
sdB<-10
sdC<-5
sdD<-10

numD<-100

datA<-rnorm(numD, mean=mA, sd=sdA)
datC<-rnorm(numD, mean=mC, sd=sdC)
datB<-datC+rnorm(numD, mean=(mB-mC)*2, sd=sdB)
datD<-mA*2-datA+rnorm(numD, mean=(mD-mA), sd=sdD)

dat<-data.frame(cbind(datA,datB,datC,datD))
boxplot(dat)

library(tidyr)
library(ggpllot2)
ldat<-tidyr::pivot_longer(dat, col=c('datA','datB','datC', 'datD'))

ggplot(data=ldat,aes(x=name,y=value))+geom_violin()

write.csv(dat,file='week4_1.csv',row.names = FALSE)                
                
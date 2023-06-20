# データ生成
# 要約量
mA<-65
mB<-70
mC<-70
mD<-70
sdA<-8
sdB<-8
sdC<-8
sdD<-12

numD<-20

datA<-sort(rnorm(numD, mean=mA, sd=sdA))
datB<-sort(rnorm(numD, mean=mB, sd=sdB))
datC<-rnorm(numD, mean=mC, sd=sdC)
datD<-rnorm(numD, mean=mD, sd=sdD)

t.test(datA,datB)
t.test(datA,datB,paired=T)
t.test(datA,datC)
t.test(datA,datD)


dat<-data.frame(cbind(datA,datB,datC,datD))
boxplot(dat)

library(tidyr)
library(ggplot2)
ldat<-tidyr::pivot_longer(dat, col=c('datA','datB','datC', 'datD'))

ggplot(data=ldat,aes(x=name,y=value))+geom_violin()

write.csv(dat,file='week7_1.csv',row.names = FALSE)                
                
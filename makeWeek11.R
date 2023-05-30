library(tidyr)
# データ生成
# 要約量
mA<-65
mB<-67
mC<-69
sdA<-6
sdB<-6
sdC<-6

numD<-20

datA<-sort(rnorm(numD, mean=mA, sd=sdA))
datB<-sort(rnorm(numD, mean=mB, sd=sdB))
datC<-sort(rnorm(numD, mean=mC, sd=sdC))

dat<-data.frame(cbind(datA,datB,datC))
boxplot(dat)
anovakun(dat,'sA',3)
write.csv(dat,file='week11_1.csv', row.names = FALSE)

dat<-tidyr::pivot_longer(dat,cols=c('datA','datB','datC'))
anovakun(dat,'As',3)
write.csv(dat,file='week10_1.csv', row.names = FALSE)



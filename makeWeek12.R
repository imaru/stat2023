library(tidyr)
# データ生成 for week10
# 要約量
mA<-65
mB<-67
mC<-69
sdA<-6
sdB<-6
sdC<-6

xdat<-seq(0,190,1)


datA<-dnorm(xdat,mean=mA, sd=sdA)
datB<-dnorm(xdat,mean=mB, sd=sdB)
datC<-dnorm(xdat,mean=mC, sd=sdC)

plot(xdat,datA,type='line')



datA

dat<-data.frame(cbind(datA,datB,datC))
boxplot(dat)
anovakun(dat,'sA',3)
write.csv(dat,file='week11_1.csv', row.names = FALSE)

dat<-tidyr__pivot_longer(dat,cols=c('datA','datB','datC'))
anovakun(dat,'As',3
write.csv(dat,file='week10_1.csv', row.names = FALSE)

# data for 復習問題11

N<-10
m_a1b1<-65
m_a1b2<-70
m_a1b3<-70
m_a2b1<-65
m_a2b2<-80
m_a2b3<-95
m_a3b1<-90
m_a3b2<-90
m_a3b3<-90
sd<-10
a1_b1<-round(rnorm(N,m_a1b1,sd))
a1_b2<-round(rnorm(N,m_a1b2,sd))
a1_b3<-round(rnorm(N,m_a1b3,sd))
a2_b1<-round(rnorm(N,m_a2b1,sd))
a2_b2<-round(rnorm(N,m_a2b2,sd))
a2_b3<-round(rnorm(N,m_a2b3,sd))
a3_b1<-round(rnorm(N,m_a3b1,sd))
a3_b2<-round(rnorm(N,m_a3b2,sd))
a3_b3<-round(rnorm(N,m_a3b3,sd))
library(tidyr)
library(ggplot2)
dat<-cbind(a1_b1,a1_b2,a1_b3,a2_b1,a2_b2,a2_b3,a3_b1,a3_b2,a3_b3)
dat<-data.frame(dat)
ldat<-tidyr::pivot_longer(data=dat, cols=c('a1_b1','a1_b2','a1_b3','a2_b1','a2_b2','a2_b3','a3_b1','a3_b2','a3_b3'), names_to = c('A','B'), names_sep = '_')
# figure
g<-ggplot(data=ldat, aes(x=A, y=value, fill=B))+geom_boxplot()
plot(g)
# anova
source('anovakun_489.txt')
anovakun(dat, 'sAB', 3, 3)

write.csv(dat,'week11_2.csv', row.names=F)

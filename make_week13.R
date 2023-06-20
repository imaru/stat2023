# data summary

n<-10000
mA<-110
mB<-100
sdA<-20
sdB<-5
gap<-50

datA<-c(rnorm(n/2, mean=mA-gap, sd=sdA),rnorm(n/2,mean=mA+gap,sd=sdA))
datB<-rnorm(n, mean=mB, sd=sdB)
datC<-datB*-1.5+rnorm(100, 250, 8)
datD<-rnorm(n, mean=mA, sd=sdA)

hist(datD)

plot(datD,datC)
cor(datB,datC)

dat<-data.frame(cbind(datA,datB,datC,datD))
write.csv(dat,file='week13_1.csv',row.names = FALSE) 

hist(datA)

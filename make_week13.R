# data summary
n<-300
mA<-60
mB<-80
mC<-80

sdA<-5
sdB<-3
sdC<-15
gapA<-10

# math<-rnorm(n, mean=mA, sd=sdA)
# phys<-math+rnorm(n, mean=mC-mA, sd=sdA)
# math[seq(1,n/2)]<-math[seq(1,n/2)]-gapA
# math[seq(n/2+1,length(math))]<-math[seq(n/2+1,length(math))]+gapA
# eng<-rnorm(n, mean=mB, sd=sdB)
# 
# dat<-data.frame(cbind(math,eng,phys))
# write.csv(dat,file='week13_1.csv',row.names = FALSE)

dat<-read.csv('week13_1.csv')
attach(dat)

label<-unique(dat[,1])
datA<-dat[dat[,1]==label[1],2]
datB<-dat[dat[,1]==label[2],2]
datC<-dat[dat[,1]==label[3],2]

print(c(mean(datA),sd(datA)))
print(c(mean(datB),sd(datB)))
print(c(mean(datC),sd(datC)))

hist(datA)
hist(datB)
hist(datC)

(90-mean(datA))/sd(datA)
(90-mean(datB))/sd(datB)
(90-mean(datC))/sd(datC)

cor(datA,datB)
cor(datA,datC)
cor(datB,datC)


# confidence interval / t test
n<-15
mA<-60
mB<-65

sdA<-10
sdB<-8

# methodA<-sort(rnorm(n, mean=mA, sd=sdA))
# methodB<-sort(rnorm(n, mean=mB, sd=sdB))
# 
# cdat<-data.frame(cbind(methodA,methodB))
# write.csv(cdat,file='week13_2.csv',row.names = FALSE) 

cdat<-read.csv('week13_2.csv')

attch(cdat)
hist(methodA)
hist(methodB)

lowerA<-mean(methodA)-sd(methodA)/sqrt(length(methodA))*qt(0.05/2,length(methodA)-1,lower.tail = F)
upperA<-mean(methodA)+sd(methodA)/sqrt(length(methodA))*qt(0.05/2,length(methodA)-1,lower.tail = F)

lowerB<-mean(methodB)-sd(methodB)/sqrt(length(methodB))*qt(0.05/2,length(methodB)-1,lower.tail = F)
upperB<-mean(methodB)+sd(methodB)/sqrt(length(methodB))*qt(0.05/2,length(methodB)-1,lower.tail = F)

print(c(mean(methodA), lowerA, upperA))
print(c(mean(methodB), lowerB, upperB))

var.test(methodA, methodB)
t.test(methodA, methodB, paired=FALSE, var.equal = TRUE)
t.test(methodA, methodB, paired=TRUE)
boxplot(cdat)

# anova
# between(2) x within(4) design
# n<-20
# 
# mP<-70
# eP<-90
# pP<-60
# sP<-80
# 
# mB<-80
# eB<-80
# pB<-50
# sB<-80
# 
# sd<-10
# 
# mathP<-rnorm(n,mean=mP,sd=sd)
# engP<-rnorm(n,mean=eP, sd=sd)
# progP<-rnorm(n,mean=pP, sd=sd)
# statP<-rnorm(n,mean=sP, sd=sd)
# 
# mathB<-rnorm(n,mean=mB,sd=sd)
# engB<-rnorm(n,mean=eB, sd=sd)
# progB<-rnorm(n,mean=pB, sd=sd)
# statB<-rnorm(n,mean=sB, sd=sd)
# 
# datP<-cbind(rep('psych',n), mathP,engP,progP,statP)
# datB<-cbind(rep('busi', n), mathB,engB,progB,statB)
# anovadat<-rbind(datP,datB)
# colnames(anovadat)<-c('division','math','eng','programing','statistics')
# anovadat<-data.frame(anovadat)
# write.csv(anovadat,file='week13_3.csv',row.names = FALSE) 

anovadat<-read.csv('week13_3.csv')
source('anovakun_489.txt')
anovakun(anovadat,'AsB',2,4)

library(tidyr)
library(ggplot2)
gdat<-tidyr::pivot_longer(anovadat, cols=c('math','eng','programing','statistics'))
gdat$value<-as.double(gdat$value)
gdat$name<-factor(gdat$name, levels=c('math','eng','programing','statistics'))
g<-ggplot(data=gdat, aes(x=division, y=value, fill=name))
# g<-g+geom_violin()
g<-g+geom_boxplot()+scale_x_discrete(limits=c('psych','busi'))
g<-g+scale_fill_discrete(limits=c('math','eng','programing','statistics'))
plot(g)

# exam 2023

# q3
dat<-read.csv('test1.csv')

boxplot(dat$time~dat$sex)

label<-unique(dat[,1])
m<-dat[dat[,1]==label[1],2]
fm<-dat[dat[,1]==label[2],2]

boxplot(m,fm)

mean(m)
sd(m)
mean(fm)
sd(fm)
min(m)

var.test(m,fm)
t.test(m,fm,alternative = 'two.sided', var.equal = F)
library(pwr)
pwr.t.test(d=0.56,power=0.8,sig.level = 0.05, alternative = 'two.sided', type='two.sample')

#q4
dat<-read.csv('test2.csv')
source('anovakun_489.txt')
anovakun(dat,'ABs',2,3)

#week12

dat<-read.csv('week10_1.csv')
source('anovakun_489.txt')
anovakun(dat,'As',3, peta=T)

# data summary
n<-300
mA<-60
mB<-80
mC<-60

sdA<-5
sdB<-3
sdC<-15
gapA<-10

math<-rnorm(n, mean=mA, sd=sdA)
phys<-math+rnorm(n, mean=mC-mA, sd=sdC-sdA)
math[seq(1,n/2)]<-math[seq(1,n/2)]-gapA
math[seq(n/2+1,length(math))]<-math[seq(n/2+1,length(math))]+gapA
eng<-rnorm(n, mean=mB, sd=sdB)

hist(math)
hist(eng)
hist(phys)

(90-mean(eng))/sd(eng)
(90-mean(math))/sd(math)
(90-mean(phys))/sd(phys)

cor(math,eng)
cor(math,phys)
cor(eng,phys)

plot(math,phys)

dat<-data.frame(cbind(math,eng,phys))
write.csv(dat,file='week13_1.csv',row.names = FALSE) 


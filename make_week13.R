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

# confidence interval
n<-15
mA<-60
mB<-65

sdA<-10
sdB<-8

methodA<-sort(rnorm(n, mean=mA, sd=sdA))
methodB<-sort(rnorm(n, mean=mB, sd=sdB))
hist(methodA)
hist(methodB)

lowerA<-mean(methodA)-sd(methodA)/sqrt(length(methodA))*qt(0.05/2,length(methodA)-1,lower.tail = F)
upperA<-mean(methodA)+sd(methodA)/sqrt(length(methodA))*qt(0.05/2,length(methodA)-1,lower.tail = F)

lowerB<-mean(methodB)-sd(methodB)/sqrt(length(methodB))*qt(0.05/2,length(methodB)-1,lower.tail = F)
upperB<-mean(methodB)+sd(methodB)/sqrt(length(methodB))*qt(0.05/2,length(methodB)-1,lower.tail = F)

print(c(lowerA, upperA))
print(c(lowerB, upperB))

t.test(methodA, methodB, paired=F, var.equal = T)
t.test(methodA, methodB, paired=T, var.equal = T)
cdat<-data.frame(cbind(methodA,methodB))
boxplot(cdat)
write.csv(cdat,file='week13_2.csv',row.names = FALSE) 


# week12

# extreamely narrow distribution

xdat<-seq(50,110,0.1)
mv<-80
sd<-0.3
ydat<-dnorm(xdat,mv,sd)
plot(xdat, ydat, type='line')

# webpower

library(WebPower)
wp.rmanova(ng=1,nm=3,f=0.25,alpha=0.05,power=0.8,type=1)

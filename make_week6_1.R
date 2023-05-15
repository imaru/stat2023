library(tidyr)
library(ggplot2)
female<-rnorm(50,mean=85,sd=5)
male<-rnorm(50, mean=80, sd=7)
binddat<-data.frame(cbind(female,male)) %>% tidyr::pivot_longer(cols=c('female','male'))
ggplot(data=binddat,aes(x=value,fill=name))+geom_histogram(position='identity',alpha=0.5)

diff<-female-male
hist(diff)

xdat<-seq(40,130,0.1)
fdat<-dnorm(xdat, mean=85, sd=5)
mdat<-dnorm(xdat, mean=80, sd=7)

gdat<-data.frame(cbind(xdat,fdat,mdat)) %>% tidyr::pivot_longer(cols=c('fdat','mdat'))
ggplot(data=gdat, aes(x=xdat, y=value,fill=name))+geom_line()

dif<-fdat-mdat
plot(xdat,dif)

plot(xdat,fdat,type='line')
plot(xdat,mdat,type='line')

x=seq(-4.5,4.5,0.1)
y=dnorm(x,mean=0,sd=1)
plot(x,y,type='line')

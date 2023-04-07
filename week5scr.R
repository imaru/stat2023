bdat<-rbinom(1000,30,1/6)
hist(bdat)

x<-seq(1,15)
y<-dbinom(x,30,1/6)
plot(x,y,type='line')


x<-seq(60,70,0.1)
y<-dnorm(x, mean=65, sd=1.07)
plot(x,y,type='line')

xn<-rnorm(10000,mean=65,sd=10)
sm<-0
ssd<-0
for (i in 1:100){
  d<-xn[((i-1)*100+1):(i*100)]
  print(d)
  sm[i]<-mean(d)
  ssd[i]<-sd(d)
}
sd(sm)
ssd[3]/10

x1<-seq(-3,3,0.01)
y1<-dnorm(x1, mean=0, sd=1)
y2<-dt(x1,10)
y3<-dt(x1,3)
y4<-dt(x1,1)

ydat<-data.frame(cbind(x1,y1,y2,y3,y4))
lydat<-tidyr::pivot_longer(ydat,col=c('y1','y2','y3','y4'))
g<-ggplot(data=lydat,aes(x=x1, y=value, color=name))
g<-g+geom_line()
plot(g)

dat<-c(67,77,58,65,85,88,64,72,66,73,81,90)
mean(dat)
tv<-qt(1-0.05/2,19)
mean(dat)+tv*sd(dat)/sqrt(20)

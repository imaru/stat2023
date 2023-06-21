# week12

# extreamely narrow distribution

xdat<-seq(50,110,0.1)
mv<-80
sd<-0.3
ydat<-dnorm(xdat,mv,sd)
plot(xdat, ydat, type='line')

# webpower

library(WebPower)
wp.anova(k=3,f=0.25,alpha=0.05, power=0.8)
wp.rmanova(ng=1,nm=3,f=0.25,alpha=0.05,power=0.8,type=1)
wp.t(d=1.0, alpha=0.05, power=0.8, type='two.sample', alternative='two.sided')
wp.t(d=1.0, alpha=0.05, power=0.8, type='one.sample', alternative = 'greater')

library(pwr)
pwr.t.test(d=1.0, sig.level=0.05,power=0.8,type='two.sample', alternative = 'greater')
pwr.t.test(d=1.0, sig.level=0.05,power=0.8,type='paired', alternative = 'greater')
pwr.t.test(d=1.0, sig.level=0.05,power=0.8,type='paired', alternative = 'two.sided')
pwr.anova.test(k=3, f=0.25, sig.level=0.05, power=0.8)

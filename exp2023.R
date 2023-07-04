# measure/exp 2023
dat<-read.csv('exp2023.csv')
boxplot(dat)
source('anovakun_489.txt')
anovakun(dat,'sA',4)

library(tidyr)
ldat<-pivot_longer(dat,cols=c('orange','blue','green','magenta'))
library(ggplot2)
ggplot(ldat, aes(x=name,y=value))+geom_violin()

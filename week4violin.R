# データ読み込み
dat <- read.csv('week3_2.csv')

# long型に変換
library(tidyr)
ldat<-tidyr::pivot_longer(dat, cols=c('setA', 'setB', 'setC'))

# graph作成
library(ggplot2)
g<-ggplot(data=ldat, aes(x=name, y=value))
g<-g+geom_violin()+stat_summary(fun = "mean",
                                 geom = "point",
                                 color = "red")
plot(g)

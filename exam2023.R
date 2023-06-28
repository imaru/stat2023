# exam 2023

q3d<-read.csv('test1.csv')
table(q3d)
dml<-q3d[q3d$sex=='male',2]
dfml<-q3d[q3d$sex=='female',2]
mean(dml)
sd(dml)
mean(dfml)
sd(dfml)

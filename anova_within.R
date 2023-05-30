dat<-data.frame(cbind(c(8,10,9,9),c(3,4,4,5),c(4,4,6,6)))

allm<-mean(as.matrix(dat))
allv<-dat-allm
cm<-apply(dat,2,mean)
sm<-apply(dat,1,mean)
cv<-cm-allm
sv<-sm-allm

cvs<-data.frame(matrix(NA,nrow(dat),ncol(dat)))
svs<-cvs
for (i in seq(1,nrow(dat))){
  cvs[i,]<-cv  
}

for (i in seq(1,ncol(dat))){
  svs[,i]<-sv  
}

err<-allv-cvs-svs

ssc<-sum(as.matrix(cvs)^2)
dfc<-length(cv)-1
msc<-ssc/dfc
sss<-sum(as.matrix(svs)^2)
dfs<-length(sv)-1
mss<-sss/dfs
sse<-sum(as.matrix(err)^2)
dfe<-dfc*dfs
mse<-sse/dfe
Fv<-msc/mse
p<-pf(Fv,dfc,dfe, lower.tail = F)

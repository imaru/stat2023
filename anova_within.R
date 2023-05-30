dat<-data.frame(cbind(c(8,10,9,9),c(3,4,4,5),c(4,4,6,6)))
allv<-dat-mean(as.matrix(dat))
cm<-apply(dat,2,mean)
sm<-apply(dat,1,mean)
cv<-

cv<-apply(dat,1,function(x){
  z<-x-cm
  return(t(z))
}
)

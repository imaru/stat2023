datA<-c(71,91,76,80,82)
datB<-c(77,93,79,80,86)
tailed<-2 # 片側のときは1, 両側のときは2

# 以下は対応なし、分散が等しいことを仮定
df<-length(datA)+length(datB)-2
hsA<-sum((datA-mean(datA))^2)
hsB<-sum((datB-mean(datB))^2)
bunshi<-mean(datA)-mean(datB)
bunbo1<-sqrt((hsA+hsB)/df)
bunbo2<-sqrt(1/length(datA)+1/length(datB))
T<-bunshi/(bunbo1*bunbo2)
p<-pt(abs(t),df,lower.tail=FALSE)*tailed
print(paste('対応なし・等分散：t(',as.character(df),')=',as.character(T),', p=',as.character(p),sep=''))

# 以下は対応あり
diff<-datA-datB
pT<-mean(diff)/sqrt(sd(diff)^2/length(diff))
pp<-pt(abs(pairedT), length(diff)-1, lower.tail=FALSE)*tailed
print(paste('対応あり：t(',as.character(length(diff)-1),')=',as.character(pT),', p=',as.character(pp),sep=''))

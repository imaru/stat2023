# データを直接入力する場合
#datA<-c(71,91,76,80,82)
#datB<-c(77,93,79,80)

# csvファイルを読み込むときは上をコメントアウトして、
# 10-22行目を検定したいデータに合わせて変えること
# wide型とlong型はどちらか"だけ"を実行すること
# この部分は1要因2水準のlong型データから各水準のデータを取り出すときにも使える

# 読み込むデータファイルを指定
dat<-read.csv('week13_2.csv')

# wide型データの場合
datA<-dat[!is.na(dat[,1]),1]
datB<-dat[!is.na(dat[,2]),2]

# long型データの場合, 水準が3以上のデータを抜き出すときにも使える
label<-unique(dat[,1])
datA<-dat[dat[,1]==label[1],2]
datB<-dat[dat[,1]==label[2],2]
# datC<-dat[dat[,1]==label[3],2]
# datD<-dat[dat[,1]==label[4],2]

# 実施したい検定に合わせて変えること
tailed<-2 # 片側のときは1, 両側のときは2

# 等分散の検定、対応なしの場合、まずはこれを実施
sds<-c(sd(datA), sd(datB))
dfs<-c(length(datA)-1, length(datB)-1)
bb<-which(max(sds)==sds)
maxi<-which(max(sds)==sds)
mini<-which(min(sds)==sds)
Fr<-sds[maxi]^2/sds[mini]^2
Fp<-pf(Fr,dfs[maxi],dfs[mini], lower.tail = F)*2
print(paste('等分散の検定: F(', as.character(dfs[maxi]), ', ', as.character(dfs[mini]), ')=', as.character(round(Fr,3)), ', p=', as.character(round(Fp,3)),sep=''))

# 対応なし、分散が等しいことを仮定（スチューデント）
s_df<-length(datA)+length(datB)-2
s_hsA<-sum((datA-mean(datA))^2)
s_hsB<-sum((datB-mean(datB))^2)
s_bunshi<-mean(datA)-mean(datB)
s_bunbo1<-sqrt((s_hsA+s_hsB)/s_df)
s_bunbo2<-sqrt(1/length(datA)+1/length(datB))
sT<-s_bunshi/(s_bunbo1*s_bunbo2)
sp<-pt(abs(sT),s_df,lower.tail=FALSE)*tailed
print(paste('対応なし・等分散：t(',as.character(s_df),')=',as.character(round(sT,3)),', p=',as.character(round(sp,3)),sep=''))

# 対応なし、分散が等しいことを仮定しない（ウェルチ）
w_bunshi<-mean(datA)-mean(datB)
w_bunbo<-sqrt(sd(datA)^2/length(datA)+sd(datB)^2/length(datB))
wT<-w_bunshi/w_bunbo
w_df_bunshi<-(sd(datA)^2/length(datA)+sd(datB)^2/length(datB))^2
w_df_bunbo_a<-sd(datA)^4/(length(datA)^2*(length(datA)-1))
w_df_bunbo_b<-sd(datB)^4/(length(datB)^2*(length(datB)-1))
w_df<-w_df_bunshi/(w_df_bunbo_a+w_df_bunbo_b)
wp<-pt(abs(wT),w_df,lower.tail=FALSE)*tailed
print(paste('対応なし：t(',as.character(round(w_df,3)),')=',as.character(round(wT,3)),', p=',as.character(round(wp,3)),sep=''))

# 対応あり
diff<-datA-datB
pT<-mean(diff)/sqrt(sd(diff)^2/length(diff))
pp<-pt(abs(pT), length(diff)-1, lower.tail=FALSE)*tailed
print(paste('対応あり：t(',as.character(length(diff)-1),')=',as.character(round(pT,3)),', p=',as.character(round(pp,3)),sep=''))

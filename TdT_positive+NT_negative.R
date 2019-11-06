###TdT and NT all use original csv, different strand

TdT<-read.csv("sample_(+)_TdT_Coverage ratios.csv",header=T)
dim(TdT)
nrow(TdT)
position<-TdT[,2]

NT<-read.csv("sample_(-)_NT_Coverage ratios.csv",header=T) ##char字符串
dim(NT)
nt<-cbind.data.frame(NT$position,NT$strand,NT$position-1,NT$position+1)

out<-as.data.frame(matrix(nrow=nrow(TdT),ncol=18)) ## create a new frame sto store output
NTposition<-NA
NTstrand<-NA
out<-cbind(TdT,NTposition,NTstrand)

i<-1
for(i in 1:nrow(TdT)) ##length of dd is rows
{
  tmp<-nt[nt[,3]<=position[i] & nt[,4]>=position[i],]
  if(nrow(tmp)==0) {out[i,17]<-NA;out[i,18]<-NA;}
  if(nrow(tmp)>0) ##means within the range
  {
    out[i,17]<-paste(tmp[,1],collapse="|")
    out[i,18]<-paste(tmp[,2],collapse="|")
  }
}

write.csv(out,file="sample_(-)_TdT-NT_compare.csv ",row.names=F)

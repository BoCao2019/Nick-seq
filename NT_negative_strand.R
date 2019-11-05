###This script use sample coverage file got from BEDTools as input, normalize the reads based on total read coverage and count and filter the position with read coverage higher than its neighborhood position. This one is for negative strand in NT part analysis. Output is a csv files containing all the position read coverage ratio data which can be directly viewed in Excel.


data1<- read.table("sample_coverage_5.tabular",header=FALSE) ## sample 5’ R1 coverage got from BEDTools, negative strand
dataF<- read.table("control_coverage_5.tabular",header=FALSE) ## control 5’ R1 coverage got from BEDTools, negative strand
data5<- read.table("control_coverage_full.tabular",header=FALSE) ## control full R1 coverage got from BEDTools, negative strand


names(data1) <- c("File.no","position","coverage1")
names(dataF) <- c("File.no","position","coverageF")
names(data5) <- c("File.no","position","coverage5")

data1$coverage1[length(data1$coverage1)]

readP<-sum(data1$coverage1)
readN<-sum(data5$coverage5)

##shift coverage2 to n-1,n+1 position

shift<-data1$coverage1
shift[1]<-0
shift[2:length(shift)]<-data1$coverage1[1:length(shift)-1]

move<-data1$coverage1
move[length(move)]<-0
move[1:length(move)-1]<-data1$coverage1[2:length(move)]

dataset<-cbind(data1,shift,move,dataF$coverageF,data5$coverage5)
names(dataset) <- c("Chro","position","coverage1","coverage_before","coverage_after","coverageF","coverage5")
data<-dataset[order(dataset[,3], decreasing = TRUE),]
##find no of coverage in file1 which is 0
i<-1 
j<-0
for (i in 1:length(shift))
{
  j<-j+1
  if (data[i,3]==4)break
}
sorted_data<-data[1:j,]

position<-sorted_data$position ##all rows_position of data
coverage1<-sorted_data$coverage1
coverage_before<-sorted_data$coverage_before
coverage_after<-sorted_data$coverage_after
coverageF<-sorted_data$coverageF
coverage5<-sorted_data$coverage5

##define ratio of Coverage2/1 and coverageF/1
C1CB<-coverage1
C1CA<-coverage1
C1CF<-coverage1
C1C5<-coverage1

i<-1
for(i in 1:j) 
{ 
  ##calculation of File1 and File 3: row n in File1/row n in file 3
  if (coverageF[i]!=0) {
    C1CF[i]<-coverage1[i]/coverageF[i]
  }
  ##calculation of File1 and File 3: row n in File1/row n in file 3
  if (coverage5[i]!=0) {
    C1C5[i]<-coverage1[i]/coverage5[i]
  }
  ##calculation of File1 and File 1: row n in File1/row n-1 in file 2  
  if (coverage_before[i]!=0) {
    C1CB[i]<-coverage1[i]/coverage_before[i]
  }
  ##calculation of File1 and File 1: row n in File1/row n+1 in file 2  
  if (coverage_after[i]!=0) {
    C1CA[i]<-coverage1[i]/coverage_after[i]
  }
  
}

#combine columns
output<-cbind(sorted_data,C1CB,C1CA,C1CF,C1C5,pos_before_15=sorted_data$position-15,pos_after_15=sorted_data$position+15,strand="-")
output<-output[output$C1CB>=1,]
output<-output[output$C1CA>=1,]
output<-cbind(output,NorC1CF=output$C1CF*readN/readP,NorC1C5=output$C1C5*readN/readP)

write.csv(output,file=" sample_(-)_NT_Coverage ratios.csv",row.names=F)

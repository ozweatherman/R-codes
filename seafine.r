seafine<-read.table(file="S:/C54117-PTSC/Data_Sources/SF017580.txt",header=FALSE,skip=8,sep="",col.names=c("Julian", "CCYYMM","DDHHmm","WD","WS","ETOT","TP","VMD", "ETTSea","TPSea","VMDSea","ETTSw","TPSw","VMDSw","MO1","MO2","HS","DMDIR","ANGSPR","INLINE"));
head(hs)
tail(hs)
dateind=seafine$CCYYMM
plot(hs)
par(mfrow=c(2,6))
for(th in seq(1.5,7.5,by=0.5)){ei<-extremalIndex(hs,threshold=th);plot(ei)}

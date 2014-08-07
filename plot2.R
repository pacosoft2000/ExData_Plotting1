data <-read.csv("household_power_consumption.txt",head=TRUE,sep=";",na.strings = "?")
data2 <- transform(data, MyTime=strptime(paste(Date,Time,sep=""),format="%d/%m/%Y %T"))
startInterval <- strptime("2007-02-01 00:00:01",format="%Y-%m-%d %T")
endtInterval <- strptime("2007-02-02 23:59:59",format="%Y-%m-%d %T")
data3 <- subset ( data2, MyTime >= startInterval & MyTime <= endtInterval)
par(cex.lab=0.8, cex.axis=0.8, cex.main=0.8, cex.sub=0.8)
par(mfcol=c(1,1))
plot(data3$MyTime, data3$Global_active_power,type="o", pch=".",xlab="",
     ylab="Global Active Power (kilowatts)",
     main="") 
dev.copy(png,'plot2.png')
dev.off()
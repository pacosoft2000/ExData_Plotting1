data <-read.csv("household_power_consumption.txt",head=TRUE,sep=";",na.strings = "?")
data2 <- transform(data, MyTime=strptime(paste(Date,Time,sep=""),format="%d/%m/%Y %T"))
startInterval <- strptime("2007-02-01 00:00:01",format="%Y-%m-%d %T")
endtInterval <- strptime("2007-02-02 23:59:59",format="%Y-%m-%d %T")
data3 <- subset ( data2, MyTime >= startInterval & MyTime <= endtInterval)
par(pch=".")
par(cex.lab=0.8, cex.axis=0.8, cex.main=0.8, cex.sub=0.8)

par(mfcol=c(2,2))
par( mar=c(3.9,4.1,2.1,1.6))
#first graph
plot(data3$MyTime, data3$Global_active_power,type="o", pch=".",xlab="",
     ylab="Global Active Power",
     main="") 
#second graph
yrange<-range(c(data3$Sub_metering_1,data3$Sub_metering_2,data3$Sub_metering_3))
plot(data3$MyTime, data3$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering",main="",ylim=yrange) 
lines(data3$MyTime, data3$Sub_metering_2,col="red")
lines(data3$MyTime,data3$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=c(2,2,2),cex=0.7)
#third graph
plot(data3$MyTime, data3$Voltage,type="o", pch=".",xlab="datetime",
     ylab="Voltage",
     main="") 
#forth graph
plot(data3$MyTime, data3$Global_reactive_power,type="o", pch=".",xlab="datetime",
     ylab="Global_reactive_power",
     main="") 
dev.copy(png,'plot4.png')
dev.off()
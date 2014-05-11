#Please set the path where household_power_Consumption is present


data=read.table("household_power_consumption.txt",sep=";")
tidydata=data[which(data$V1=="1/2/2007"|data$V1=="2/2/2007"),]
tidydata$datetime=as.POSIXct(as.character(paste(tidydata$V1,tidydata$V2)),format="%d/%m/%Y %H:%M:%S")

plot4=par(mfrow=c(2,2),mar = c(4,4,2,1), oma = c(0,0,2,0))

plot(tidydata$datetime,tidydata$V3,ylab="Global Active Power",xlab="",type="l")

plot(tidydata$datetime,tidydata$V5,xlab="datetime",ylab="Voltage",type="l")

plot3=plot(tidydata$datetime,tidydata$V7,type ="l",ylab="Energy sub metering",xlab="")
lines(tidydata$datetime,tidydata$V8,type ="l",col="red")
lines(tidydata$datetime,tidydata$V9,type ="l",col="blue")
legend("topright",cex=0.45, lty = 1,lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))  

plot(tidydata$datetime,tidydata$V4,xlab="datetime",ylab="Global reactive Power",type="l")
dev.copy(png,file="plot4.png",width=480,height=480,units="px")
dev.off

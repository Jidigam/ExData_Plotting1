#Please set the path where household_power_Consumption is present

data=read.table("household_power_consumption.txt",sep=";")
tidydata=data[which(data$V1=="1/2/2007"|data$V1=="2/2/2007"),]
tidydata$datetime=as.POSIXct(as.character(paste(tidydata$V1,tidydata$V2)),format="%d/%m/%Y %H:%M:%S")
plot3=plot(tidydata$datetime,tidydata$V7,type ="l",ylab="Energy sub metering",xlab="")
#lines(type ="l",col="black")
lines(tidydata$datetime,tidydata$V8,type ="l",col="red")
lines(tidydata$datetime,tidydata$V9,type ="l",col="blue")
legend("topright",cex=0.45, lty = 1,lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))  
dev.copy(png,file="plot3.png",width=480,height=480,units="px")
dev.off

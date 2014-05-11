#Please set the path where household_power_Consumption is present
data=read.table("household_power_consumption.txt",sep=";")
tidydata=data[which(data$V1=="1/2/2007"|data$V1=="2/2/2007"),]
tidydata$datetime=as.POSIXct(as.character(paste(tidydata$V1,tidydata$V2)),format="%d/%m/%Y %H:%M:%S")
plot1=hist(as.numeric(tidydata$V3),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power",plot=TRUE)
dev.copy(png,file="plot1.png", width = 480, height = 480, units = "px")
dev.off

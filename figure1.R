par(mfrow=c(1,1))

complete_data<-read.table(file="household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
subcomplete<-subset(complete_data, Date=="1/2/2007"| Date=="2/2/2007")
hist(x=subcomplete$Global_active_power,col="red",main=paste("Global Active Power"),xlab="Global Active Power (kilowatts)",brakes=12)

#PNG copy

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
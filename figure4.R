complete_data<-read.table(file="household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
install.packages("stringi")
library(stringi)
complete_data<-read.table(file="household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")

par(mfrow=c(2,2))

## figure 1

subcomplete<-subset(complete_data, Date=="1/2/2007"|Date=="2/2/2007")
dates<-as.character(subcomplete$Date)
times<-as.character(subcomplete$Time)
n<-dim(subcomplete)
for (i in 1:n[1]) {
  aux1<-stri_join(dates[i]," ",times[i])
  aux2<-strptime(x=aux1,format="%d/%m/%Y %H: %M: %S")
  aux3<-as.POSIXlt(aux2)
  if (i==1) {aux4<-aux3}
  else {
    aux4<-c(aux4,aux3)
  }
}

plot(x=aux4,y=subcomplete$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

## figure 2

# subcomplete<-subset(complete_data, Date=="1/2/2007"|Date=="2/2/2007")
# dates<-as.character(subcomplete$Date)
# times<-as.character(subcomplete$Time)
# n<-dim(subcomplete)
# for (i in 1:n[1]) {
#   aux1<-stri_join(dates[i]," ",times[i])
#   aux2<-strptime(x=aux1,format="%d/%m/%Y %H: %M: %S")
#   aux3<-as.POSIXlt(aux2)
#   if (i==1) {aux4<-aux3}
#   else {
#     aux4<-c(aux4,aux3)
#   }
# }

plot(x=aux4,y=subcomplete$Voltage,type="l",ylab="Voltage",xlab="datetime")


## figure 3

# dates<-as.character(subcomplete$Date)
# times<-as.character(subcomplete$Time)
# n<-dim(subcomplete)
# for (i in 1:n[1]) {
#   aux1<-stri_join(dates[i]," ",times[i])
#   aux2<-strptime(x=aux1,format="%d/%m/%Y %H: %M: %S")
#   aux3<-as.POSIXlt(aux2)
#   if (i==1) {aux4<-aux3}
#   else {
#     aux4<-c(aux4,aux3)
#   }
# }

plot(x=aux4,y=subcomplete$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")

points(x=aux4,y=subcomplete$Sub_metering_2,type="l",col="red")
points(x=aux4,y=subcomplete$Sub_metering_3,type="l",col="blue")

legend("topright",pch = "_",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## figure 4

# subcomplete<-subset(complete_data, Date=="1/2/2007"|Date=="2/2/2007")
# dates<-as.character(subcomplete$Date)
# times<-as.character(subcomplete$Time)
# n<-dim(subcomplete)
# for (i in 1:n[1]) {
#   aux1<-stri_join(dates[i]," ",times[i])
#   aux2<-strptime(x=aux1,format="%d/%m/%Y %H: %M: %S")
#   aux3<-as.POSIXlt(aux2)
#   if (i==1) {aux4<-aux3}
#   else {
#     aux4<-c(aux4,aux3)
#   }
# }

plot(x=aux4,y=subcomplete$Global_reactive_power,type="l",ylab="Global_Reactive_Power",xlab="datetime")

#PNG copy

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
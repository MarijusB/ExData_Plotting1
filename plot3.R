
library(dplyr)
library(data.table)

#data:https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption#

DataFile = read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")

dim(DataFile)
print(dim(DataFile))

names(DataFile)
print(names(DataFile))

summary(DataFile)
print(summary(DataFile))

head(DataFile, 10)
print(head(DataFile, 10))

tail(DataFile, 10)
print(tail(DataFile, 10))

replace(DataFile, '?', NaN)

subsetdata <- DataFile[DataFile$Date %in% c("1/2/2007", "2/2/2007"),]
#household global minute-averaged active power (in kilowatt)
globalActivePower <- as.numeric(subsetdata$Global_active_power)
#household global minute-averaged reactive power (in kilowatt)
globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
#minute-averaged voltage (in volt)
voltage <- as.numeric(subsetdata$Voltage)
#household global minute-averaged current intensity (in ampere)
globalIntensity <- as.numeric(subsetdata$Global_intensity)

#corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
#corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
#corresponds to an electric water-heater and an air-conditioner
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

subsetdata <- DataFile[DataFile$Date %in% c("1/2/2007", "2/2/2007"),]
DateTime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width = 480, height = 480, res=100)
plot(DateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, subMetering2, type="l", col="red")
lines(DateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


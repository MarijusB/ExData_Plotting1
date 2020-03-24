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

png("plot1.png", width = 480, heigh = 480, res=100)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kW)", ylab="Frequency")
rug(globalActivePower)
dev.off()

#boxplot(globalActivePower, main="Global Active Power", col="blue", xlab="Global Active Power (kW)", ylab="Frequency")
#rug(globalActivePower)

#boxplot(globalReactivePower, main="Global Reactive Power", col="red", xlab="Global Reactive Power (kW)", ylab="Frequency")
#rug(globalReactivePower)

#boxplot(voltage, main="Voltage", col="blue", xlab="Voltage")
#rug(voltage)

#boxplot(globalIntensity,  main="Global Intensity", col="red", xlab="Ampere")
#rug(globalIntensity)

#hist(globalIntensity, col="red", main="Global Intensity", xlab="Global Intensity",  ylab="Ampere")
#rug(globalIntensity)

#hist(globalReactivePower, col="magenta", main="Global Reactive Power", xlab="globalReactivePower", ylab="kW")
#rug(globalReactivePower)








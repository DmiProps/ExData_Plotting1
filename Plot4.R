## read data
srcdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F, na.strings = "?")

## getting subset to increase performance
hpc <- subset(srcdata, srcdata$Date == "1/2/2007" | srcdata$Date == "2/2/2007")
rm(srcdata)

## transform data and time
hpc <- transform(hpc, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

## plot
png("Plot4.png", bg = "transparent")
par(mfrow = c(2, 2))

## plot 1
with(hpc, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

## plot 2
with(hpc, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

## plot 3
with(hpc, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(hpc, points(DateTime, Sub_metering_1, type = "l"))
with(hpc, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(hpc, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "-")

## plot 4
with(hpc, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Pover"))

par(mfrow = c(1, 1))
dev.off()
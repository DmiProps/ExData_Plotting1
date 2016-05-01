## read data
srcdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F, na.strings = "?")

## getting subset to increase performance
hpc <- subset(srcdata, srcdata$Date == "1/2/2007" | srcdata$Date == "2/2/2007")
rm(srcdata)

## transform data and time
hpc <- transform(hpc, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

## plot
png("Plot3.png", bg = "transparent")
with(hpc, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(hpc, points(DateTime, Sub_metering_1, type = "l"))
with(hpc, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(hpc, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "-")
dev.off()
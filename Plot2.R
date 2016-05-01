## read data
srcdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F, na.strings = "?")

## getting subset to increase performance
hpc <- subset(srcdata, srcdata$Date == "1/2/2007" | srcdata$Date == "2/2/2007")
rm(srcdata)

## transform data and time
hpc <- transform(hpc, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

## plot
png("Plot2.png", bg = "transparent")
with(hpc, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
## read data
srcdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F, na.strings = "?")

## getting subset to increase performance
hpc <- subset(srcdata, srcdata$Date == "1/2/2007" | srcdata$Date == "2/2/2007")
rm(srcdata)

## transform data and time
hpc <- transform(hpc, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

## plot
png("Plot1.png", bg = "transparent")
hist(hpc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
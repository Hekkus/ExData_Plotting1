## plot 3 for Exploratory Data Analysis Course Project 1

## download and read the data
url <- ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
download.file(url, "data.zip")
unzip("data.zip")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## subset the dates 2007-02-01 and 2007-02-02
data2 <- subset(data, Date  == "1/2/2007" | Date == "2/2/2007")

## Date Time
data2$DateTime <- paste0(data2$Date,  sep = " ", data2$Time)
data2$DateTime <- strptime(data2$DateTime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

## png print
png(file = "plot3.png")

## plot base parameters
par(mfrow = c(1, 1), mar = c(3, 5, 1, 1))

## plot
plot(data2$DateTime, data2$Sub_metering_1, type = "l", xlab="", ylab = "Energy Sub Metering")
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red","blue"))

## device off
dev.off()

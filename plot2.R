## plot 2 for Exploratory Data Analysis Course Project 1

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
png(file = "plot2.png")

## plot base parameters
par(mfrow = c(1, 1), mar = c(3, 4, 1, 1))

## plot
plot(data2$DateTime, data2$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")

## device off
dev.off()

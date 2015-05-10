## plot 1 for Exploratory Data Analysis Course Project 1

## download and read the data
url <- ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
download.file(url, "data.zip")
unzip("data.zip")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## subset the dates 2007-02-01 and 2007-02-02
data2 <- subset(data, Date  == "1/2/2007" | Date == "2/2/2007")

## setting variable class as numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)

## png print
png(file = "plot1.png")

## plot base parameters
par(mfrow = c(1, 1), mar = c(4, 4, 1, 1))

## plot
hist(data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## device off
dev.off()
## Load Packages required
## Sqldf is used here to filter the data while reading 
## graphics for plotting
library(sqldf)
library(graphics)

## download and unzip the file to the current diretory
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","PowerConsumption.zip")
unzip("PowerConsumption.zip")

## Read the Power Consumption Data from the file only for the 1st and 2nd Feb 2007
PowerD <- read.csv.sql("household_power_consumption.txt", sql = "Select * from file where Date = '1/2/2007' OR date = '2/2/2007'",header = TRUE, sep = ";")
PowerD$DateTime <- strptime(paste(PowerD$Date,PowerD$Time,sep = ","),format="%d/%m/%Y, %H:%M:%OS")
png("plot2.png")
par(oma = c(1,1,1,1))
plot(PowerD$DateTime,PowerD$Global_active_power,type = "l",xlab = "" ,ylab = " Global Active Power (kilowatts)")
dev.off()
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
png("plot4.png")
par(oma = c(1,1,1,1))
par(mfrow=c(2,2))
plot(PowerD$DateTime,PowerD$Global_active_power,xlab="",ylab = "Global Active Power",type  = 'l')
plot(PowerD$DateTime,PowerD$Voltage,xlab="DateTime",ylab = "Voltage",type  = 'l')

plot(PowerD$DateTime,PowerD$Sub_metering_1,type = "n",xlab= "", ylab = "Energy sub metering")
points(PowerD$DateTime,PowerD$Sub_metering_1,type = "l")
points(PowerD$DateTime,PowerD$Sub_metering_2,type = "l",col = "red")
points(PowerD$DateTime,PowerD$Sub_metering_3,type = "l",col = "blue")
legend("topright",legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),col = c("black","red","blue"),lty= 1,bty = "n")

plot(PowerD$DateTime,PowerD$Global_reactive_power,xlab="Datetime",ylab = "Global Reactive Power",type  = 'l')
dev.off()
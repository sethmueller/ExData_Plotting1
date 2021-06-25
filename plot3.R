# load libraries
library(data.table)
library(lubridate)

# load in data set, assume txt file in current working directory
power <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")

# convert and filter dates
power$Date = dmy(power$Date)
power <- subset(power, Date >= "2007-02-01" & Date < "2007-02-03")

# add in date - time column
power$DateTime <- with(power, as.POSIXct( paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# store the plot into plot3.png
png(file = "plot3.png", width = 480, height = 480)
with(power, plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(power, lines(DateTime, Sub_metering_2, col = "red"))
with(power, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


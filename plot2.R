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

# store time series plot in plot2.png
png(file = "plot2.png", width = 480, height = 480)
with(power, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()

